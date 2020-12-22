" my search options
set ignorecase
set smartcase

" add some plugins from the editor
set runtimepath+=~/.local/share/nvim/plugins/vim-colors-solarized
set runtimepath+=~/.local/share/nvim/plugins/vim-pandoc-syntax
set runtimepath+=~/.local/share/nvim/plugins/NeoSolarized

" my normal colour settings
set background=dark
colorscheme NeoSolarized
set termguicolors

" make it faster by not loading python
let g:loaded_python_provider = 1
let g:loaded_python3_provider = 1

" try stuff for issue 21 (follow file like tail -f)
set autoread
"autocmd CursorHold * checktime
call timer_start(300, {id -> nvim_command("silent checktime")}, {"repeat": -1})
