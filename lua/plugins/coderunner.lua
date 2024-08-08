return {
  "CRAG666/code_runner.nvim",
  config = function()
    local runner = require("code_runner")
    
    runner.setup({
      filetype = {
        java = {
          "cd $dir &&",
          "javac $fileName &&",
          "java $fileNameWithoutExt",
        },
        python = "python3 -u",
        typescript = "deno run",
        rust = {
          "cd $dir &&",
          "rustc $fileName &&",
          "$dir/$fileNameWithoutExt",
        },
        c = function(...)
          local c_base = {
            "cd $dir &&",
            "gcc $fileName -o",
            "/tmp/$fileNameWithoutExt",
          }
          local c_exec = {
            "&& /tmp/$fileNameWithoutExt &&",
            "rm /tmp/$fileNameWithoutExt",
          }
          vim.ui.input({ prompt = "Add more args:" }, function(input)
            c_base[4] = input
            vim.print(vim.tbl_extend("force", c_base, c_exec))
            runner.commands.run_from_fn(vim.list_extend(c_base, c_exec))
          end)
        end,
      },
      mode = "term",
      focus = true,
      startinsert = true,
      term = {
        position = "bot",
        size = 15,
      },
      float = {
        close_key = 'q',
        border = "rounded",
      },
    })

    -- Function to close existing code runner window and return to original window
    local function close_code_runner_window()
      local original_win = vim.api.nvim_get_current_win()
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local buf_name = vim.api.nvim_buf_get_name(buf)
        if buf_name:match("Code Runner") then
          vim.api.nvim_win_close(win, true)
          vim.api.nvim_set_current_win(original_win)
          return
        end
      end
    end

    -- Custom RunCode command
    vim.api.nvim_create_user_command('RunCode', function()
      local original_win = vim.api.nvim_get_current_win()
      close_code_runner_window()
      runner.run_code()
      -- Set up an autocommand to return to the original window when the terminal closes
      vim.api.nvim_create_autocmd("TermClose", {
        pattern = "Code Runner",
        callback = function()
          vim.defer_fn(function()
            if vim.api.nvim_win_is_valid(original_win) then
              vim.api.nvim_set_current_win(original_win)
            end
          end, 10)
        end,
        once = true,
      })
    end, {})

    -- Set keybinding to <Space>rr
    vim.keymap.set('n', '<Space>rr', ':RunCode<CR>', { silent = true })
  end,
}
