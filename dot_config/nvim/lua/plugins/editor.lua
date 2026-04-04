return {
  -- Git signs in gutter
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "▎" },
          change = { text = "▎" },
          delete = { text = "" },
          topdelete = { text = "" },
          changedelete = { text = "▎" },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
          end
          map("]h", gs.next_hunk, "Next hunk")
          map("[h", gs.prev_hunk, "Prev hunk")
          map("<leader>hp", gs.preview_hunk, "Preview hunk")
          map("<leader>hr", gs.reset_hunk, "Reset hunk")
          map("<leader>hb", gs.blame_line, "Blame line")
        end,
      })
    end,
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- Comment toggle
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gc", mode = { "n", "v" }, desc = "Comment toggle" },
      { "gb", mode = { "n", "v" }, desc = "Block comment" },
    },
    config = true,
  },

  -- Surround
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = true,
  },

  -- Better escape (jk to exit insert mode)
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup({ mapping = { "jk" } })
    end,
  },

  -- Todo comments
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    event = "BufReadPost",
    config = true,
  },
}
