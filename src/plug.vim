" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" for vim call plug#begin('~/.vim/plugged')
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'gregsexton/gitv'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
"Plug 'gosukiwi/vim-atom-dark'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'mhinz/vim-signify'
"Plug 'janko-m/vim-test'
Plug 'vim-scripts/wombat256.vim'
"Plug 'majutsushi/tagbar'

" Programming
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/vim-easy-align'
Plug 'vim-scripts/DrawIt'

Plug 'sheerun/vim-polyglot'

" # Completion
" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

Plug 'wellle/tmux-complete.vim'

" Initialize plugin system
call plug#end()


" #
" # Settings
" #


" # vim-scripts/wombat255.vim
colorscheme wombat256mod



" # NERDTree
let g:NERDTreeQuitOnOpen=0 " close NERDTree after a file is opened
let NERDTreeShowHidden=1 " show hidden files in NERDTree
nmap <leader>k :NERDTreeToggle<CR> " Toggle NERDTree
nmap <leader>y :NERDTreeFind<CR> " expand to the path of the file in the current buffer



" # junegunn/fzf & junegunn/fzf.vim
" https://github.com/junegunn/fzf.vim
" integrate with riggrep
" http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/
let g:rg_command = '
    \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
    \ -g "!{.config,.git,node_modules,vendor,build,yarn.lock,*.sty,*.bst,build,dist}/*" '
command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'



" # ale
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1 " Set this. Airline will handle the rest.
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_php_phpcs_standard = 'PSR2' " php
let g:ale_php_phpstan_level = 7

" let g:ale_linters = {'rust': ['cargo', 'rls', 'rustc']}
let g:ale_linters = {'rust': ['cargo', 'rustc']}
let g:ale_rust_rls_toolchain = 'stable'

highlight ALEError cterm=reverse,bold ctermfg=NONE ctermbg=NONE
highlight ALEWarning cterm=reverse,bold ctermfg=NONE ctermbg=NONE



" # ack.vim
" https://github.com/BurntSushi/ripgrep/issues/425
" https://github.com/mileszs/ack.vim
"if executable('ag')
"  let g:ackprg = 'ag --vimgrep'
"endif
if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading --smart-case'
endif



" # tpope/vim-fugitive
set diffopt+=vertical "https://github.com/tpope/vim-fugitive/issues/510


" # LanguageClient-neovim
" Required for operations modifying multiple buffers like rename.
set hidden
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ }


" # ncm2/ncm2
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

 " suppress the annoying 'match x of y', 'The only match' and 'Pattern not
    " found' messages
set shortmess+=c

" #rust.vim
let g:rust_recommended_style = 0
