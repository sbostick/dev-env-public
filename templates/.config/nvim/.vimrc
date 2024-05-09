" Disable error beep/flash
set noerrorbells
set visualbell
set t_vb=
if has('autocmd')
    autocmd GUIEnter * set vb t_vb=
endif

" Don't highlight matching parens/braces/brackets
let loaded_matchparen = 1

syntax on            " Enable syntax highlighting
set cpoptions-=u     " w/o this (undo, undo) is a nop
set cpoptions-=$     " put '$' at eol when changing line
set cpoptions-=%     " match comments and preproc directives in C programs
set cpoptions-=x     " abandon command line when esc is pressed
set cpoptions-=<     " allow <C-j> and <esc> style characters codes in mappings
set ml               " modeline on
set nojoinspaces     " use just a single space between sentences on join
set modelines=5      " check 5 lines for mode line
set shell=/bin/bash  " shell invoked via ':!'
set hlsearch         " Switch on search pattern highlighting.
set incsearch        " incremental search matching
set wrapscan         " wrap searches
set ignorecase       " when searching
set mousehide        " Hide the mouse pointer while typing
set number           " line numbers
set updatetime=500   " delay before swap file is written to disk

" Auto formatting is nice for comments, but not for code.  The format
" options control this.  See vim help 'fo-table'.
set formatoptions=q

" Text wrapping
set wrap             " wrap long lines instead of scrolling
set linebreak        " only wrap  at a character in the 'breakat' option
set textwidth=0
set wrapmargin=0

"set autoindent      " simple indenting (uses previous line indent)
"set smartindent     " smart indenting (deprecated)
set cindent          " smartest indenting
set cinkeys-=0#      " no special treatment for leading hash (otherwise snaps to column 0)
set indentkeys-=0#   " no special treatment for leading hash (otherwise snaps to column 0)

" Prevent ':' from triggering auto-indentation
" https://stackoverflow.com/a/21820207
" :set indentexpr?  # show expression used to determine auto indent
" :set indentkeys?  # show which keys trigger auto indent for current file
" :set filetype?    # check current filetype detection
" :scriptnames      # show vim scripts loaded in load order
""" autocmd FileType yaml setlocal indentkeys-=<:>
""" autocmd FileType make setlocal indentkeys-=<:>
""" autocmd FileType python setlocal indentkeys-=<:>

set tabstop=8        " keep standard tab width of 8
set nosmarttab       " use shiftwidth when inserting tab (if enabled)
set softtabstop=0    " number of spaces that tab uses (0 means feature is off)
set expandtab        " whether to use spaces in place of tab
set shiftwidth=2     " then use CTRL-T and CTRL-D from insert mode
set showmatch        " show matching braces and parens
set guioptions-=T    " hide toolbar
set bs=2             " make backspace work as it should
set statusline=%-20.30F\ line:%l\-%-10L\ col:%-20c\ %=[%p%%]
set laststatus=2     " Always use status line
set history=20       " command line history
set splitbelow       " split puts new window below current
set splitright       " vsplit puts new window to right of current
set dictionary=~/.dictionary
set list            " show special characters (tab, newline, ...)
set listchars=tab:▸-
set listchars+=trail:·
set iskeyword+=-    " do not split words on '-'
set nobackup
set writebackup
set backupdir=/tmp//  " dir for backup files
set directory=/tmp//  " dir for swap files
set undodir=/tmp//    " dir for undo files
set undolevels=100

" Mouse mode 'a' disables double-click word selection and cmd+c copy via macos.
" Mouse mode 'a' enables scrolling the buffer with mouse wheel.
" Mouse mode 'a' enables click nav in file tree browser
set mouse=a

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      Abbreviations                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

inoreabbrev todo: TODO(sbostick):

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  Font and Color Scheme                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" REMEMBER :highlight to show current highlight groups for selected syntax

"let g:MyColorScheme='base16-vim'
"let g:MyColorScheme='apprentice'
let g:MyColorScheme='solarized'

" Solarized
if MyColorScheme=='solarized'
  set background=dark
  let g:solarized_termcolors=256
  source ~/.local/share/nvim/plugged/vim-colors-solarized/colors/solarized.vim
  highlight ExtraWhitespace ctermbg=218

  let g:airline_solarized_bg='dark'
  let g:airline_tmeme='solarized'
  " let g:airline_theme='base16'
  " let g:airline_theme='cobalt2'
  " let g:airline_theme='distinguished'
  " let g:airline_theme='papercolor'
  " let g:airline_theme='angr'
  " let g:airline_theme='minimalist'

  " Git Gutter
  " https://github.com/airblade/vim-gitgutter
  set signcolumn=yes
  highlight! link SignColumn LineNr

  set notermguicolors
  "highlight Search ctermfg=DarkBlue ctermbg=247
  "highlight ColorColumn ctermbg=233
  "highlight ErrorMsg ctermbg=88 ctermfg=252
  highlight Comment ctermfg=243 ctermbg=234
  "highlight Normal ctermbg=234 ctermfg=252
  "highlight Visual ctermfg=129 ctermbg=226 cterm=reverse guibg=DarkGrey
  highlight Visual ctermfg=DarkBlue ctermbg=247 cterm=none
  "highlight Directory ctermfg=243
  highlight Directory ctermfg=7
  "highlight Directory ctermfg=33
  "highlight ExtraWhitespace ctermbg=218
  highlight NvimTreeSpecialFile     ctermfg=130   ctermbg=234 cterm=underline

  if 0
    " Electric Blue
    highlight NvimTreeGitNew          ctermfg=33 ctermbg=234 cterm=none
    highlight NvimTreeGitDirty        ctermfg=33 ctermbg=234 cterm=none
    highlight NvimTreeFileDirty       ctermfg=33 ctermbg=234 cterm=none
    highlight NvimTreeFileNew         ctermfg=33 ctermbg=235 cterm=none
    highlight NvimTreeEmptyFolderName ctermfg=33 ctermbg=235 cterm=none
    highlight NvimTreeOpenedFile      ctermfg=33 ctermbg=235 cterm=none
  elseif 1
    " Red on Gray (use lighter ctermbg=234 for default background)
    " Red on Gray (use lighter ctermbg=235 for extra background standout)
    highlight NvimTreeGitNew          ctermfg=124 ctermbg=234 cterm=none
    highlight NvimTreeGitDirty        ctermfg=124 ctermbg=234 cterm=none
    highlight NvimTreeFileDirty       ctermfg=124 ctermbg=234 cterm=none
    highlight NvimTreeFileNew         ctermfg=124 ctermbg=235 cterm=none
    highlight NvimTreeEmptyFolderName ctermfg=124 ctermbg=235 cterm=none
    highlight NvimTreeOpenedFile      ctermfg=124 ctermbg=235 cterm=none
  elseif 1
    " Yellow on Gray (use lighter ctermbg=234 for default background)
    highlight NvimTreeGitNew          ctermfg=229 ctermbg=234 cterm=none
    highlight NvimTreeGitDirty        ctermfg=229 ctermbg=234 cterm=none
    highlight NvimTreeFileDirty       ctermfg=229 ctermbg=234 cterm=none
    highlight NvimTreeFileNew         ctermfg=229 ctermbg=236 cterm=none
    highlight NvimTreeEmptyFolderName ctermfg=229 ctermbg=236 cterm=none
    highlight NvimTreeOpenedFile      ctermfg=229 ctermbg=236 cterm=none
  endif
endif

" Apprentice
if MyColorScheme=='apprentice' && !&diff
  source ~/.local/share/nvim/plugged/Apprentice/colors/apprentice.vim

  " set notermguicolors
  " highlight Search ctermfg=DarkBlue ctermbg=247
  " highlight ColorColumn ctermbg=233
  " highlight ErrorMsg ctermbg=88 ctermfg=252
  " highlight Comment ctermfg=243 ctermbg=234
  " highlight Normal ctermbg=234 ctermfg=252
  " highlight Visual ctermbg=233 ctermfg=238
  " highlight Directory ctermfg=243
  " highlight ExtraWhitespace ctermbg=218

  set termguicolors
  highlight  Visual                    guifg=#ffff99  guibg=#222222
  highlight  Search                    guibg=#af87af  guifg=#222222
  highlight  ColorColumn               guifg=#999999  guibg=#0a0a0a
  highlight  ErrorMsg                  guifg=#aa5555  guibg=#111111
  highlight  Comment                   guifg=#999999  guibg=#222222
  highlight  Normal                    guifg=#eeeeee  guibg=#111111
  highlight  ExtraWhitespace           guifg=#aa5555  guibg=#aa5555
  highlight  Directory                 guifg=#999999  guibg=#111111
  highlight  NvimTreeRootFolder        guifg=#999999  guibg=#111111
  highlight  NvimTreeFolderName        guifg=#999999  guibg=#111111
  highlight  NvimTreeEmptyFolderName   guifg=#999999  guibg=#111111
  highlight  NvimTreeSpecialFile       guifg=#ff9999  guibg=#111111  gui=underline
  highlight  NvimTreeGitDirty          guifg=#cccc77  guibg=#111111
  highlight  NvimTreeFileDirty         guifg=#cccc77  guibg=#111111
  highlight  NvimTreeBookmark          guifg=#6688ee  guibg=#111111
  highlight  NvimTreeBookmark          guifg=#7799ff  guibg=#111111
  " highlight  NvimTreeOpenedFolderName  guifg=#999999  guibg=#111111
  " highlight  NvimTreeVertSplit         guifg=#999999  guibg=#111111
  " highlight  NvimTreeWinSeparator      guifg=#999999  guibg=#111111
  " highlight  NvimTreeCursorColumn      guifg=#999999  guibg=#111111
  " highlight  NvimTreeCursorLine        guifg=#999999  guibg=#111111
  " highlight  NvimTreeIndentMarker      guifg=#999999  guibg=#111111
  " highlight  NvimTreeSymlink           guifg=#999999  guibg=#111111
  " highlight  NvimTreeFolderIcon        guifg=#999999  guibg=#111111
  " highlight  NvimTreeExecFile          guifg=#999999  guibg=#111111
  " highlight  NvimTreeImageFile         guifg=#999999  guibg=#111111
  " highlight  NvimTreeOpenedFile        guifg=#999999  guibg=#111111
  " highlight  NvimTreeGitDeleted        guifg=#999999  guibg=#111111
  " highlight  NvimTreeFileDeleted       guifg=#999999  guibg=#111111
  " highlight  NvimTreeGitStaged         guifg=#999999  guibg=#111111
  " highlight  NvimTreeFileStaged        guifg=#999999  guibg=#111111
  " highlight  NvimTreeGitMerge          guifg=#999999  guibg=#111111
  " highlight  NvimTreeFileMerge         guifg=#999999  guibg=#111111
  " highlight  NvimTreeGitRenamed        guifg=#999999  guibg=#111111
  " highlight  NvimTreeFileRenamed       guifg=#999999  guibg=#111111
  " highlight  NvimTreeGitNew            guifg=#999999  guibg=#111111
  " highlight  NvimTreeFileNew           guifg=#999999  guibg=#111111
  " highlight  NvimTreeWindowPicker      guifg=#999999  guibg=#111111
  " highlight  NvimTreeLiveFilterPrefix  guifg=#999999  guibg=#111111
  " highlight  NvimTreeLiveFilterValue   guifg=#999999  guibg=#111111

  let g:airline_theme='minimalist'
endif

" base16-vim (use base16 bash scripts to set color scheme, then open nvim)
if MyColorScheme=='base16-vim'
  let base16colorspace=256
  "colorscheme base16-default-dark
  "highlight ExtraWhitespace ctermbg=218
  let g:airline_theme='base16'
endif

if &diff
  set background=dark
  let g:solarized_termcolors=256
  source ~/.local/share/nvim/plugged/vim-colors-solarized/colors/solarized.vim
  let g:airline_theme='minimalist'
endif

" Highlight trailing whitespace and mixed tabs/spaces, except in insert mode
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" REMEMBER: use `:hi` or `:highlight` to display current color groups

" Highlight trailing whitespace in Markdown files as yellow since it might
" indicate line continuation. The color should communicate a warning condition
" instead of an error condition. Suitable bg colors are 7, 183, 104, 111, 187
function SetMarkdownOptions()
  highlight ExtraWhitespace ctermfg=0   ctermbg=7   cterm=none " white
  highlight OnCallNormal    ctermfg=232 ctermbg=11  cterm=none " black on yellow
  highlight TodoNormal      ctermfg=233 ctermbg=246 cterm=none " gray
  highlight TodoP0          ctermfg=231 ctermbg=160 cterm=none " red
  highlight TodoP1          ctermfg=234 ctermbg=208 cterm=none " orange
  highlight TodoPx          ctermfg=234 ctermbg=222 cterm=none " yellow
  highlight TodoBlocked     ctermfg=233 ctermbg=246 cterm=none " gray
  highlight TodoVerify      ctermfg=234 ctermbg=245 cterm=none " gray
  highlight TodoMarker      ctermfg=234 ctermbg=245 cterm=none " gray
  highlight TodoDone        ctermfg=236 ctermbg=34  cterm=none " green

  call matchadd('OnCallNormal', '^* \zs\<ONCALL')
  call matchadd('TodoNormal',   '\<TODO:')
  call matchadd('TodoNormal',   '\<TODO(\w\+):')
  call matchadd('TodoPx',       '^* \zs\<TODO(P\d)')
  call matchadd('TodoP1',       '^* \zs\<TODO(P1)')
  call matchadd('TodoP0',       '^* \zs\<TODO(P0)')
  call matchadd('TodoBlocked',  '^* \zs\<BLOCKED\>')
  call matchadd('TodoVerify',   '^* \zs\<VERIFY\>')
  call matchadd('TodoDone',     '^* \zs\<DONE\>')
  call matchadd('TodoMarker',   '<-------- [A-Za-z0-9 ]\+$')
endfunction

if has('autocmd')
  autocmd BufWinEnter,InsertEnter,InsertLeave *.md,*.mkd
    \ call SetMarkdownOptions()
endif

function OverrideBashHighlightGroup()
  highlight link Function   Normal
  highlight link Identifier Normal
endfunction

if has('autocmd')
  autocmd BufWinEnter,InsertEnter,InsertLeave *.sh,*bashrc
    \ call OverrideBashHighlightGroup()
endif

" Configure 100+ char error indicator (red font)
if exists('+colorcolumn') && !&diff
    set colorcolumn=80
    "let &colorcolumn="80,".join(range(120,999),",")
endif

" Window pane and tab switching
if !exists("g:os")
  let g:os = substitute(system('uname'), '\n', '', '')
endif

if has('macunix')
  " ctrl+v option+k
  nmap <silent> ˚ :wincmd k<CR>
  " ctrl+v option+j
  nmap <silent> ∆ :wincmd j<CR>
  " ctrl+v option+h
  nmap <silent> ˙ :wincmd h<CR>
  " ctrl+v option+l
  nmap <silent> ¬ :wincmd l<CR>
else
  nmap <silent> <M-k> :wincmd k<CR>
  nmap <silent> <M-j> :wincmd j<CR>
  nmap <silent> <M-h> :wincmd h<CR>
  nmap <silent> <M-l> :wincmd l<CR>
endif

map <silent> <Left> :tabprev<CR>
map <silent> <Right> :tabnext<CR>

" Map ctrl-c to copy visual selection to system clipboard
vnoremap <C-c> :w !pbcopy<CR><CR>

" Map shortcuts for window resizing
"nmap <silent> <M-h> :wincmd <<CR>
"nmap <silent> <M-l> :wincmd><CR>
"nmap <silent> <M-j> :wincmd-<CR>
"nmap <silent> <M-k> :wincmd+<CR>

let g:mapleader='\'
set notimeout nottimeout

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  PLUG LOADER                            "
"       https://github.com/junegunn/vim-plug              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" MAKE SURE YOU USE SINGLE QUOTES
" REMEMBER TO RELOAD .vimrc AND :PlugInstall

call plug#begin()

Plug 'https://github.com/nvim-lua/plenary.nvim'

" Remember to `:checkhealth telescope`
Plug 'https://github.com/nvim-telescope/telescope.nvim'

Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/JoosepAlviste/nvim-ts-context-commentstring'

Plug 'https://github.com/altercation/vim-colors-solarized'
Plug 'https://github.com/chriskempson/base16-vim'
Plug 'https://github.com/chriskempson/base16-default-schemes'

" nvim-tree
Plug 'https://github.com/kyazdani42/nvim-tree.lua'
Plug 'https://github.com/nvim-treesitter/nvim-treesitter'

" Status line
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'

" Syntax Highlighting
Plug 'https://github.com/chr4/nginx.vim'
Plug 'https://github.com/cespare/vim-toml', { 'branch': 'main' }
Plug 'https://github.com/hashivim/vim-terraform'

" Language Support
Plug 'https://github.com/fatih/vim-go'
Plug 'https://github.com/preservim/tagbar'
Plug 'https://github.com/kien/ctrlp.vim'

" Git gutter indicates lines added/removed/changed in the sidebar
Plug 'https://github.com/airblade/vim-gitgutter'

" Color Schemes
Plug 'https://github.com/romainl/Apprentice'

" https://github.com/Joorem/vim-haproxy
Plug 'Joorem/vim-haproxy'

" https://github.com/isobit/vim-caddyfile
Plug 'isobit/vim-caddyfile'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                TELESCOPE SETTINGS                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                NVIM-TREE SETTINGS                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <C-n> :NvimTreeToggle<CR>

nmap <CR> :NvimTreeFindFile<CR>

" Use \r to refresh the directory listing
nmap <Leader>r :NvimTreeRefresh<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"             Buffer Management Configuration             "
" https://vim.fandom.com/wiki/Easier_buffer_switching     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmode=list:longest,full
set wildchar=<TAB>   " use  <TAB> for command line completion
set wildmenu

" https://stackoverflow.com/a/42071865
function CloseOtherBuffers()
  execute "%bd|e#|bd#"
endfunction

" https://stackoverflow.com/a/57712826
" \ca -- close all buffers except current
nnoremap <leader>ca :w <bar> %bd <bar> e# <bar> bd# <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"             File Type Identification                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('autocmd')
  autocmd BufNewFile,BufRead *.hcl set syntax=terraform
  autocmd BufNewFile,BufRead *.tf set syntax=terraform
  " TypeScript syntax highlighting times out so use plain javascript
  autocmd BufNewFile,BufRead *.ts set syntax=javascript
  " Same for TypeScript with React
  autocmd BufNewFile,BufRead *.tsx set syntax=javascript
  " Jinja templates should use syntax of underlying config
  autocmd BufNewFile,BufRead *.yaml.tpl set syntax=yaml
  autocmd BufNewFile,BufRead *.yaml.j2 set syntax=yaml
  autocmd BufNewFile,BufRead *.json.tpl set syntax=javascript
  autocmd BufNewFile,BufRead *.json.j2 set syntax=javascript
  autocmd BufNewFile,BufRead *.confluence set syntax=confluencewiki
  autocmd BufNewFile,BufRead haproxy* set syntax=haproxy
endif

" Detect file types and load language indent files
" Also necessary for omnifunc completion
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  GoLang Settings                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType go setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd FileType go setlocal omnifunc=syntaxcomplete#Complete

" Make autocomplete prompt appear when '.' is pressed
autocmd filetype go inoremap <buffer> . .<C-x><C-o>

" https://github.com/fatih/vim-go
set autowrite
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  Python Settings                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python setlocal shiftwidth=4 tabstop=4 expandtab

" TODO: fixme
"autocmd BufNewFile,BufRead *.py
"    \ set tabstop=8
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix

set encoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  YAML Settings                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType yaml setlocal shiftwidth=4 tabstop=4 expandtab
autocmd BufNewFile,BufRead *.yaml setlocal ts=8 sts=4 sw=2 ai

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  JSON Settings                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType json setlocal shiftwidth=4 tabstop=4 expandtab
