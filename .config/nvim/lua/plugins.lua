local nocode = function()
  return vim.fn.exists('g:vscode') == 0
end

return require('packer').startup(function(use)
  use { 
    'wbthomason/packer.nvim',
    cond = { nocode }
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    cond = { nocode }
  }
  use {
    'nvim-telescope/telescope.nvim',
    cond = { nocode },
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'nvim-telescope/telescope-file-browser.nvim',
    cond = { nocode }
  }
  use {
    'xiyaowong/nvim-transparent'
  }
  use {
    'projekt0n/github-nvim-theme',
    cond = { nocode },
    tag = 'v0.0.7',
    config = function()
      require('github-theme').setup({})
    end
  }
  use {
    'neoclide/coc.nvim',
    cond = { nocode },
    branch = 'release'
  }
end)
