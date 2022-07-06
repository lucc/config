" my search options
set ignorecase
set smartcase

" add some plugins from the editor
set runtimepath+=~/.local/share/nvim/site/pack/packer/opt/vim-pandoc-syntax
set runtimepath+=~/.local/share/nvim/site/pack/packer/opt/NeoSolarized

" my normal colour settings
set background=dark
colorscheme NeoSolarized
set termguicolors

" make it faster by not loading python
let g:loaded_python_provider = 1
let g:loaded_python3_provider = 1
