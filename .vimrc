" Tabをスペース4つに展開&Tabの設定
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
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
" 対応するカッコの表示
set showmatch
set matchtime=1
" カラースキーム
colorscheme torte
" NeoBundle設定
" 別途↓も実行
" mkdir -p ~/.vim/bundle
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

call neobundle#end()
filetype plugin indent on
