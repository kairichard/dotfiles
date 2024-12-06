-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'willothy/nvim-cokeline',
  dependencies = {
    'nvim-lua/plenary.nvim', -- Required for v0.4.0+
    'nvim-tree/nvim-web-devicons', -- If you want devicons
    'stevearc/resession.nvim', -- Optional, for persistent history
  },
  config = require('custom.plugins.config.cokeline'),
}
