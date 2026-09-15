return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        cmd = "ConformInfo",
        keys = {
            {
                "<leader>fm",
                function()
                    require("conform").format({ async = true })
                end,
                desc = "Format buffer",
            },
        },
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    html = { "prettierd", "prettier", stop_after_first = true },
                },
                format_on_save = {
                    -- prettierd's daemon needs a moment to start on the first save
                    timeout_ms = 3000,
                },
            })
        end,
    }
}
