# lcs.nvim

Manage your `listchars` display settings easily.

# Installation

`Plug 'stumash/lcs.nvim'`

I use plug, adapt the above line as needed for you plugin manager of choice.

# Usage

You must call `setup()` for the plugin to work:

```lua
require'lcs'.setup()
```

You can override the plugin defaults like so:

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

These functions are exposed for use and can be key-mapped like so:

```vim
nnoremap <leader>LCSs <CMD>lua require'lcs'.toggleShowSpace()<CR>
nnoremap <leader>LCSt <CMD>lua require'lcs'.toggleShowTab()<CR>
nnoremap <leader>LCSe <CMD>lua require'lcs'.toggleShowEol()<CR>
nnoremap <leader>LCSr <CMD>lua require'lcs'.toggleShowTrail()<CR>
" toggle listchar visibility
nnoremap <leader>LCSL <CMD>lua require'lcs'.toggleListchars()<CR>
```
