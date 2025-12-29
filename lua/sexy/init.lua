require("sexy.remap")
require("sexy.lazy")



vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    vim.lsp.buf.format({ 
        async = false, 

        filter = function(client) return client.name == "ruff" end 
    })
  end,
})


vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts) -- Go to Definition
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)       -- Hover documentation
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts) -- Go to Implementation
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- Rename variable
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts) -- Code Actions (Quick Fix)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts) -- Find References
        
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts) -- Show error in floating window
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts) -- Previous error
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts) -- Next error
    end,
})



vim.opt.clipboard = ""


vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Copy selection to clipboard' })
vim.keymap.set('n', '<leader>y', '"+y', { desc = 'Copy selection to clipboard' })
vim.keymap.set('n', '<leader>Y', '"+y$', { desc = 'Copy to EOL to system clipboard' })
vim.keymap.set('v', '<leader>p', '"+p', { desc = 'paste from system clipboard' })
vim.keymap.set('n', '<leader>p', '"+p', { desc = 'paste from system clipboard' })
