-- Don't do anything in non-vscode instances
if not vim.g.vscode then return {} end

-- A list of known working plugins with vscode-neovim, update with your own plugins

local plugins = {
  "lazy.nvim",
  "AstroNvim",
  "astrocore",
  "astroui",
  "Comment.nvim",
  "nvim-autopairs",
  "nvim-treesitter",
  "nvim-ts-autotag",
  "nvim-treesitter-text-objects",
  "nvim-ts-context-commentstring",
}

local Config = require "lazy.core.config"

-- disable plugin update checking:
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false

-- Replace the default `cond`
Config.options.defaults.cond = function(plugin) return vim.tbl_contains(plugins, plugin.name) end

---@type LazySpec
return {
  -- add a few key bindings:
  {
    "AstroNvim/astrocore",
    ---@type AstrCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>ff"] = "<CMD>Find<CR>",
          ["<Leader>fw"] = "<CMD>call VSCodeNotify('workbench.action.findInFiles')<CR>",
          ["<Leader>ls"] = "<CMD>call VSCodeNotify('workbench.action.gotoSymbol')<CR>",
          ["<Leader>/"] = "<CMD>call VSCodeNotify('editor.action.commentLine')<CR>",
        },
      },
    },
  },

  -- enable/disable colrscheme setting
  { "AstroNvim/astroui", opts = { colorscheme = false } },
  -- enable/disable treesitter highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { highlight = { enable = false } },
  },
}
