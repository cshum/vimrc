set nocompatible
set laststatus=2   "Always show statusline
set encoding=utf-8 
set t_Co=256

"Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


Bundle 'gmarik/vundle' 
Bundle 'tpope/vim-vividchalk'
Bundle 'L9'
Bundle 'airblade/vim-rooter' 
Bundle 'kien/ctrlp.vim'
Bundle 'samsonw/vim-task'
Bundle 'mileszs/ack.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'bling/vim-airline'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'captbaritone/better-indent-support-for-php-with-html'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
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

if has('gui_macvim')
	Bundle 'TaskList.vim'
endif
if has("gui_win32") || has("gui_win64")
	Bundle 'xolox/vim-shell'
endif
if has('gui_running')
	Bundle 'skammer/vim-css-color'
endif

Bundle 'godlygeek/csapprox'

syntax on
filetype plugin indent on

set number " show line numbers
set ai
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
colorscheme vividchalk

set wildignore+=*/tmp/*,*.so,*.swp,*.zip 

set grepprg=grep\ -nH\ $*

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
	command -range NT NERDTree
	command -range NF NERDTreeFind
	let g:NERDTreeWinSize = 25
  let NERDTreeChDirMode = 2
"TagBar stuff
	command -range TB TagbarToggle
	let g:tagbar_width = 30
"TaskList stuff
	command -range TL TaskList
"AutoComplete
	set ofu=syntaxcomplete#Complete
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"Drupal Syntax highlight
if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
  augroup END
endif
syntax on

"Vim Task"
	function TaskConfig()
		setfiletype task
		nmap t :call Toggle_task_status()<CR>
		set nonumber
		set nowrap
	endfunction
	if has('gui_macvim')
		autocmd BufNewFile,BufRead todo.txt,*.task,*.tasks :call TaskConfig()
	endif

"CtrlP
	command -range CC CtrlPClearCache
	let g:ctrlp_custom_ignore = {
	  \ 'dir':  '\v[\/](\.git|node_modules|build|modules|system|vendor|lib|libs)$',
	  \ 'file': '\v\.(exe|so|dll|jpg|png|gif|ai|db)$',
	  \ 'link': 'some_bad_symbolic_links',
	  \ }

"Easy Motion"
	let g:EasyMotion_leader_key = '<Leader>'

"Rooter
  let g:rooter_patterns = ['.git', '.git/', '.svn/','modules/','Rakefile', 'composer.json', 'package.json']
  let g:rooter_use_lcd = 1
