return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- Source for LSP
        "hrsh7th/cmp-path",     -- Source for file paths
        "hrsh7th/cmp-buffer",   -- Source for text in buffer
    },
    config = function()
        local cmp = require("cmp")
        
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<C-Space>'] = cmp.mapping.complete(), -- Ctrl+Space to force open menu
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter to pick
                ['<Tab>'] = cmp.mapping.select_next_item(), -- Tab to go down
                ['<S-Tab>'] = cmp.mapping.select_prev_item(), -- Shift+Tab to go up
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' }, -- Get suggestions from LSP (Pyright/Clangd)
                { name = 'path' },     -- File paths
                { name = 'buffer' },   -- Words in the file
            })
        })
    end
}
