let s:path = expand('<sfile>:p:h')

" echo s:path

execute 'source ' . s:path . '/src/setting.vim'
execute 'source ' . s:path . '/src/plug.vim'
execute 'source ' . s:path . '/src/lib/outline.vim'
execute 'source ' . s:path . '/src/shortcuts.vim'
