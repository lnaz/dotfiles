let plugins = dein#load_cache_raw(['/Users/Kotaro/.vimrc'], 1)
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_base_path = '/Users/Kotaro/.vim/bundle/.dein'
let g:dein#_runtime_path = '/Users/Kotaro/.vim/bundle/.dein/.dein'
let &runtimepath = '/Users/Kotaro/.vim/bundle/.dein/.dein,/Users/Kotaro/.vim/bundle/dein.vim/,/Users/Kotaro/.vim,/usr/local/share/vim/vimfiles,/usr/local/share/vim/vim74,/usr/local/share/vim/vimfiles/after,/Users/Kotaro/.vim/after,/Users/Kotaro/.vim/bundle/.dein/.dein/after'
