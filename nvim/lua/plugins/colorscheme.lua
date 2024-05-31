return {
     {
        "decaycs/decay.nvim",
        name = "decay",
        priority = 1000,
        config = function()
                require('decay').setup({
                    style = 'decayce',
                })
            vim.cmd.colorscheme 'decay'
        end
      },
}
