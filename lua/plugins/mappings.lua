return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"

          -- NEOCLIP
          ["<Leader>pp"] = { "<cmd>Telescope neoclip<cr>", desc = "Open neoclip buffer" },

          -- CHEATSHEET
          ["<Leader>ch"] = { "<cmd>Cheatsheet<cr>", desc = "Open Cheatsheet buffer" },

          -- OBSIDIAN
          ["<Leader>oo"] = { "<cmd>ObsidianSearch<cr>", desc = "Open Obsidian Search" },
          ["<Leader>os"] = { "<cmd>ObsidianQuickSwitch<cr>", desc = "Open Obsidian Quick Switcher" },
          ["<Leader>on"] = { "<cmd>ObsidianNew<cr>", desc = "Create Obsidian New Note" },
          ["<Leader>op"] = { "<cmd>ObsidianPasteImg<cr>", desc = "Paste image from clipboard" },
          ["<Leader>ob"] = { "<cmd>ObsidianBacklinks<cr>", desc = "Show location list of backlinks" },
          ["<Leader>ot"] = { "<cmd>ObsidianTemplate<cr>", desc = "Choose a template" },
          -- Choose a buffer to close
          ["<Leader>bD"] = {
            function()
              require("astroui.status").heirline.buffer_picker(
                function(bufnr) require("astrocore.buffer").close(bufnr) end
              )
            end,
            desc = "Pick to close",
          },
          -- tables with the `name` key will be registered with which-key if it's installed
          -- this is useful for naming menus
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function() vim.lsp.buf.hover() end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function() vim.lsp.buf.declaration() end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}
