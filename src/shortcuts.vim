" # junegunn/fzf & junegunn/fzf.vim
nmap <silent> <C-P> :Files<CR>
nmap <silent> <leader>p :Tags<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)


" # ack.vim
nnoremap <Leader>a :Ack!<Space>


" # LanguageClient-neovim
noremap <silent> <leader>h :call LanguageClient_textDocument_hover()<CR>
noremap <silent> <leader>d :call LanguageClient_textDocument_definition()<CR>
noremap <silent> <leader>re :call LanguageClient_textDocument_rename()<CR>
noremap <silent> <leader>sb :call LanguageClient_textDocument_documentSymbol()<CR>
                         


"  # ncm2/ncm2
" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"



" # junegunn/vim-easy-align
" Align GitHub-flavored Markdown tables
" The <Bslash> key is also the | key
au FileType markdown vmap <leader><bslash> :EasyAlign*<Bar><Enter>
vmap ga <plug>(EasyAlign)



" # lib/outline.vim
nnoremap <silent> <leader>. :Outline<CR>
