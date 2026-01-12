return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false, -- We strictly follow the docs here
    priority = 1000, -- Load this plugin before others
    config = function()
        -- 1. Try to load the plugin safely
        local status_ok, configs = pcall(require, "nvim-treesitter.configs")
        
        -- 2. If the plugin is not installed yet, stop here (do not crash)
        if not status_ok then
            return
        end

        -- 3. If installed, proceed with setup
        configs.setup({
            ensure_installed = { 
                "c", "lua", "vim", "vimdoc", "query", 
                "javascript", "html", "css", "python" 
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
        })
    end
}
