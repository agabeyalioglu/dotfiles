return {
  -- Integrated terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<C-\\>", desc = "Toggle terminal" },
      { "<leader>tf", desc = "Float terminal" },
      { "<leader>th", desc = "Horizontal terminal" },
    },
    config = function()
      require("toggleterm").setup({
        open_mapping = "<C-\\>",
        direction = "horizontal",
        size = 15,
        shade_terminals = true,
      })
      vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Float terminal" })
      vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Horizontal terminal" })
    end,
  },

  -- Diagnostics list (like VS Code problems panel)
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
      { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer diagnostics" },
      { "<leader>xq", "<cmd>Trouble quickfix toggle<cr>", desc = "Quickfix list" },
    },
    config = true,
  },

  -- LSP progress indicator
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    config = function()
      require("fidget").setup({
        notification = { window = { winblend = 0 } },
      })
    end,
  },

  -- Better LSP UI (hover, rename, code actions)
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lspsaga").setup({
        lightbulb = { enable = false },
        symbol_in_winbar = { enable = true },
        ui = { border = "rounded" },
      })
      -- Override LSP keymaps with lspsaga versions
      vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", { desc = "Hover docs" })
      vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<cr>", { desc = "Rename" })
      vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", { desc = "Code action" })
      vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<cr>", { desc = "Outline" })
      vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<cr>", { desc = "Peek definition" })
      vim.keymap.set("n", "gD", "<cmd>Lspsaga goto_definition<cr>", { desc = "Go to definition" })
    end,
  },

  -- Quick navigation (like Ctrl+Click jumping)
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash jump" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash treesitter" },
    },
  },

  -- Better command line and notifications
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
        },
      })
    end,
  },

  -- Format on save
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    keys = {
      { "<leader>cf", function() require("conform").format({ async = true }) end, desc = "Format file" },
    },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          python = { "ruff_format" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          typescriptreact = { "prettier" },
          javascriptreact = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
          markdown = { "prettier" },
          lua = { "stylua" },
          sh = { "shfmt" },
          bash = { "shfmt" },
        },
        format_on_save = {
          timeout_ms = 1000,
          lsp_fallback = true,
        },
      })
    end,
  },

  -- Dashboard (start screen)
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("dashboard").setup({
        theme = "doom",
        config = {
          header = {
            "",
            " ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
            " ████╗  ██║██║   ██║██║████╗ ████║",
            " ██╔██╗ ██║██║   ██║██║██╔████╔██║",
            " ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
            " ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
            " ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
            "",
          },
          center = {
            { icon = "  ", desc = "Find file        ", key = "f", action = "Telescope find_files" },
            { icon = "  ", desc = "Recent files     ", key = "r", action = "Telescope oldfiles" },
            { icon = "  ", desc = "Find text        ", key = "g", action = "Telescope live_grep" },
            { icon = "  ", desc = "File tree        ", key = "e", action = "Neotree" },
            { icon = "  ", desc = "Quit             ", key = "q", action = "qa" },
          },
        },
      })
    end,
  },

  -- Auto-save
  {
    "okuuva/auto-save.nvim",
    event = { "InsertLeave", "TextChanged" },
    config = function()
      require("auto-save").setup({
        debounce_delay = 3000,
      })
    end,
  },
}
