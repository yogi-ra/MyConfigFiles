if vim.env.TMUX then
  vim.g.clipboard = {
    name = 'tmux-osc52',
    copy  = { ['+'] = { 'tmux', 'load-buffer', '-w', '-' }, ['*'] = { 'tmux', 'load-buffer', '-w', '-' } },
    paste = { ['+'] = { 'tmux', 'save-buffer', '-' },       ['*'] = { 'tmux', 'save-buffer', '-' } },
    cache_enabled = 0,
  }
elseif vim.env.DISPLAY then
  vim.g.clipboard = {
    name = 'xclip',
    copy  = { ['+'] = { 'xclip', '-selection', 'clipboard', '-in' },  ['*'] = { 'xclip', '-selection', 'primary', '-in' } },
    paste = { ['+'] = { 'xclip', '-selection', 'clipboard', '-o' },   ['*'] = { 'xclip', '-selection', 'primary', '-o' } },
    cache_enabled = 0,
  }
else
  local osc = require('vim.ui.clipboard.osc52')   -- nvim >= 0.10, ssh without tmux
  vim.g.clipboard = {
    name = 'OSC 52',
    copy  = { ['+'] = osc.copy('+'), ['*'] = osc.copy('*') },
    paste = { ['+'] = osc.paste('+'), ['*'] = osc.paste('*') },
    cache_enabled = 0,
  }
end
vim.opt.clipboard = 'unnamedplus'
