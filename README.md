# my config

## File cheatsheet

init.lua --> all requires, init some globals(maybe move to a separate one), bootstrapping [lazy.nvim](https://github.com/folke/lazy.nvim) plug manager  
lua/  
&emsp;    option.lua --> **all nvim options**  
&emsp;    autocmd.lua --> **autocmd**  
&emsp;    mappings.lua --> **all mappings 4real**  
&emsp;    opts/ --> options for plugin that needed 4 configuration ( yes i manualy require them in plug specs folder )  
&emsp;&emsp;        *  
&emsp;    plugin/ --> lazy.nvim plugin list  
&emsp;&emsp;        colorscheme.lua --> current collorscheme  
&emsp;&emsp;        file-manager.lua --> current file manager  
&emsp;&emsp;        completion.lua --> all about completion ( also snippets )  
&emsp;&emsp;        *  
&emsp;    plugin.bak/ --> You shouldn't have seen it.  
&emsp;&emsp;        *  
snippets/ --> where ur dreams of snippet come true ( someday it won't just be a dream and someday is now!!! )  
&emsp;    *  
syntax/ --> auto correction 4 nvim  
&emsp;    *  
ftplugin/ --> maybeee file type plugin ( currently shes empty   d(╥‸╥)   )  
&emsp;    *  
