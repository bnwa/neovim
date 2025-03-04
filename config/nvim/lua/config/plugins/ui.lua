---@module 'lazy'
---@type LazySpec[]
return {
  -- Icons
  {
    'echasnovski/mini.icons',
    version = false,
    opts= {},
    config = function()
      require('mini.icons').setup()
      MiniIcons.mock_nvim_web_devicons()
    end,
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
          enabled = true
        },
        hover = {
          enabled = false
        },
        signature = {
          enabled = false
        },
        message = {
          enabled = true
        },
        documentation = {
          enabled = false
        }
      },
      messages = {
        enabled = true
      },
      notify = {
        enabled = true
      },
      popupmenu = {
        enabled = true
      },
      presets = {
        command_palette = true
      },
      routes = {
        {
          filter = {
            cmdline = true,
            ['not'] = { cmdline = 'wq?a?'}
          },
          view = 'messages'
        },
      },
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
      { '<leader>fh', function() require('fzf-lua').helptags {} end, desc = "Search Vim help" },
      { '<leader>sg', function() require('fzf-lua').live_grep {} end, desc = "Grep search at project scope" },
      { '<leader>ss', function()
          local buf = vim.api.nvim_get_current_buf()
          local lsp_clients = vim.lsp.get_clients { bufnr = buf }
          if #lsp_clients > 0 then require('fzf-lua').lsp_document_symbols {}
          else require('fzf-lua').treesitter {} end
        end, desc = "Search document symbols"
      }
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
      cmdline = {
        completion = {
          ghost_text = { enabled = false },
          menu = { auto_show = true },
        },
      },
    },
  },
  -- NB. Try MeanderingProgrammer/render-markdown.nvim if this is
  -- too troublesome
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = {},
  },
  {
    'stevearc/oil.nvim',
    lazy = false,
    dependencies = { 'echasnovski/mini.icons' },
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      columns = {
        'icon',
        -- "permissions",
        -- "size",
        -- "mtime",
      },
      default_file_explorer = true,
      delete_to_trash = true,
      git = {
        add = function(path) return true end,
        mv = function(src_path, dest_path) return true end,
        rm = function(path) return true end,
      },
      preview_win = {
        disable_preview = function(filename)
          local is_log = string.match(filename, 'log') ~= nil
          if is_log then return false
          else return true end
        end,
      },
    },
    keys = {
      {
        '<leader>ee',
        function()
          require('oil').toggle_float(vim.fn.getcwd())
        end,
        desc = "Open Oil file explorer on CWD"
      },
      {
        '<leader>eb',
        function()
          local buf = vim.api.nvim_get_current_buf()
          local path = vim.api.nvim_buf_get_name(buf)
          require('oil').toggle_float(vim.fn.fnamemodify(path, ':p:h'))
        end,
        desc = "Open Oil file explorer on CWD"
      }
    },
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
      direction = 'float',
      float_opts = {
        border = 'rounded',
        title_pos = 'center',
      },
      open_mapping = [[<C-\>]],
    },
  },
  {
    "lukas-reineke/virt-column.nvim",
    opts = {
      char = "▕",
      virtcolumn = '66'
    }
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'echasnovski/mini.icons' },
    opts = {
      options = {
        component_separators = { left = '', right = '' },
        globalstatus = true,
        ignore_focus = {
          'netrw',
        },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          'mode'
        },
        lualine_b = {
          'branch',
          'diff',
          { 'diagnostics', colored = true, sources = { 'nvim_lsp' } }
        },
        lualine_c = {
          {
            'filename',
            newfile_status = true, -- Display 'new file status
            path = 1, -- relative path
          },
        },
        lualine_x = {
          require('lazy.status').updates,
          'encoding',
          'fileformat',
          {'filetype', colored = false, }
        },
        lualine_y = {
          'progress'
        },
        lualine_z = {
          'location'
        },
      },
    },
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = {},
  },
  {
    'kevinhwang91/nvim-bqf',
    opts = {
      auto_resize_height = true,
      wrap = true,
    },
    keys = {
      {
        '<leader>xx',
        function()
          local buf = vim.api.nvim_get_current_buf()
          local issues = vim.diagnostic.get(buf)
          local qf_items = vim.diagnostic.toqflist(issues)
          vim.fn.setqflist(qf_items, 'r')
        end,
        desc = "List diagnostics for buffer in quickfix via nvim-bqf",
      },
      {
        '<leader>xX',
        function()
          vim.diagnostic.setqflist {}
        end,
        desc = "List workspace diagnostics in quickfix via nvim-bqf",
      },
    }
  },
  {
    'rafcamlet/nvim-luapad',
    opts = {
      eval_on_change = false,
      wipe = false,
    }
  }
}
