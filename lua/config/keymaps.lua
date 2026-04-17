local map = vim.keymap.set
vim.g.mapleader = " "

-- Select-all
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all", noremap = true })

-- Buffers
map("n", "<Tab>", ":BufferNext<CR>", { desc = "Move to next tab", noremap = true })
map("n", "<S-Tab>", ":BufferPrevious<CR>", { desc = "Move to previous tab", noremap = true })
map("n", "<leader>x", ":BufferClose<CR>", { desc = "Close Buffer and Window", noremap = true })
map("n", "<C-U>", ":redo", { desc = "Redo", noremap = true })

local function telescope_find_files_from_neotree()
  -- Get the current root of the NeoTree filesystem source
  local state = require("neo-tree.sources.manager").get_state("filesystem")
  local root = state.path

  -- Launch Telescope find_files in that specific directory
  require("telescope.builtin").find_files({
    search_dirs = { root },
    prompt_title = "NeoTree Root: " .. root,
  })
end
vim.keymap.set("n", "<leader>fF", telescope_find_files_from_neotree, { desc = "Telescope find files in NeoTree root" })
vim.keymap.set("n", "<leader>at", ":Copilot toggle<CR>", { desc = "Toggle Copilot suggestion" })
-- Flash
--del({ "n", "x", "o" }, "f")
--del({ "n", "x", "o" }, "F")

vim.keymap.set("n", "<leader>fj", function()
  local builtin = require("telescope.builtin")
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  builtin.find_files({
    prompt_title = "Search Home Directories",
    cwd = vim.env.HOME,
    find_command = { "fd", "--type", "d", "--strip-cwd-prefix", "--hidden", "--exclude", ".git" },
    attach_mappings = function(prompt_bufnr, _)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)

        -- 1. Path construction
        local new_path = vim.env.HOME .. "/" .. selection[1]

        -- 2. Change global directory
        vim.api.nvim_set_current_dir(new_path)

        -- 3. Reset Neo-tree to the new CWD using the command-line API
        -- This is the most stable way to force a refresh to the new folder
        vim.cmd("Neotree filesystem reveal dir=" .. new_path)

        print("Switched to: " .. new_path)
      end)
      return true
    end,
  })
end, { desc = "Search Home and Sync Neo-tree" })
