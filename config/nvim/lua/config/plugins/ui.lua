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
      fzf_colors = true,
      fzf_opts = {
        ['--cycle'] = true,
      },
      -- winopts = {
      --   preview = {
      --     default = "bat"
      --   }
      -- }
    },
    keys = {
      { '<leader>ff', function() require('fzf-lua').git_files {} end, desc = "Find files tracked by Git" }, 
      { '<leader>fF', function() require('fzf-lua').files {} end, desc = "Find any file beneath CWD" }, 
      { '<leader>fl', function() require('fzf-lua').buffers {} end, desc = "Find open buffers" },
    },
  },
  {
    'saghen/blink.cmp',
    version = '*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'normal',
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 250,
        },
        menu = {
          draw = {
            treesitter = { 'lsp' },
          },
        },
      },
      signature = { enabled = true },
      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets' },
      },
      keymap = {
        preset = 'enter',
      },
    },
  },
}
