return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  opts = {
    auto_trigger = true,
    keymap = {
      accept = false, -- handled by nvim-cmp / blink.cmp
      next = '<M-]>',
      prev = '<M-[>',
    },
  },
}
