return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  build = ':Copilot auth',
  event = 'BufReadPost',
  opts = {
    -- ai_accept action
    function()
      LazyVim.cmp.actions.ai_accept = function()
        if require('copilot.suggestion').is_visible() then
          LazyVim.create_undo()
          require('copilot.suggestion').accept()
          return true
        end
      end
    end,
    suggestion = {
      enabled = not vim.g.ai_cmp,
      auto_trigger = true,
      hide_during_completion = vim.g.ai_cmp,
      keymap = {
        accept = false, -- handled by nvim-cmp / blink.cmp
        next = '<M-]>',
        prev = '<M-[>',
      },
    },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
}
