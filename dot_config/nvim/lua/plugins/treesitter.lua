return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "python", "typescript", "tsx", "javascript",
          "json", "yaml", "toml", "html", "css", "bash",
          "markdown", "markdown_inline", "swift", "kotlin",
          "java", "go", "rust", "dockerfile", "sql", "vim",
          "vimdoc", "gitcommit", "diff",
        },
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })
    end,
  },
}
