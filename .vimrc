"
" MAIN CUSTOMIZATION FILE
"

set nocompatible
filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/neobundle.vim.git
	call neobundle#rc(expand('~/.vim/.bundle'))
endif

NeoBundle 'git://github.com/Shougo/clang_complete.git'
NeoBundle 'git://github.com/Shougo/echodoc.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vim-vcs.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/Shougo/vinarise.git'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'git://github.com/altercation/vim-colors-solarized.git'

" Enable loading filetype and indentation plugins
filetype plugin on
filetype indent on

" Turn syntax highlighting on
syntax on

"
" GLOBAL SETTINGS
"

" Write contents of the file, if it has been modified, on buffer exit set autowrite

" Allow backspacing over everything
set backspace=indent,eol,start

" Insert mode completion options
set completeopt=menu,longest,preview

" Use UTF-8 as the default buffer encoding
set enc=utf-8

" Remember up to 100 'colon' commmands and search patterns
set history=1000

" Enable incremental search
set incsearch
set ignorecase
set smartcase

" Always show status line, even for one window
set laststatus=2

" Jump to matching bracket for 2/10th of a second (works with showmatch)
set matchtime=2

set hlsearch

" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

" Use F10 to toggle 'paste' mode
set pastetoggle=<F10>

" Show line, column number, and relative position within a file in the status line
set ruler

" Scroll when cursor gets within 3 characters of top/bottom edge
set scrolloff=3

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" Use 4 spaces for (auto)indent
set shiftwidth=4

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" When a bracket is inserted, briefly jump to a matching one
set showmatch

" Don't request terminal version string (for xterm)
set t_RV=

" Use 4 spaces for <Tab> and :retab
set tabstop=4

" Write swap file to disk after every 50 characters
set updatecount=50

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history 
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:200,%,n~/.viminfo

" Use menu to show command-line completion (in 'full' case)
set wildmenu

" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

" Fix my <Backspace> key (in Mac OS X Terminal)
set t_kb=
fixdel

" Avoid loading MatchParen plugin
let loaded_matchparen = 1

" netRW: Open files in a split window
let g:netrw_browse_split = 1

"
" MAPPINGS
"

" save changes
map ,s :w<CR>
" exit vim without saving any changes
map ,q :q!<CR>
" exit vim saving changes
map ,w :x<CR>
" switch to upper/lower window quickly
map <C-J> <C-W>j
map <C-K> <C-W>k
" use CTRL-F for omni completion
imap <C-F> 
" map CTRL-L to piece-wise copying of the line above the current one
imap <C-L> @@@<ESC>hhkywjl?@@@<CR>P/@@@<CR>3s
" map ,f to display all lines with keyword under cursor and ask which one to
" jump to
nmap ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
" use <F6> to toggle line numbers
nmap <silent> <F6> :set number!<CR>
" page down with <Space>
nmap <Space> <PageDown>
" open filename under cursor in a new window (use current file's working
" directory) 
nmap gf :new %:p:h/<cfile><CR>
" map <Alt-p> and <Alt-P> to paste below/above and reformat
nnoremap <Esc>P  P'[v']=
nnoremap <Esc>p  p'[v']=
" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv 

" Generic highlight changes
highlight Comment cterm=none ctermfg=Gray
highlight IncSearch cterm=none ctermfg=Black ctermbg=DarkYellow
highlight Search cterm=none ctermfg=Black ctermbg=DarkYellow
highlight String cterm=none ctermfg=DarkGreen
highlight treeDir cterm=none ctermfg=Cyan
highlight treeUp cterm=none ctermfg=DarkYellow
highlight treeCWD cterm=none ctermfg=DarkYellow
highlight netrwDir cterm=none ctermfg=Cyan

" Set the <Leader> for combo commands
"let mapleader = ","

" 全角スペース・行末のスペース・タブの可視化
"if has("syntax")
"    syntax on
" 
"    " PODバグ対策
"    syn sync fromstart
" 
"    function! ActivateInvisibleIndicator()
"        syntax match InvisibleJISX0208Space "　" display containedin=ALL
"        highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
"        "syntax match InvisibleTrailedSpace "[ \t]\+$" display containedin=ALL
"        "highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=NONE gui=undercurl guisp=darkorange
"        "syntax match InvisibleTab "\t" display containedin=ALL
"        "highlight InvisibleTab term=underline ctermbg=white gui=undercurl guisp=darkslategray
"    endf
"    augroup invisible
"        autocmd! invisible
"        autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
"    augroup END
"endif

if has('persistent_undo')
    set undodir=~/.vim/undo
    set undofile
endif
set backup
set backupdir=~/.vim/backup
set swapfile
set directory=~/.vim/tmp

set t_Co=256
set softtabstop=4
"set expandtab
set listchars=tab:>-
highlight SpecialKey ctermfg=1     " ターミナル版での文字色指定
highlight SpecialKey ctermbg=7     " ターミナル版での背景色指定
highlight SpecialKey guifg=gray    " GUI版での文字色指定
highlight SpecialKey guibg=#012345 " GUI版での背景色指定
set autoindent

" ファイルが選択されたらウィンドウを閉じる
":let g:proj_flags = "imstc"

" <Leader>P プロジェクトとトグルで開閉
:nmap <silent> <Leader>P <Plug>ToggleProject
" <Leader>p デフォルトのプロジェクトを開く
:nmap <silent> <Leader>p :Project<CR>

" git add
let g:proj_run1='!git add %f'
let g:proj_run_fold1='*!git add %f'

" git checkout
let g:proj_run2='git checkout -- %f'
let g:proj_run_fold="!git checkout -- %f"

" git status
let g:proj_run3='!git status'

:set helplang=ja,en

let g:Powerline_symbols = 'fancy'

" 「日本語入力固定モード」切替キー
inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>
" PythonによるIBus制御指定
let IM_CtrlIBusPython = 1

set mouse=a
set ttymouse=xterm2

" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch

" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM


" vim-colors-solarized
set background=dark
let g:solarized_termcolors=256
colorscheme solarized


