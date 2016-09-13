"NeoBundle Scripts-----------------------------
if has('vim_starting')
	if &compatible
		set nocompatible               " Be iMproved
	endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'tyru/caw.vim'
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'Shougo/neoinclude.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'justmao945/vim-clang'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'kana/vim-submode'
NeoBundle 'tomasr/molokai'
NeoBundle 'lervag/vimtex'
" NeoBundleLazy "thinca/vim-quickrun", {
"       \ 'depends': 'osyo-manga/shabadou.vim'
"       \ 'autoload': {
"       \   'mappings': [['nxo', '<Plug>(quickrun)']]
"       \ }}
" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
NeoBundle 'tpope/vim-endwise'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

" Tabの設定
set tabstop=4
set autoindent
set shiftwidth=4
" set shiftround
" Tabかスペースか
" expandtabでスペースに
set expandtab
" set noexpandtab
" Y -> 行末までヤンク
nnoremap Y y$
" 行の最後まで表示
set display=lastline
" 補間メニューの数
" set pumheight=10
" 行番号
set number
" 不可視文字を表示,設定
set list
set listchars=tab:\ \ ,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
" 右下に表示される行・列の番号
set ruler
" 対応するカッコの表示
set showmatch
set matchtime=1
" 対応付けるカッコの種類を追加
set matchpairs& matchpairs+=<:>
" エンコード
set encoding=utf8
" スクロール時，下が見えるように
set scrolloff=5
" .swapファイルやバックアップを作らない
set noswapfile
set nowritebackup
set nobackup
" バックスペースで各種消せるように
set backspace=indent,eol,start
" マウスモード有効
set mouse=a
" コマンドを画面最下部に表示
set showcmd
" クリップボードとヤンク共有
set clipboard=unnamed,autoselect
" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk
" :w,:qを大文字でも可に
cnoremap W w
cnoremap Q q
" vを二回で行末まで選択
vnoremap v $h
" Dでヤンクしない
nnoremap D "_D
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ウィンドウタイトルにファイルパス
set title
" 検索結果をハイライト，ESC2回で解除
set hlsearch
nnoremap <ESC><ESC> :noh<CR>
" 検索ワードの途中でも検索
set incsearch
" 下に分割
set splitbelow
" ウィンドウ分割したとき，アクティブを変更
" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>
"インサートモードでも移動
inoremap <c-d> <delete>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>
"画面切り替え
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
" 記録機能を無効化
nnoremap q <nop>
" 構文ハイライト
syntax on
" 全角スペースの表示
" http://inari.hatenablog.com/entry/2014/05/05/231307
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif

"molokai-----------------------------------------------------------------
colorscheme molokai
set t_Co=256

" caw.vimの設定
" コメントアウトを切り替えるマッピング
" \c でカーソル行をコメントアウト
" 再度 \c でコメントアウトを解除
" 選択してから複数行の \c も可能
nmap \c <Plug>(caw:zeropos:toggle)
vmap \c <Plug>(caw:zeropos:toggle)
" \C でコメントアウトの解除
nmap \C <Plug>(caw:zeropos:uncomment)
vmap \C <Plug>(caw:zeropos:uncomment)

"neocomplete, jedi---------------------------------------------------------
"参考:http://dackdive.hateblo.jp/entry/2014/08/13/130000
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	" return neocomplete#close_popup() . "\<CR>"
	" For no inserting <CR> key.
	return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

"vim-indent-guides-----------------------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=234
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

"vim-submode----------------------------------------------
" xでたくさん消しても一発undo可能に
" function! s:my_x()
"     undojoin
"     normal! "_x
" endfunction
" nnoremap <silent> <Plug>(my-x) :<C-u>call <SID>my_x()<CR>
" call submode#enter_with('my_x', 'n', '', 'x', '"_x')
" call submode#map('my_x', 'n', 'r', 'x', '<Plug>(my-x)')

" "vim-quickrun-------------------------------------------------
" nmap <Leader>r <Plug>(quickrun)
" let s:hooks = neobundle#get_hooks("vim-quickrun")
" function! s:hooks.on_source(bundle)
"   let g:quickrun_config = {
"         \   "_": {
" 				\			"outputter/buffer/split": ":botright 8sp",
" 				\			"outputter/buffer/into": 1,
"         \     "hook/close_quickfix/enable_success" : 1,
"         \     "hook/close_buffer/enable_failure" : 1,
"         \     "outputter" : "multi:buffer:quickfix",
"         \     "hook/neco/enable" : 1,
"         \     "hook/neco/wait" : 20,
"         \     "runner": "vimproc",
"         \     "hook/time/enable" : 1,
"         \   },
"         \   'tex':{
"         \     'command' : 'latexmk',
"         \     'cmdopt': '-pdfdvi -pvc',
"         \     'exec': ['%c %o %s']
"         \   },
"         \   'python':{
"         \     'command' : 'python',
"         \     'exec': ['%c %s']
"         \   },
"         \ }
" endfunction
" " q でquickfixを閉じれるようにする。
" au FileType qf nnoremap <silent><buffer>q :quit<CR>
" " \r で保存してからquickrunを実行する。
" let g:quickrun_no_default_key_mappings = 1
" nnoremap <Leader>r :write<CR>:QuickRun -mode n<CR>
" xnoremap <Leader>r :<C-U>write<CR>gv:QuickRun -mode v<CR>
" " \r でquickfixを閉じて、保存してからquickrunを実行する。
" let g:quickrun_no_default_key_mappings = 1
" nnoremap <Leader>r :cclose<CR>:write<CR>:QuickRun -mode n<CR>
" xnoremap <Leader>r :<C-U>cclose<CR>:write<CR>gv:QuickRun -mode v<CR>
" " <C-c> でquickrunを停止
" nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

"vimtex---------------------------------------------------------
let g:tex_flavor='latex'
let g:vimtex_latexmk_options = '-pdf'
" texのconcealを無効化
" let g:tex_conceal=''
" let g:vimtex_fold_enabled = 1
" let g:vimtex_fold_automatic = 1
" let g:vimtex_fold_envs = 1
" let g:vimtex_toc_split_pos = "topleft"
" let g:vimtex_toc_width = 10
" if !exists('g:neocomplete#sources#omni#input_patterns')
"   let g:neocomplete#sources#omni#input_patterns = {}
" endiopenedf
" let g:neocomplete#sources#omni#input_patterns.tex = "\\cite{\s*[0-9A-Za-z_:]*\|\\ref{\s*[0-9A-Za-z_:]*"
"
" augroup myLaTeXQuickrun
"     au!
"     if has('gui_running')
"         au BufEnter *.tex inoremap <silent> $  <C-g>u$$<ESC>:call IMState("Leave")<CR>i
"     endif
" augroup END
"
" function! s:TeXDollarFunc()
"     " ime fixed?
"     let s:cmd = "<Left>"
"     if g:IMState == 2
"         s:cmd += "<C-^>"
"     endif
"
"     return s:cmd
" endfunction

"Unite------------------------------------------------------------------
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    <Leader>f [unite]
" unite.vim keymap
let g:unite_source_history_yank_enable =1
nnoremap <silent> [unite]u :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]g :<C-u>Unite<Space>grep<CR>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]c :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,vr :UniteResume<CR>
" vinarise
let g:vinarise_enable_auto_detect = 1 
" unite-build map
nnoremap <silent> ,vb :Unite build<CR>
nnoremap <silent> ,vcb :Unite build:!<CR>
nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_max_candidates = 200
let g:unite_source_grep_recursive_opt = ''
" 挿入モードで開始
let g:unite_enable_start_insert=1
" unite-grepの便利キーマップ
vnoremap /g y:Unite grep::-iRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>
" 大文字小文字を区別しない  
let g:unite_enable_ignore_case = 1  
let g:unite_enable_smart_case = 1
" ESCキーを2回押すと終了する  
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"vimfiler---------------------------------------------------------
nnoremap <leader>e :VimFilerExplore -split -winwidth=30 -find -no-quit -buffer-name=vimfiler<CR>
au FileType vimfiler nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
nnoremap <ESC><ESC> :VimFilerClose vimfiler<CR>
