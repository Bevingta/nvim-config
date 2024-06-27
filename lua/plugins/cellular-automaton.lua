return {
  'eandrju/cellular-automaton.nvim',
  config = function()
    vim.keymap.set('n', '<space>fml', ':CellularAutomaton make_it_rain<CR>')
  end
}
