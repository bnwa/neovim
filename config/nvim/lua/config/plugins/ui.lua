---@module 'lazy'
---@type LazySpec[]
return {
  -- Icons
  {
    'echasnovski/mini.nvim',
    version = false,
    main = 'mini.icons',
    opts= {}
  },
  -- UI router for messages and notifications
  {
    'folke/noice.nvim',
    dependencies = {
      "MunifTanjim/nui.nvim"
    },
    ---@module 'noice'
    ---@type NoiceConfig
    ---@diagnostic disable-next-line:missing-fields
    opts = {
      cmdline = {
        enabled = true,
      },
      lsp = {
        progress = {
          enabled = false
        },
        hover = {
          enabled = false
        },
        signature = {
          enabled = false
        },
        message = {
          enabled = false
        },
        documentation = {
          enabled = false
        }
      },
      messages = {
        enabled = false
      },
      notify = {
        enabled = false
      },
      popupmenu = {
        enabled = true
      },
      presets = {
        command_palette = true
      }
    }
  },
  -- magit-inspired git UI
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "ibhagwan/fzf-lua",              -- optional
    },
    ---@module 'neogit'
    ---@type NeogitConfig
    opts = {
      graph_style = 'unicode',
      integrations = {
        diffview = true,
        fzf_lua = true,
        mini_pick = false,
        telescope = false,
      }
    }
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "echasnovski/mini.icons" },
    opts = {
      'hide',
      defaults = {
        file_icons = 'mini',
      },
      winopts = {
        preview = {
          default = "bat"
        }
      }
    },
    keys = {
      { '<leader>ff', function() require('fzf-lua').git_files {} end, desc = "Find files tracked by Git" }, 
      { '<leader>fF', function() require('fzf-lua').files {} end, desc = "Find any file beneath CWD" }, 
      { '<leader>fl', function() require('fzf-lua').buffers {} end, desc = "Find open buffers" },
    },
  },
}
