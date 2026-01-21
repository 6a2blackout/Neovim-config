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

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            capabilities.offsetEncoding = { "utf-16" }

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd", "pyright", "ruff", "html", "cssls",
                },
                automatic_installation = true,
                handlers = {
                    -- 1. The Default Handler (This was broken in your file)
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,

                    -- 2. Custom Handler for Pyright
                    ["pyright"] = function()
                        require("lspconfig").pyright.setup({
                            capabilities = capabilities,
                            settings = {
                                python = {
                                    analysis = { typeCheckingMode = "basic" }
                                }
                            }
                        })
                    end,

                    -- 3. Custom Handler for Ruff
                    ["ruff"] = function()
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







--return {
--    {
--        "neovim/nvim-lspconfig",
--        dependencies = {
--            "williamboman/mason.nvim",
--            "williamboman/mason-lspconfig.nvim",
--            "hrsh7th/cmp-nvim-lsp", 
--            "hrsh7th/nvim-cmp",
--        },
--        config = function()
--            require("mason").setup()
--
--            local capabilities = require("cmp_nvim_lsp").default_capabilities()
--            capabilities.offsetEncoding = { "utf-16" }
--
--            require("mason-lspconfig").setup({
--                ensure_installed = {
--                    "clangd", "pyright", "ruff", "html", "cssls",
--                },
--                automatic_installation = true,
--                handlers = {
--                    require("lspconfig")[server_name].setup({
--                        capabilities = capabilities,
--                    })
--                end,
--
--                ["pyright"] = function()
--                    require("lspconfig").pyright.setup({
--                        capabilities = capabilities,
--                        settings = {
--                            python = {
--                                analysis = { typeCheckingMode = "basic" }
--                            }
--                        }
--                    })
--                end,
--
--                ["ruff"] = function()
--                    require("lspconfig").ruff.setup({
--                        capabilities = capabilities,
--                        on_attach = function(client)
--                            client.server_capabilities.hoverProvider = false
--                        end
--                    })
--                end,
--            }
--               -- handlers = {
--               --     function(server_name)
--               --         vim.lsp.config[server_name] = {
--               --             capabilities = capabilities,
--               --         }
--               --         vim.lsp.enable(server_name)
--               --     end,
--
--                    -- pyright is here
--                    ["pyright"] = function()
--                        vim.lsp.config["pyright"] = {
--                            capabilities = capabilities,
--                            settings = {
--                                python = {
--                                    analysis = { typeCheckingMode = "basic" }
--                                }
--                            }
--                        }
--                        vim.lsp.enable("pyright")
--                    end,
--
--                    -- Ruff is here 
--                    ["ruff"] = function()
--                        vim.lsp.config["ruff"] = {
--                            capabilities = capabilities,
--                            on_attach = function(client)
--                                client.server_capabilities.hoverProvider = false
--                            end
--                        }
--                        vim.lsp.enable("ruff")
--                    end,
--                }
--            })
--        end,
--    }
--}
