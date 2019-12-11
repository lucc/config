// Javascript functions for vimperator by luc.

function ShellEscape(string) {
  return "'" + string.replace(/'/g, "'\''") + "'"
}

function EscapedURL() {
  return ShellEscape(buffer.URL.toString())
}

function SwitchTDL(url, tdl) {
  return url.replace(/\.[a-zA-Z]+\//, '.'+tdl+'/')
}

window.ShellEscape = ShellEscape;
window.EscapedURL = EscapedURL;
window.SwitchTDL = SwitchTDL;
