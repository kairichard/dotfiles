return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    strategies = {
      chat = {
        adapter = 'openai',
      },
      inline = {
        adapter = 'openai',
      },
    },
    adapters = {
      openai = function()
        return require('codecompanion.adapters').extend('openai', {
          env = {
            api_key = os.getenv 'NEOVIM_OPENAI_API_KEY',
          },
        })
      end,
    },
  },
}
