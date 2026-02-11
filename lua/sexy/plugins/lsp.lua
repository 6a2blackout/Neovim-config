return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd", "pyright", "ruff", "html", "cssls", "ts_ls", "eslint",
                },
                automatic_installation = true,
                handlers = {
                    -- 1. Default Handler
                    function(server_name)
                        local capabilities = require("cmp_nvim_lsp").default_capabilities()
                        require("lspconfig")[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,

                    -- 2. Clangd Handler (Needs offset encoding fix)
                    ["clangd"] = function()
                        local capabilities = require("cmp_nvim_lsp").default_capabilities()
                        capabilities.offsetEncoding = { "utf-16" }
                        require("lspconfig").clangd.setup({
                            capabilities = capabilities,
                        })
                    end,

                    -- 3. Pyright Handler
                    ["pyright"] = function()
                        local capabilities = require("cmp_nvim_lsp").default_capabilities()
                        require("lspconfig").pyright.setup({
                            capabilities = capabilities,
                            settings = {
                                python = {
                                    analysis = { typeCheckingMode = "basic" }
                                }
                            }
                        })
                    end,

                    -- 4. Ruff Handler
                    ["ruff"] = function()
                        local capabilities = require("cmp_nvim_lsp").default_capabilities()
                        require("lspconfig").ruff.setup({
                            capabilities = capabilities,
                            on_attach = function(client)
                                client.server_capabilities.hoverProvider = false
                            end
                        })
                    end,
                }
            })
        end,
    }
}
