return {
  {
    "iamcco/markdown-preview.nvim",
    event = "BufRead",
    config = function()
      vim.fn["mkdp#util#install"]()
      vim.keymap.set('n', '<space>md', ':MarkdownPreview<CR>')
      vim.keymap.set('n', '<space>mds', ':MarkdownPreviewStop<CR>')
    end,
  },
}
