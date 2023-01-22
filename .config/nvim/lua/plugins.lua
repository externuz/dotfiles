local is_vscode = vim.g.vscode == 1

return require('packer').startup(function(use)
  use { 
    'wbthomason/packer.nvim',
    disable = is_vscode
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    disable = is_vscode
  }
  use {
    'nvim-telescope/telescope.nvim',
    disabled = is_vscode,
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'nvim-telescope/telescope-file-browser.nvim',
    disable = is_vscode
  }
  use({
    'projekt0n/github-nvim-theme',
    disable = is_vscode,
    tag = 'v0.0.7',
    config = function()
      require('github-theme').setup({})
    end
  })
  use {
    'neoclide/coc.nvim',
    disable = is_vscode,
    branch = 'release'
  }
end)
