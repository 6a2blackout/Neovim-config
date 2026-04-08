-- this is a helper function to load AGENT.md file
local function get_project_instructions()
    local agent_file = vim.fn.getcwd() .. "/AGENT.md"
    local f = io.open(agent_file, "r")
    if f then
        local content = f:read("*all")
        f:close()
        return "\n\nAdditional Project Instructions from AGENT.md:\n" .. content
    end
    return ""
end

return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, 
    build = "make",  
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        {
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = { insert_mode = true },
                },
            },
        },
    },
    opts = {
        provider = "claude", 
        providers = {
            claude = {
                endpoint = "https://api.anthropic.com",
                model = "claude-opus-4-6", 
                timeout = 30000,
                -- UPDATED: Moved max_tokens and temperature here
                extra_request_body = {
                    max_tokens = 8192,
                    temperature = 0,
                },
            },
        },
        web_search_engine = {
            provider = "tavily", 
        },
        system_prompt = [[
        You are an expert Senior Software Engineer.
        Your goal is to write clean, professional, and standard-compliant code.
        Follow the "Code as Documentation" philosophy: code must be clear and 
        descriptive enough that comments are not necessary, only short single 
        sentence comments are allowed that briefly say what this function does, or 
        what a very important segment of code does.
        ]] .. get_project_instructions(),

        mappings = {
            ask = "<leader>og",    -- Normal mode: Chat popup
            edit = "<leader>oe",   -- Visual mode: Edit selection
            refresh = "<leader>or", -- Refresh the context
            diff = {
                ours = "co",         -- Keep your original code
                theirs = "ct",       -- Accept the AI's changes
                all_theirs = "ca",   
                both = "cb",         
                cursor = "cc",       
            },
        },
    },
}
