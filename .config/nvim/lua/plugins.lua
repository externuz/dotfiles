return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({
    'projekt0n/github-nvim-theme', tag = 'v0.0.7',
    config = function()
      require('github-theme').setup({})
    end
  })
  use ({
    'neoclide/coc.nvim', branch = 'release'
  })
end)
