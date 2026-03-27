" ====================================================================
" 1. 基本設定 (表示・動作)
" ====================================================================
set fenc=utf-8          " 文字コードをUTF-8に設定
set nobackup            " バックアップファイルを作らない
set noswapfile          " スワップファイルを作らない
set autoread            " 他で書き換えられたら自動で読み直す
set showcmd             " 入力中のコマンドを下部に表示
set number              " 行番号を表示
set cursorline          " カーソル行をハイライト
set laststatus=2        " ステータスラインを常に表示
set mouse=a             " マウス操作を有効化
set nowrap              " 長い行を折り返さない
set re=0                " 正規表現エンジンを最適化

" --- インデント・タブ ---
set smartindent         " 改行時に自動でインデント
set expandtab           " タブをスペースに変換
set tabstop=2           " タブの幅をスペース2個分に
set shiftwidth=2        " 自動インデント時の幅を2個分に

" ====================================================================
" 2. 検索設定
" ====================================================================
set ignorecase          " 検索時に大文字小文字を区別しない
set incsearch           " 1文字入力するごとに検索結果を表示
set wrapscan            " 最後まで検索したら先頭に戻る
set hlsearch            " 検索結果をハイライト
set showmatch           " 括弧の対応をハイライト

" --- 検索ハイライト解除 ---
" Esc2回押しで検索のハイライトを消す
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

" ====================================================================
" 3. キーバインド (ショートカット)
" ====================================================================
" インサートモードで 'jj' と打つと Esc になる
inoremap <silent> jj <ESC>

" 間違えて記録が始まらないよう 'q' (マクロ記録) を無効化
nnoremap q <Nop>

" ====================================================================
" 4. プラグイン管理 (vim-plug)
" ====================================================================
" :PlugInstall   - プラグインのインストール
" :PlugUpdate    - プラグインの更新
" :PlugClean     - 不要なプラグインの削除
" :PlugStatus    - 状態確認

call plug#begin()
  " LSP (補完・定義ジャンプ) 本体
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " VSCode風ダークテーマ
  Plug 'tomasiser/vim-code-dark'
call plug#end()

" ====================================================================
" 5. 外観 (カラースキーム)
" ====================================================================
syntax on
set termguicolors       " ターミナルアプリのテーマに引っ張られないようにする
colorscheme codedark    " テーマ適用

" ====================================================================
" 6. coc.nvim (LSP) の詳細設定
" ====================================================================
" :CocConfig         - coc本体の設定(json)を開く
" :CocList extensions - インストール済みの言語サーバー一覧
"   - coc-go
"   - coc-pyright
"   - coc-tsserver
" :CocInstall [名]    - 言語サーバーの追加


" --- 定義ジャンプ・参照 ---
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" --- ドキュメント表示 (Kキー) ---
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" --- 補完確定の設定 (Enterキー) ---
" 補完候補を選んだ状態で Enter を押しても改行せず確定のみ行う
inoremap <silent><nowait><expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" --- 補完選択の設定 (Tabキー) ---
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
