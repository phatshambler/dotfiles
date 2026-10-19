-- Neovim config. Symlinked to ~/.config/nvim by script/bootstrap.
--
-- Plugins are installed by Neovim's built-in package manager on first launch
-- and pinned in nvim-pack-lock.json. Update them with :lua vim.pack.update()

vim.pack.add({
  'https://github.com/tomasr/molokai',
  'https://github.com/preservim/nerdtree',
  'https://github.com/ctrlpvim/ctrlp.vim',
  'https://github.com/preservim/tagbar',
})

vim.opt.number = true

vim.g.rehash256 = 1
pcall(vim.cmd.colorscheme, 'molokai')
