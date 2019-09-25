# NeoVim on Ubuntu

## Clone

Clone the repo of 'zhanjh/nvim' to ~/.config/nvim

```
git clone https://github.com/zhanjh/nvim ~/.config/nvim
```

## Install vim-plug

<https://github.com/junegunn/vim-plug>

```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Install plugs

```shell
sudo pacman -S python-pip python-setuptools
sudo pip install --upgrade neovim
```

```shell
nvim +PlugInstall +UpdateRemotePlugins +q
```

打开neovim, 执行`:checkhealth`查看结果

```

health#LanguageClient#check
========================================================================
  - OK: binary found: /home/zjh/.local/share/nvim/plugged/LanguageClient-neovim/bin/languageclient
  - OK: languageclient 0.1.146
  - INFO: Floating window is not supported. Preview window will be used for hover

health#nvim#check
========================================================================
## Configuration
  - OK: no issues found

## Performance
  - OK: Build type: Release

## Remote Plugins
  - OK: Up to date

## terminal
  - INFO: key_backspace (kbs) terminfo entry: key_backspace=^H
  - INFO: key_dc (kdch1) terminfo entry: key_dc=\E[3~
  - INFO: $SSH_TTY='/dev/pts/0'

## tmux
  - OK: escape-time: 10ms
  - INFO: $TERM: screen-256color

health#provider#check
========================================================================
## Clipboard (optional)
  - OK: Clipboard tool found: tmux

## Python 2 provider (optional)
  - WARNING: No Python executable found that can `import neovim`. Using the first available executable for diagnostics.
  - ERROR: Python provider error:
    - ADVICE:
      - provider/pythonx: Could not load Python 2:
          python2 not found in search path or not executable.
          python2.7 not found in search path or not executable.
          python2.6 not found in search path or not executable.
          /usr/bin/python is Python 3.7 and cannot provide Python 2.
  - INFO: Executable: Not found

## Python 3 provider (optional)
  - INFO: `g:python3_host_prog` is not set.  Searching for python3 in the environment.
  - INFO: Executable: /usr/bin/python3
  - INFO: Python version: 3.7.3
  - INFO: pynvim version: 0.3.2
  - OK: Latest pynvim is installed.

```

## Get Started


### NERDTree

* `<leader>k`,   `:NERDTreeToggle<CR>`, " Toggle NERDTree
* `<leader>y`,   `:NERDTreeFind<CR>`,   " expand to the path of the file in the current buffer

actions:

* o,  open in prev window
* go, preview
* t,  open in new tab
* T,  open in new tab silently
* i,  open split
* gi, preview split
* s,  open vsplit
* gs, preview vsplit

### fzf

* `<c-p>`,         :`FZF<CR>`,                 " Search files
* `<leader><Tab>`, `<Plug>(fzf-maps-n/i/x/o)`, " List mappings

actions:

* `<c-j>`&`<c-n>`, " move down
* `<c-k>`&`<c-p>`, " move up
* `<c-t>`,         " tab split
* `<c-x>`,         " split
* `<c-v>`,         " vsplit

### ale

* `<C-k>`, `<Plug>(ale_previous_wrap)`, " Move to the previous error
* `<C-j>`, `<Plug>(ale_next_wrap)`,     " Move to the next error

### ack.vim

* `<Leader>a`, `:Ack!<Space>`, " Search the content of all the files in the current project


### LanguageClient-neovim

* `<leader>h`,  `:call LanguageClient_textDocument_hover()<CR>`,          " Hover/Get identifier info
* `<leader>d`,  `:call LanguageClient_textDocument_definition()<CR>`,     " Goto definition
* `<leader>re`, `:call LanguageClient_textDocument_rename()<CR>`,         " Rename
* `<leader>ds`, `:call LanguageClient_textDocument_documentSymbol()<CR>`, " Workspace/Document symbols query


### ncm2

* `<c-c>`,   `<ESC>`, " Map CTRL-C to `<ESC>` in insert mode
* `<Tab>`,   `<c-n>`, " Next item in the popup menu
* `<S-Tab>`, `<c-p>`, " Previous item in the popup menu

### gitv

* `:Gitv`, Open gitv in browser mode
* `:Gitv!`, Open tive in file mode

Try `:help gitv`

actions:

* `<cr>`, Opens a commit
* J&`<c-n>`, Move down to next commit and open it
* K&`<c-p>`, Move up and open
* o, Split
* O, Open in a new tab
* q, Quit gitv

### gv.vim

* :GV,  to open commit browser
* :GV!, will only list commits that affected the current file
* :GV?, fills the location list with the revisions of the current file

actions:

* o or `<cr>` on a commit to display the content of it
* o or `<cr>` on commits to display the diff in the range
* O opens a new tab instead
* gb for :Gbrowse
* ]] and [[ to move between commits
* . to start command-line with :Git [CURSOR] SHA à la fugitive
* q to close


## mappings

### Display mode

* :nmap - Display normal mode maps
* :imap - Display insert mode maps
* :vmap - Display visual and select mode maps
* :smap - Display select mode maps
* :xmap - Display visual mode maps
* :cmap - Display command-line mode maps
* :omap - Display operator pending mode maps


### Useful commands

| commands            | description                                     |
| ---                 | ---                                             |
| `:help index`       | the mappings and commands defined by vim itself |
| `:map`              | the mappings defined by yourself and plugins.   |
| `:verbose map`      | where each mapping was defined.                 |
| `:help map-listing` | help us to understand the listing mappings.     |


## Tips

### Debug unexpected option settings
<https://vim.fandom.com/wiki/Debug_unexpected_option_settings>

```
:verbose set fo?
```

## ref.

* <https://neovim.io/>
