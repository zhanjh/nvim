" NERDTree
let g:NERDTreeQuitOnOpen=0 " close NERDTree after a file is opened
let NERDTreeShowHidden=1 " show hidden files in NERDTree
nmap <leader>k :NERDTreeToggle<CR> " Toggle NERDTree
nmap <leader>y :NERDTreeFind<CR> " expand to the path of the file in the current buffer

" -------------------------------
" junegunn/fzf & junegunn/fzf.vim
" -------------------------------
"  https://github.com/junegunn/fzf.vim
nmap <silent> <C-P> :FZF<CR>
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

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" ---
" ale
" ---
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1 " Set this. Airline will handle the rest.
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_php_phpcs_standard = 'PSR2' " php
let g:ale_php_phpstan_level = 7

let g:ale_linters = {'rust': ['cargo', 'rls', 'rustc']}
let g:ale_rust_rls_toolchain = 'stable'

highlight ALEError cterm=reverse,bold ctermfg=NONE ctermbg=NONE
highlight ALEWarning cterm=reverse,bold ctermfg=NONE ctermbg=NONE

" ack.vim
" https://github.com/mileszs/ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nnoremap <Leader>a :Ack!<Space>

" ------------------
" tpope/vim-fugitive
" ------------------
set diffopt+=vertical "https://github.com/tpope/vim-fugitive/issues/510


" ---------------------
" LanguageClient-neovim
" https://github.com/autozimu/LanguageClient-neovim
" https://kadekillary.work/post/rust-ide/
" ---------------------

" Required for operations modifying multiple buffers like rename.
set hidden
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ }

noremap <silent> H :call LanguageClient_textDocument_hover()<CR>
noremap <silent> Z :call LanguageClient_textDocument_definition()<CR>
noremap <silent> R :call LanguageClient_textDocument_rename()<CR>
noremap <silent> S :call LanugageClient_textDocument_documentSymbol()<CR>

" ----------
"  ncm2/ncm2
" ----------

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

 " suppress the annoying 'match x of y', 'The only match' and 'Pattern not
    " found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
