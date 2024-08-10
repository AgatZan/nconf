# my config

## File cheatsheet

init.lua --> all requires, init some globals(maybe move to a separate one), bootstrapping [lazy.nvim](https://github.com/folke/lazy.nvim) plug manager
lua/
    option.lua --> **all nvim options**
    autocmd.lua --> **autocmd**
    mappings.lua --> **all mappings 4real**
    opts/ --> options for plugin that needed 4 configuration ( yes i manualy require them in plug specs folder )
        *
    plugin/ --> lazy.nvim plugin list
        colorscheme.lua --> current collorscheme
        *
    plugin.bak/ --> You shouldn't have seen it.
        *
snippets/ --> where ur dreams of snippet come true ( someday it won't just be a dream )
    *
syntax/ --> auto correction 4 nvim
    *
ftplugin/ --> maybeee file type plugin ( currently shes empty   d(╥‸╥)   )
    *
