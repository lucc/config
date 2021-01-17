#!/usr/bin/env python3

import sqlite3
import pathlib

db_path = pathlib.Path('~/.local/share/qutebrowser/history.sqlite').expanduser()
db = sqlite3.connect(db_path)
cursor = db.execute('select url, title from History')
for url, title in cursor.fetchall():
    print(url, title)
