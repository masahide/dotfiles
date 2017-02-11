"
" MAIN CUSTOMIZATION FILE
"


" for Neobundle {{{

let s:vim_home=expand('~/.vim')
if has('vim_starting')
	let &runtimepath.=printf(',%s/neobundle.vim.git', s:vim_home)
    call neobundle#rc(expand(s:vim_home.'/.bundle'))
endif

set nocompatible

"NeoBundle 'git://github.com/Shougo/clang_complete.git'
NeoBundle 'git://github.com/Shougo/echodoc.git'
NeoBundle 'git://github.com/Shougo/vimproc'
"NeoBundle 'git://github.com/Shougo/neocomplcache.git'
"NeoBundle 'git://github.com/Shougo/neosnippet.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
"NeoBundle 'git://github.com/Shougo/vim-vcs.git'
"NeoBundle 'git://github.com/Shougo/vimfiler.git'
"NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/Shougo/vinarise.git'
"NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'git@github.com:itchyny/lightline.vim.git'
NeoBundle 'git://github.com/altercation/vim-colors-solarized.git'
NeoBundle 'git://github.com/thinca/vim-ref.git'
NeoBundle 'git://github.com/tpope/vim-fugitive.git'
"NeoBundle 'git://github.com/joonty/vim-xdebug.git'
NeoBundle 'git://github.com/kana/vim-fakeclip.git'
NeoBundle 'https://github.com/fuenor/im_control.vim.git'
NeoBundle 'git://github.com/scrooloose/nerdtree.git'
NeoBundle 'git://github.com/scrooloose/syntastic.git'
NeoBundle 'Blackrush/vim-gocode'
NeoBundle 'matchit.zip'
NeoBundle 'vim-scripts/tagbar-phpctags',{
  \   'build' : {
  \     'windows' : '',
  \     'others' : 'chmod +x bin/phpctags',
  \   },
  \ }

"golang vim http://qiita.com/shiena/items/870ac0f1db8e9a8672a7
NeoBundle 'majutsushi/tagbar'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'soh335/unite-outline-go'
NeoBundle 'dgryski/vim-godef'
NeoBundle 'https://github.com/fatih/vim-go'
NeoBundle 'https://github.com/vim-jp/vim-go-extra.git'
NeoBundle 'git://github.com/ClockworkNet/vim-junos-syntax.git'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'fisadev/vim-isort'

" Enable loading filetype and indentation plugins
filetype plugin on
filetype indent on

" Turn syntax highlighting on
syntax on
NeoBundleCheck
" }}}

"if has('mac')
"	set g:disable_IM_Control = 1
"endif

"
" GLOBAL SETTINGS
"

" Write contents of the file, if it has been modified, on buffer exit set autowrite

" Allow backspacing over everything
set backspace=indent,eol,start

" Insert mode completion options
set completeopt=menu,longest,preview


if has('win32')
    set enc=cp932
else
" Use UTF-8 as the default buffer encoding
    set enc=utf-8
endif


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

set softtabstop=4
"set expandtab
set listchars=tab:>-
"highlight SpecialKey ctermfg=1     " ターミナル版での文字色指定
"highlight SpecialKey ctermbg=7     " ターミナル版での背景色指定
"highlight SpecialKey guifg=gray    " GUI版での文字色指定
"highlight SpecialKey guibg=#012345 " GUI版での背景色指定
set autoindent

" ファイルが選択されたらウィンドウを閉じる
":let g:proj_flags = "imstc"

"" <Leader>P プロジェクトとトグルで開閉
":nmap <silent> <Leader>P <Plug>ToggleProject
"" <Leader>p デフォルトのプロジェクトを開く
":nmap <silent> <Leader>p :Project<CR>
" git add
"let g:proj_run1='!git add %f'
"let g:proj_run_fold1='*!git add %f'
"" git checkout
"let g:proj_run2='git checkout -- %f'
"let g:proj_run_fold="!git checkout -- %f"
"" git status
"let g:proj_run3='!git status'
"

:set helplang=ja,en

"let g:Powerline_symbols = 'fancy'

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
syntax enable
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_degrade=0
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_termtrans=1
"let g:solarized_contrast="high"
"let g:solarized_visiBILITY="high"
colorscheme solarized
"colorscheme wombat256

call togglebg#map("<F1>")

" クリップボードにコピー
vmap <C-c> :w !xsel -ib<CR><CR>

"
" unite.vim
"
" @see http://blog.remora.cx/2010/12/vim-ref-with-unite.html

" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" 初期設定関数を起動する
au FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
	" Overwrite settings.
endfunction
" 様々なショートカット
"call unite#set_substitute_pattern('file', '\$\w\+', '\=eval(submatch(0))', 200)
"call unite#set_substitute_pattern('file', '^@@', '\=fnamemodify(expand("#"), ":p:h")."/"', 2)
"call unite#set_substitute_pattern('file', '^@', '\=getcwd()."/*"', 1)
"call unite#set_substitute_pattern('file', '^;r', '\=$VIMRUNTIME."/"')
"call unite#set_substitute_pattern('file', '^\~', escape($HOME, '\'), -2)
"call unite#set_substitute_pattern('file', '\\\@<! ', '\\ ', -20)
"call unite#set_substitute_pattern('file', '\\ \@!', '/', -30)
"if has('win32') || has('win64')
"	call unite#set_substitute_pattern('file', '^;p', 'C:/Program Files/')
"	call unite#set_substitute_pattern('file', '^;v', '~/vimfiles/')
"else
"	call unite#set_substitute_pattern('file', '^;v', '~/.vim/')
"endif

" ref-vim
let g:ref_phpmanual_path = $HOME . '/.vim/phpdoc/php-chunked-xhtml'
let g:ref_source_webdict_sites  = {
\   'wikipedia:ja': 'http://ja.wikipedia.org/wiki/%s',
\   'wiktionary': {
\     'url': 'http://ja.wiktionary.org/wiki/%s',
\     'keyword_encoding': 'utf-8',
\     'cache': 1,
\   },
\   'yahoo': {
\     'url': 'http://dic.search.yahoo.co.jp/search?p=%s',
\     'keyword_encoding': 'utf-8',
\     'cache': 1,
\   }
\ }
" 出力に対するフィルタ。最初の数行を削除している。
function! g:ref_source_webdict_sites.wiktionary.filter(output)
  return join(split(a:output, "\n")[18 :], "\n")
endfunction
function! g:ref_source_webdict_sites.yahoo.filter(output)
  return join(split(a:output, "\n")[47 :], "\n")
endfunction
let g:ref_source_webdict_sites.default = 'yahoo'
nnoremap ,,k :<C-u>Ref webdict<Space><C-r><C-w><CR>


"
" neocomplcache の設定
"function InsertTabWrapper()
"	if pumvisible()
"		return "\<c-n>"
"	endif
"	let col = col('.') - 1
"	if !col || getline('.')[col - 1] !~ '\k\|<\|/'
"		return "\<tab>"
"	elseif exists('&omnifunc') && &omnifunc == ''
"		return "\<c-n>"
"	else
"		return "\<c-x>\<c-o>"
"	endif
"endfunction
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>

if has('mac')
    set clipboard=autoselect
elseif has('win32')
    set clipboard=unnamed,autoselect
else
    set clipboard+=unnamedplus,autoselect
endif


set modeline


" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

let g:neosnippet#snippets_directory= $HOME . '/.vim/snippets'

""
"" neocomplcache & neosnippet
""
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

function! Cucfirst(str)
	return substitute(strpart(a:str,0,strlen(a:str)-4), '\w\+', '\u\0', "")
endfunction

function! CiFilePos(str)
	if a:str =~ ".\.system.\."
		return '.' . matchstr(a:str, "\/system/.*$")
	elseif a:str =~ ".\.application.\."
		return '.' . matchstr(a:str, "\/application/.*$")
	else
		return a:str
endfunction


function! s:Paste64Copy() range
	let l:tmp = @@
	silent normal gvy
	let l:selected = @@
	let l:i = 0
	let l:len = strlen(l:selected)
	let l:escaped = ''
	while l:i < l:len
		let l:c = strpart(l:selected, l:i, 1)
		let l:escaped .= printf("\\u%04x", char2nr(l:c))
		let l:i = l:i + 1
	endwhile
	if $TMUX != ""
		"tmuxのとき
		call system('printf "\x1bPtmux;\x1b\x1b]52;;%s\x1b\x1b\\\\\x1b\\" `echo -en "' . l:escaped . '" | base64` > /dev/tty')
	elseif $TERM == "screen"
		"GNU Screenのとき
		call system('printf "\x1bP\x1b]52;;%s\x07\x1b\\" `echo -en "' . l:escaped . '" | base64` > /dev/tty')
	else
		call system('printf "\x1b]52;;%s\x1b\\" `echo -en "' . l:escaped . '" | base64` > /dev/tty')
	endif
	redraw!
endfunction

command! -range Paste64Copy :call s:Paste64Copy()


"golang vim http://qiita.com/shiena/items/870ac0f1db8e9a8672a7
" for golang {{{
if $GOROOT != ''
	"set rtp+=$GOROOT/misc/vim
endif
if $GOPATH != ''
	"set rtp^=$GOPATH/src/github.com/nsf/gocode/vim
	set path+=$GOPATH/src
endif
let g:gofmt_command = 'goimports'
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_term_enabled = 1
let g:go_highlight_build_constraints = 1
augroup GolangSettings
	autocmd!
	autocmd FileType go nmap <leader>gr <Plug>(go-run)
	autocmd FileType go nmap <leader>gc <Plug>(go-coverage)
	autocmd FileType go nmap <leader>gb <Plug>(go-build)
	autocmd FileType go nmap <leader>gt <Plug>(go-test)
	autocmd FileType go nmap <Leader>ds <Plug>(go-def-split)
	autocmd FileType go nmap <Leader>dv <Plug>(go-def-vertical)
	autocmd FileType go nmap <Leader>dt <Plug>(go-def-tab)
	autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
	autocmd FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
	autocmd FileType go :highlight goErr cterm=bold ctermfg=214
	autocmd FileType go :match goErr /\<err\>/
augroup END
au BufWritePre *.go Fmt
au BufNewFile,BufRead *.go set sw=4 noexpandtab ts=4 completeopt=menu,preview
au FileType go compiler go
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['go'] }
let g:syntastic_go_checkers = ['go', 'golint']

"}}}

" VimFilerTree {{{
command! VimFilerTree call VimFilerTree()
function VimFilerTree()
	exec ':VimFiler -buffer-name=explorer -split -simple -winwidth=45 -toggle -no-quit'
	wincmd t
	setl winfixwidth
endfunction
autocmd! FileType vimfiler call g:my_vimfiler_settings()
"function! g:my_vimfiler_settings()
"	nmap     <buffer><expr><CR> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
"	nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<CR>
"	nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<CR>
"endfunction

let my_action = {'is_selectable' : 1}
function! my_action.func(candidates)
	wincmd p
	exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', my_action)

let my_action = {'is_selectable' : 1}
function! my_action.func(candidates)
	wincmd p
	exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', my_action)
" }}}

set cmdheight=1
let g:syntastic_python_checkers = ["flake8"]
