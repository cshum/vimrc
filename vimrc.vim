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
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'airblade/vim-rooter' 
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'bling/vim-airline'
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
Plugin 'elzr/vim-json'
Plugin 'tangledhelix/vim-octopress'
Plugin 'tomtom/tlib_vim'
Plugin 'briancollins/vim-jst'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mtscout6/vim-cjsx'
Plugin 'mmikitka/vim-drupal'
Plugin 'walm/jshint.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tomtom/tcomment_vim'
Plugin 'Raimondi/delimitMate'
Plugin 'heavenshell/vim-jsdoc'

if has("unix") && has('gui_running')
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'marijnh/tern_for_vim'
endif

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
try
  colorscheme vividchalk
catch
  colorscheme torte
endtry

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
au BufNewFile,BufRead *.tex,*.md,*.markdown setlocal linebreak "soft wrap
au VimResized * :wincmd = "Resize splits when the window is resized

set wildignore=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,coverage/*,public/*,tmp/*,log/*,doc/*

" Make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase
set pumheight=15
set completeopt-=preview "disable completion scratch preview

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
	set guifont=Monaco:h13
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
noremap <leader>o :!open %<CR><CR>

" delimitMate
" let delimitMate_expand_cr = 1

"Airline
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_b=''
" let g:airline_detect_whitespace=0

"NERD Tree
map <Leader>nt :NERDTree<CR>
map <Leader>nf :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 25
let NERDTreeChDirMode = 2
let NERDTreeIgnore = ['\.git','\.swp$','\~$','\.DS_Store$']

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

" Tab
nnoremap <leader>nt :tabnew<cr>
nnoremap <leader>ct :tabclose<cr>
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>tc :tabclose<cr>

" JsDoc
nnoremap <leader>jd :JsDoc<cr>
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_return_description=0
let g:jsdoc_param_description_separator=' - '

"Fugitive
autocmd User Fugitive noremap <buffer> <leader>gs :Gstatus<cr>
autocmd User Fugitive noremap <buffer> <leader>gg :silent! Ggrep ''<left>
autocmd User Fugitive noremap <buffer> <leader>gw :Gwrite<cr>
autocmd User Fugitive noremap <buffer> <leader>gc :Gcommit<cr>i
autocmd User Fugitive noremap <buffer> <leader>gd :Gdiff HEAD<cr>
autocmd User Fugitive noremap <buffer> <leader>gl :silent Glog<cr>
autocmd User Fugitive noremap <buffer> <leader>gpl :Git pull 
autocmd User Fugitive noremap <buffer> <leader>gph :Git push 

autocmd QuickFixCmdPost *grep* cwindow " opens quickfix after :Ggrep 


autocmd VimEnter .git/PULLREQ_EDIT_MSG setl wrap textwidth=0

" Tabular
nmap <Leader>a= :Tabularize /^[^=]*\zs=>\?<CR>
vmap <Leader>a= :Tabularize /^[^=]*\zs=>\?<CR>
nmap <Leader>a: :Tabularize /:\zs/l0r1<CR>
vmap <Leader>a: :Tabularize /:\zs/l0r1<CR>
nmap <Leader>a, :Tabularize /,\zs/l1r0<CR>
vmap <Leader>a, :Tabularize /,\zs/l1r0<CR>

" Vim Markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1
noremap <leader>toc :Toc<CR>

" Gundo Vim
noremap <leader>gd :GundoToggle<CR>

" Syntastic
let g:syntastic_javascript_checkers = ['standard']
autocmd VimEnter * silent SyntasticToggleMode " disable auto check
noremap <leader>sc :SyntasticCheck<CR>

" JSHint
noremap <leader>jh :JSHint<CR>

" Quit Prompt
nnoremap ZZ :call QuitPrompt()<cr>

fun! QuitPrompt()
  if has("gui_running") && tabpagenr("$") == 1 && winnr("$") == 1
     let choice = confirm("Close?", "&yes\n&no", 1)
     if choice == 1 | wq | endif
  else | wq | endif
endfun

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

" if has('gui_running')
  " autocmd VimLeave * call SaveSession()
  " autocmd VimEnter * nested call RestoreSession()
" endif

noremap <leader>rs :call RestoreSession()<CR>
noremap <leader>ss :call SaveSession()<CR>

"Don't save options
set sessionoptions-=options
"Don't save help
set sessionoptions-=help

