# lcs.nvim

Manage your `listchars` display settings easily.

# Installation

`Plug 'stumash/lcs.nvim'`

I use plug, adapt the above line as needed for you plugin manager of choice.

# Usage

```lua
-- these are the defaults, you can omit any of these settings
require"lcs.nvim".setup{
  enabled = true,
  chars = {
    eol = { enabled = true, value = [[eol:↴]] },
    tab = { enabled = true, value = [[tab:→\ ]] },
    spc = { enabled = false, value = [[space:·]] },
    trail = { enabled = true, value = [[space:-]] },
  },
}
```

```vim
nnoremap <leader>LCSs <CMD>lua toggleShowSpace()<CR>
nnoremap <leader>LCSt <CMD>lua toggleShowTab()<CR>
nnoremap <leader>LCSe <CMD>lua toggleShowEol()<CR>
nnoremap <leader>LCSr <CMD>lua toggleShowTrail()<CR>
" toggle listchar visibility
nnoremap <leader>LCSL <CMD>lua toggleListchars()<CR>
```
