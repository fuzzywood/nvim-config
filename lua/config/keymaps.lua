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

vim.keymap.set("n", "<leader>fH", function()
  local builtin = require("telescope.builtin")
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  builtin.find_files({
    prompt_title = "Search Home Directories",
    cwd = vim.uv.os_homedir(),
    -- Use fd or find to search ONLY for directories
    find_command = { "fd", "--type", "d", "--hidden", "--exclude", ".git" },

    -- Attach a custom action when you hit Enter
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        -- 1. Get the directory you selected
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)

        if selection then
          -- 2. Construct the full absolute path
          local target_dir = vim.uv.os_homedir() .. "/" .. selection[1]

          -- 3. Change Neovim's working directory
          vim.cmd("cd " .. vim.fn.fnameescape(target_dir))

          -- 4. Inform you via a clean notify message
          vim.notify("Changed working directory to: " .. target_dir)
        end
      end)
      return true
    end,
  })
end, { desc = "Search directories from Home and cd" })
