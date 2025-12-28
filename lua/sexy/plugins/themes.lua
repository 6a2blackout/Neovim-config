return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("tokyonight").setup({
                -- 'night' is the darkest, high-contrast style (closest to Darker Dracula)
                style = "night", 
                transparent = false,
                terminal_colors = true,
                styles = {
                    -- This makes comments italic, which is a nice touch
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = {},
                    variables = {},
                },
            })
            vim.cmd.colorscheme("tokyonight")
        end,
    }
}
