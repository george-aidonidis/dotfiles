return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.timeoutlen = 500
  end,
  opts = {

  }
}
