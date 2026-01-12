return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000, 
    config = function()
      require("rose-pine").setup({
        variant = "main",
        dark_variant = "main",
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
          terminal = true,
          legacy_highlights = true,
          migrations = true,
        },

        styles = {
          bold = true,
          italic = true,
          transparency = false,
          functions = {},
          variables = {},
        },
      })
      vim.cmd("colorscheme rose-pine")
    end,
  }
}



--return {
--    {
--        "folke/tokyonight.nvim",
--        lazy = false,
--        priority = 1000,
--        opts = {},
--        config = function()
--            require("tokyonight").setup({
--                style = "night", 
--                transparent = false,
--                terminal_colors = true,
--                styles = {
--                    comments = { italic = true },
--                    keywords = { italic = true },
--                    functions = {},
--                    variables = {},
--                },
--            })
--            vim.cmd.colorscheme("tokyonight")
--        end,
--    }
--}
