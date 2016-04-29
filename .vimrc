" Tabの設定
set tabstop=4
set autoindent
set shiftwidth=4
set shiftround
" Tabかスペースか
set noexpandtab
" Y -> 行末までヤンク
nnoremap Y y$
" 行の最後まで表示
set display=lastline
" 補間メニューの数
set pumheight=10
" 行番号
set number
" 不可視文字を表示,設定
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
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
" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk
" vを二回で行末まで選択
vnoremap v $h
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

" deinの設定
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/bundle/.dein')
" dein.vim本体
let s:dein_repo_dir = expand('~/.vim/bundle/dein.vim')
let s:rc_dir = expand('~/.vim/rc')

" dein.vimがなければgithubから落としてくる
if &runtimepath !~# '/dein.vim'
	if !isdirectory(s:dein_repo_dir)
		execute '! git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
	endif
	execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

	" プラグインリストを収めたTOMKファイル
	let s:toml = s:rc_dir . '/dein.toml'
	let s:lazy_toml = s:rc_dir . '/dein_lazy.toml'

	" TOMLを読み込み，キャッシュをしておく
	call dein#load_toml(s:toml, {'lazy': 0})
	call dein#load_toml(s:lazy_toml, {'lazy': 1})

	" 設定終了
	call dein#end()
	call dein#save_state()
endif

" もし，未インストールのものがあったらインストール
if dein#check_install()
	call dein#install()
endif

" 構文ハイライト
syntax on
" カラースキーム
let g:hybrid_custom_term_colors = 1
colorscheme hybrid

" コメントアウトを切り替えるマッピング
" \c でカーソル行をコメントアウト
" 再度 \c でコメントアウトを解除
" 選択してから複数行の \c も可能
nmap \c <Plug>(caw:zeropos:toggle)
vmap \c <Plug>(caw:zeropos:toggle)

" \C でコメントアウトの解除
nmap \C <Plug>(caw:zeropos:uncomment)
vmap \C <Plug>(caw:zeropos:uncomment)

