local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- use space as a the leader key
vim.g.mapleader = ' '

return require('packer').startup(function(use)
  use "EdenEast/nightfox.nvim"

  vim.cmd("colorscheme carbonfox")

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} },
  }

  require('telescope').setup{
    defaults = {
      -- Default configuration for telescope goes here:
      -- config_key = value,
      mappings = {
        i = {
          -- map actions.which_key to <C-h> (default: <C-/>)
          -- actions.which_key shows the mappings for your picker,
          -- e.g. git_{create, delete, ...}_branch for the git_branches picker
          ["<C-h>"] = "which_key"
        }
      }
    },
    pickers = {
      -- Default configuration for builtin pickers goes here:
      -- picker_name = {
      --   picker_config_key = value,
      --   ...
      -- }
      -- Now the picker_config_key will be applied every time you call this
      -- builtin picker
    },
    extensions = {
      -- Your extension configuration goes here:
      -- extension_name = {
      --   extension_config_key = value,
      -- }
      -- please take a look at the readme of the extension you want to configure
    }
  }

  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
      }
    end
  }

  local wk = require("which-key")
  wk.register({
    f = {
      name = "file",
      f = {":Telescope find_files<cr>", "find"},
      g = {":Telescope live_grep<cr>", "grep"},
      s = { ":w<cr>", "save" },
    },
    b = {
      name = "buffer",
      b = {":Telescope buffers<cr>", "buffers"},
      t = {":Telescope current_buffer_tags<cr>", "tags"},
      s = {":Telescope current_buffer_fuzzy_find<cr>", "search"},
    },
    c = {
      name = "config",
      e = {":e .config/nvim/init.lua<cr>", "edit"},
      o = {":Telescope vim_options<cr>", "options"},
    },
    e = {
      name = "edit",
      s = {":Telescope spell_suggest<cr>", "spelling"},
    },
    g = {
      name = "git",
      b = {":Telescope git_branches<cr>", "branches"},
      B = {":Telescope git_bcommits<cr>", "buffer commits"},
      c = {":Telescope git_commits<cr>", "commits"},
      f = {":Telescope git_files<cr>", "files"},
      s = {":Telescope git_status<cr>", "status"},
      S = {":Telescope git_stash<cr>", "stash"},
    },
    h = {
      name = "help",
      m = {":Telescope man_pages<cr>", "man"},
      t = {":Telescope help_tags<cr>", "tags"},
    },
    l = {
      name = "lsp",
      d = {":Telescope lsp_definitions<cr>", "definitions"},
      h = {":Telescope lsp_document_symbols<cr>", "documentation in buffer"},
      H = {":Telescope lsp_workspace_symbols<cr>", "documentation in worksapce"},
      e = {":Telescope diagnostics<cr>", "errors"},
      i = {":Telescope lsp_incoming_calls<cr>", "incoming calls"},
      o = {":Telescope lsp_outgoing_calls<cr>", "outgoing calls"},
      r = {":Telescope lsp_references<cr>", "references"},
      t = {":Telescope lsp_type_definitions<cr>", "type definitions"},
    },
    q = { ":q<cr>", "quit" },
    r = {
      name = "recent",
      f = { ":Telescope oldfiles<cr>", "files" },
      c = { ":Telescope command_history<cr>", "commands" },
      s = { ":Telescope search_history<cr>", "searches" },
      q = {":Telescope quickfixhistory<cr>", "quickfix"},
    },
    t = {
      name = "telescope",
      a = {":Telescope autocommands<cr>", "autocommands"},
      c = {":Telescope colorscheme<cr>", "colorscheme"},
      f = {":Telescope filetypes<cr>", "filetypes"},
      h = {":Telescope highlights<cr>", "highlights"},
      j = {":Telescope jumplist<cr>", "jumplist"},
      k = {":Telescope keymaps<cr>", "keymaps"},
      l = {":Telescope loclist<cr>", "loclist"},
      L = {":Telescope reloader<cr>", "lua modules"},
      m = {":Telescope marks<cr>", "marks"},
      p = {":Telescope builtin<cr>", "pickers"},
      P = {":Telescope planets<cr>", "planets"},
      q = {":Telescope quickfix<cr>", "quickfix"},
      r = {":Telescope registers<cr>", "registers"},
      s = {":Telescope symbols<cr>", "telescope symbols"},
      t = {":Telescope treesitter<cr>", "treesitter"},
    },
    s = {
      name = "search",
      w = {":Telescope grep_string<cr>", "word"}
    },
    x = { ":Telescope commands<cr>", "execute" },
  }, { prefix = "<leader>" })

  if packer_bootstrap then
    require('packer').sync()
  end
end)
