set nocompatible
filetype off

set laststatus=2   "Always show statusline
set encoding=utf-8 
set t_Co=256

"Vundle
if has("unix")
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
endif
if has("win32") || has("win64")
  set rtp+=~/vimfiles/bundle/Vundle.vim/
  let path='~/vimfiles/bundle'
  call vundle#begin(path)
endif

Plugin 'gmarik/vundle' 
Plugin 'L9'
Plugin 'xolox/vim-misc'
Plugin 'Shougo/vimproc'
Plugin 'Shougo/vimshell.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'airblade/vim-rooter' 
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'bling/vim-airline'
Plugin 'bkad/CamelCaseMotion'
Plugin 'captbaritone/better-indent-support-for-php-with-html'
Plugin 'majutsushi/tagbar'
Plugin 'Xuyuanp/git-nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'edsono/vim-matchit'
Plugin 'scrooloose/syntastic'
Plugin 'StanAngeloff/php.vim'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'mattn/emmet-vim'
Plugin 'othree/html5.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'groenewege/vim-less'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-markdown'
Plugin 'tangledhelix/vim-octopress'
Plugin 'tomtom/tlib_vim'
Plugin 'briancollins/vim-jst'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mmikitka/vim-drupal'
Plugin 'walm/jshint.vim'
Plugin 'godlygeek/tabular'
Plugin 'tomtom/tcomment_vim'
Plugin 'sjl/gundo.vim'
Plugin 'justinmk/vim-gtfo'
if has("unix")
  Plugin 'Raimondi/delimitMate'
  Plugin 'Valloric/YouCompleteMe'
endif

Plugin 'marijnh/tern_for_vim'

" Plugin 'garbas/vim-snipmate'
" Plugin 'honza/vim-snippets'
" Plugin 'technosophos/drupal-snippets'
" Plugin 'dsdeiz/vim-drupal-snippets'

if has("win32") || has("win64")
	Plugin 'xolox/vim-shell'
endif
colorscheme koehler
if has('gui_running')
	Plugin 'skammer/vim-css-color'
endif
Plugin 'godlygeek/csapprox'
Plugin 'tpope/vim-vividchalk'

call vundle#end()

filetype on
filetype plugin on
filetype indent on
syntax on
colorscheme vividchalk

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
au BufNewFile,BufRead *.tex,*.md,*.markdown setlocal spell "spellcheck
au VimResized * :wincmd = "Resize splits when the window is resized

set wildignore=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,coverage/*,public/*,tmp/*,log/*,doc/*

" Make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase
set pumheight=15

let mapleader=" "

"GUI Condition
if has('gui_running')
	set guioptions-=T  "remove toolbar
	set guioptions+=LlRrb 
	set guioptions-=LlRrb "remove scrollbars
endif
if has('gui_macvim')
	set guioptions-=m  "remove menubar
	set sh=/bin/sh 
	set guifont=Menlo:h13
endif
if has("gui_win32") || has("gui_win64")
	set guifont=Consolas:h11
	au GUIEnter * simalt ~x "maximize window
endif
if has('gui_gtk2')
endif

noremap <leader>vs :vsplit<CR>
noremap <leader>hs :split<CR>
nnoremap Q <nop>

"CoffeeScript
noremap <leader>o :!open %<CR><CR>

" Youcompleteme

" delimitMate
let delimitMate_expand_cr = 1

"VimShell
noremap <leader>sc :split<CR>:VimShellCreate<CR>
autocmd FileType vimshell setl nonumber
autocmd FileType vimshell setl norelativenumber
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '

"Airline
let g:airline_left_sep=''
let g:airline_right_sep=''
" let g:airline_detect_whitespace=0

"NERD Tree stuffs
map <Leader>nt :NERDTree<CR>
map <Leader>nf :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 25
let NERDTreeChDirMode = 2
let NERDTreeIgnore = ['\.swp$','\~$','\.DS_Store$']

"TagBar
map <leader>tb :TagbarToggle<cr>
let g:tagbar_width = 30

"AutoComplete
set ofu=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType sass setlocal omnifunc=csscomplete#CompleteCSS

"CtrlP
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files --exclude-standard']
let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\v\.(exe|so|dll|jpg|png|gif|ai|db)$'
\ }

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
" let g:user_emmet_expandabbr_key = '<tab>'

"CoffeeScript
autocmd FileType coffee nnoremap <buffer> <leader>cc :CoffeeCompile bel<cr>
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
autocmd User Fugitive noremap <buffer> <leader>gd :Gdiff 
autocmd User Fugitive noremap <buffer> <leader>gl :Glog<cr>
autocmd User Fugitive noremap <buffer> <leader>gal :Glog --<cr>
autocmd User Fugitive noremap <buffer> <leader>gpl :Git pull 
autocmd User Fugitive noremap <buffer> <leader>gph :Git push 

autocmd VimEnter .git/PULLREQ_EDIT_MSG setl wrap textwidth=0

" Tabular
nmap <Leader>a= :Tabularize /^[^=]*\zs=>\?<CR>
vmap <Leader>a= :Tabularize /^[^=]*\zs=>\?<CR>
nmap <Leader>a: :Tabularize /:\zs/l0r1<CR>
vmap <Leader>a: :Tabularize /:\zs/l0r1<CR>
nmap <Leader>a, :Tabularize /,\zs/l1r0<CR>
vmap <Leader>a, :Tabularize /,\zs/l1r0<CR>

" Gundo Vim
noremap <leader>gd :GundoToggle<CR>

" JSHint
noremap <leader>jh :JSHint<CR>

"Save session
let g:my_vim_session = "~/.vim/session.vim"

fu! SaveSession()
  execute 'tabdo silent NERDTreeClose'
  execute 'mksession! '. g:my_vim_session
endfunction

fu! RestoreSession()
  execute 'so ' . g:my_vim_session
  if bufexists(1)
    for l in range(1, bufnr('$'))
      if bufwinnr(l) == -1
        exec 'sbuffer ' . l
      endif
    endfor
  endif
endfunction

if has('gui_running')
  " autocmd VimLeave * call SaveSession()
  " autocmd VimEnter * nested call RestoreSession()
endif

noremap <leader>rs :call RestoreSession()<CR>
noremap <leader>ss :call SaveSession()<CR>

set sessionoptions-=options  " Don't save options
set sessionoptions-=help " Don't save help

