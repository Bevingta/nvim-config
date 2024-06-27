return {
  'backdround/global-note.nvim',
  config = function()
    local global_note = require("global-note")
    global_note.setup()

    vim.keymap.set("n", "<space>gn", ':GlobalNote<CR>', {})
  end
}
