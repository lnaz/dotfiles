" カラースキーム
colorscheme torte
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
" 構文ハイライト
syntax enable
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



" NeoBundle設定
" 別途↓も実行
" mkdet noswapfile
"  27 set nowrr -p ~/.vim/bundle
" git clone https://github.com/Shougo/neobundle.vim  ~/.vim/bundle/neobundle.vim
set nocompatible
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
" インストールしたいプラグイン列挙
" インストールしたら':NeoBundleInstall'
" アップデートは':NeoBundleUpdate'
NeoBundle "tyru/caw.vim"

call neobundle#end()
filetype plugin indent on

" コメントアウトを切り替えるマッピング
" \c でカーソル行をコメントアウト
" 再度 \c でコメントアウトを解除
" 選択してから複数行の \c も可能
nmap \c <Plug>(caw:I:toggle)
vmap \c <Plug>(caw:I:toggle)

" \C でコメントアウトの解除
nmap \C <Plug>(caw:I:uncomment)
vmap \C <Plug>(caw:I:uncomment)
