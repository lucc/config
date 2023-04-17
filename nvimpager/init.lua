-- my search options
vim.o.ignorecase = true
vim.o.smartcase = true

-- add some plugins from the editor
vim.opt.runtimepath:append { "~/.local/share/nvim/site/pack/packer/opt/vim-pandoc-syntax" }
vim.opt.runtimepath:append { "~/.local/share/nvim/site/pack/packer/opt/NeoSolarized" }

-- my normal colour settings
vim.o.background = "dark"
vim.cmd.colorscheme "NeoSolarized"
vim.o.termguicolors = true

-- make it faster by not loading python
vim.g.loaded_python_provider = 1
vim.g.loaded_python3_provider = 1
