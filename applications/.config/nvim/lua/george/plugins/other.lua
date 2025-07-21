return {
  "rgroli/other.nvim",

  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local otherNvim = require("other-nvim")
    local api = vim.api

    otherNvim.setup({
      mappings = {
        {
          pattern = "/(.*)/.*.(ts|tsx)$",
          target = "/%1/\\(*.test.(ts|tsx)$\\)",
        },
        {
          pattern = "/(.*)/.*.test.ts$",
          target = "/%1/%2.ts$",
          context = "test",
        },
      },
    })

    api.nvim_create_user_command(
      "A",
      "Other",
      { desc = "Opens the other/alternative file according to the configured mapping." }
    )
    api.nvim_create_user_command("Av", "OtherVSplit", { desc = "Like :Other but opens the file in a vertical split." })
    api.nvim_create_user_command("As", "OtherSplit", { desc = "Like :Other but opens the file in a horizontal split." })
  end,
}
