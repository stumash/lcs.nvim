# lcs.nvim

Manage your `listchars` display settings easily.

# Installation

```vim
Plug 'stumash/lcs.nvim'
```

# Usage

Call `setup()` to activate the plugin

```lua
require'lcs'.setup() -- no arg = default config
```

Configure the plugin by passing a table to `setup()`

```lua
-- the config object passed to `setup()` must have the shape:
-- {
--   enabled: bool,
--   chars: {
--     listcharName: { enabled: bool, value: str },
--     ...
--   }
-- }
require"lcs".setup{
  -- this is the default config
  enabled = true,
  chars = {
    s = { enabled = false, value = [[space:•]] },
    tb = { enabled = true, value = [[tab:→\ ]] },
    e = { enabled = false, value = [[eol:↴]] },
    tr = { enabled = true, value = [[trail:⁃]] },
  },
}
```

Then you can toggle the visibility of listchars using `toggleShow(listcharName)`

```vim
" toggle individual listchar visibilities
nnoremap <leader>LCSs <CMD>lua require'lcs'.toggleShow('s')<CR>
nnoremap <leader>LCSt <CMD>lua require'lcs'.toggleShow('tb')<CR>
nnoremap <leader>LCSe <CMD>lua require'lcs'.toggleShow('e')<CR>
nnoremap <leader>LCSr <CMD>lua require'lcs'.toggleShow('tr')<CR>
" toggle all listchar visibility
nnoremap <leader>LCSL <CMD>lua require'lcs'.toggleShow()<CR>
```
