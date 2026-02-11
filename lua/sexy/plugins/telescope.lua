return {
    'nvim-telescope/telescope.nvim', 
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
        local builtin = require('telescope.builtin')
        
        -- Smart <C-p>: Git files if inside git, otherwise standard find_files
        local function find_project_files()
            local opts = {} 
            local ok = pcall(builtin.git_files, opts)
            if not ok then
                builtin.find_files(opts)
            end
        end

        vim.keymap.set('n', '<C-p>', find_project_files, {})
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>ff', builtin.current_buffer_fuzzy_find, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end)
    end
}
