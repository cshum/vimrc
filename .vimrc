set laststatus=2   "Always show statusline
set encoding=utf-8 
set t_Co=256

"Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle' 
Bundle 'L9'
Bundle 'airblade/vim-rooter' 
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'bling/vim-airline'
Bundle 'garbas/vim-snipmate'
Bundle 'bkad/CamelCaseMotion'
Bundle 'captbaritone/better-indent-support-for-php-with-html'
Bundle 'majutsushi/tagbar'
Bundle 'Xuyuanp/git-nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'edsono/vim-matchit'
Bundle 'scrooloose/syntastic'
Bundle 'StanAngeloff/php.vim'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'mattn/emmet-vim'
Bundle 'othree/html5.vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'groenewege/vim-less'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-markdown'
Bundle 'tangledhelix/vim-octopress'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "briancollins/vim-jst"
Bundle "mustache/vim-mustache-handlebars"
Bundle 'kchmck/vim-coffee-script'
Bundle 'mmikitka/vim-drupal'
Bundle 'walm/jshint.vim'
Bundle 'godlygeek/tabular'
Bundle 'tomtom/tcomment_vim'
Bundle 'sjl/gundo.vim'
"Bundle 'airblade/vim-gitgutter'
"Bundle 'technosophos/drupal-snippets'
"Bundle 'honza/vim-snippets'
"Bundle 'scrooloose/nerdtree'

if has("gui_win32") || has("gui_win64")
	Bundle 'xolox/vim-shell'
endif
colorscheme koehler
if has('gui_running')
  Bundle 'tpope/vim-vividchalk'
	Bundle 'skammer/vim-css-color'
  colorscheme vividchalk
endif

Bundle 'godlygeek/csapprox'

syntax on
filetype plugin indent on


set number " show line numbers
set wildmenu
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set nofoldenable
set autoread " auto reload files
set incsearch " highlight when typing search
set hlsearch " highlight search
set nohidden "clear buffer when close
set directory=~/.vim "swp dir
au BufNewFile,BufRead *.tex,*.md,*.markdown setlocal spell "spellcheck
au VimResized * :wincmd = "Resize splits when the window is resized

set wildignore=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,coverage/*,public/*,tmp/*,log/*,doc/*

" Make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase

let mapleader=" "

"GUI Condition
if has('gui_running')
	set guioptions-=T  "remove toolbar
	set guioptions-=m  "remove menubar
	set guioptions+=LlRrb 
	set guioptions-=LlRrb "remove scrollbars
endif
if has('gui_macvim')
	set sh=/bin/sh 
	set guifont=Monaco:h13
endif
if has("gui_win32") || has("gui_win64")
	set guifont=Consolas:h11
	au GUIEnter * simalt ~x "maximize window
endif
if has('gui_gtk2')
endif

"Airline
" remove separators
let g:airline_left_sep=''
let g:airline_right_sep=''

"NERD Tree stuffs
map <Leader>nt :NERDTree<CR>
map <Leader>nf :NERDTreeFind<CR>
let g:NERDTreeWinSize = 25
let NERDTreeChDirMode = 2

"TagBar
map <leader>tb :TagbarToggle<cr>
let g:tagbar_width = 30

"AutoComplete
set ofu=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"CtrlP
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files --exclude-standard']
let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\v\.(exe|so|dll|jpg|png|gif|ai|db)$'
\ }

"Easy Motion"
let g:EasyMotion_leader_key = '<Leader>'

"Rooter
let g:rooter_patterns = ['.git', '.svn/']
let g:rooter_use_lcd = 1

"CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

"Emmet
let g:user_emmet_expandabbr_key = '<tab>'

"CoffeeScript
autocmd FileType coffee nnoremap <buffer> <leader>cc :CoffeeCompile vert<cr>
autocmd FileType coffee vnoremap <buffer> <leader>cc :CoffeeCompile vert<cr>
autocmd FileType coffee nnoremap <buffer> <leader>cr :CoffeeRun<cr>
autocmd FileType coffee vnoremap <buffer> <leader>cR :CoffeeRun<cr>
autocmd FileType coffee nnoremap <buffer> <leader>cl :CoffeeLint<cr>
autocmd FileType coffee nnoremap <buffer> <leader>cm :CoffeeMake<cr>
autocmd FileType coffee nnoremap <buffer> <leader>cM :CoffeeMake

" Quickfix
nnoremap <leader><down> :cnext<cr>
nnoremap <leader><up> :cprev<cr>
nnoremap <leader><left> :cfirst<cr>
nnoremap <leader><right> :clast<cr>

"Fugitive
autocmd User Fugitive noremap <buffer> <leader>gs :Gstatus<cr>
autocmd User Fugitive noremap <buffer> <leader>gg :Ggrep ""<left>
autocmd User Fugitive noremap <buffer> <leader>gw :Gwrite<cr>
autocmd User Fugitive noremap <buffer> <leader>gc :Gcommit -m ""<left>
autocmd User Fugitive noremap <buffer> <leader>gd :Gdiff<cr>
autocmd User Fugitive noremap <buffer> <leader>gl :Glog<cr>
autocmd User Fugitive noremap <buffer> <leader>gal :Glog --<cr>
autocmd User Fugitive noremap <buffer> <leader>gp :Git pull 
autocmd User Fugitive noremap <buffer> <leader>gh :Git push 

autocmd VimEnter .git/PULLREQ_EDIT_MSG setl wrap textwidth=0

" Tabular
nmap <Leader>a= :Tabularize /^[^=]*\zs=>\?<CR>
vmap <Leader>a= :Tabularize /^[^=]*\zs=>\?<CR>
nmap <Leader>a: :Tabularize /:\zs/l0r1<CR>
vmap <Leader>a: :Tabularize /:\zs/l0r1<CR>
nmap <Leader>a, :Tabularize /,\zs/l1r0<CR>
vmap <Leader>a, :Tabularize /,\zs/l1r0<CR>

" Gundo Vim
noremap <leader>gt :GundoToggle<CR>
