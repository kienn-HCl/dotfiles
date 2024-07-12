let mapleader = "\<Space>"


" Automatic installation on startup
let s:jetpackfile = stdpath('data') .. '/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
let s:jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if !filereadable(s:jetpackfile)
  call system(printf('curl -fsSLo %s --create-dirs %s', s:jetpackfile, s:jetpackurl))
endif

packadd vim-jetpack
call jetpack#begin()
call jetpack#add('tani/vim-jetpack', {'opt': 1}) "bootstrap
call jetpack#load_toml(expand('~/.config/nvim/plugin-toml/jetpack.toml'))
call jetpack#end()

" Automatic plugin installation on startup
for name in jetpack#names()
  if !jetpack#tap(name)
    call jetpack#sync()
    break
  endif
endfor

"basic settings

" 行番号の表示
set number

" 対応カッコ表示
set showmatch matchtime=1

" 入力中コマンド表示
set showcmd

" 行末のスペースを可視化
set listchars=tab:^\ ,trail:~

" 対応カッコ強調
set showmatch

" タイトル表示
set title

" ステータスバー常に表示
set laststatus=2

" 文字コードをutf-8に"
set encoding=utf8

" 文字コード自動判別
set fileencodings=utf-8,sjis,iso2022-jp,euc-jp

" 改行コード自動認識
set fileformats=unix,dos,mac

" クリップボード有効化
set clipboard=unnamedplus

set wrap

" :eで開くときにファイル候補表示
set wildmenu 

" ヤンクしたときにクリップボードに入るようにする。
set clipboard=unnamedplus

" ★が崩れるのを解決
"set ambiwidth=double

" カーソルラインハイライト
set cursorline

set inccommand=split

filetype plugin indent on

autocmd BufNewFile,BufRead *.toml  setfiletype=toml
" ここからプラグイン依存設定
"
" 補完のときの挙動をIDEに揃える
set completeopt=menuone,noinsert
" ここまで

" https://qiita.com/Linda_pp/items/9e0c94eb82b18071db34
if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif
" ここまで
"
set hidden
"set encoding=utf-8
"set number
"set showmatch
"set hlsearch
"set synmaxcol=400
set tabstop=4
set softtabstop=4
"set wildmode=list:longest
set expandtab
set shiftwidth=4
set autoindent
set cindent
"set wildmenu
"set history=5000
"set laststatus=2
"set timeoutlen=500

vnoremap <c-a> <c-a>gv
vnoremap <c-x> <c-x>gv

nnoremap <Esc><Esc> :nohlsearch<CR>

inoremap <silent> jj <ESC>
set helplang=ja


let g:previm_open_cmd = 'chrome'

set signcolumn=yes
