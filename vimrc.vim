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
Bundle 'kien/ctrlp.vim'
Bundle 'samsonw/vim-task'
Bundle 'mileszs/ack.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'edsono/vim-matchit'
Bundle 'docunext/closetag.vim'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'StanAngeloff/php.vim'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'python.vim'
Bundle 'pythoncomplete'
Bundle 'gotcha/vimpdb'
Bundle 'mattn/zencoding-vim'
Bundle 'othree/html5.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'groenewege/vim-less'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-markdown'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"
Bundle "garbas/vim-snipmate"

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
set tabstop=4
set shiftwidth=4
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

"Find Project Directory
	function ProjectDir()
		if expand("%:p:h") =~ '[\\/]Workspace[\\/]'
			let workdir = matchstr(expand("%:p"),".*[\\/]Workspace[\\/][a-zA-Z_0-9\.\ ]*[\\/]")
			silent! cd `=workdir` "goto dir under Workspace (*nix)
		else
			silent! cd %:p:h "goto current dir
		endif
	endfunction
	au BufEnter * :call ProjectDir() 

"NERD Tree stuffs
	command -range NT NERDTreeToggle
	let g:NERDTreeWinSize = 20
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

"Supertab
	let g:SuperTabDefaultCompletionType = "context"

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
	let g:ctrlp_custom_ignore = {
	  \ 'dir':  '\v[\/](\.git|node_modules|build|modules|system|thumbnails)$',
	  \ 'file': '\v\.(exe|so|dll|jpg|png|db)$',
	  \ 'link': 'some_bad_symbolic_links',
	  \ }

"Easy Motion"
	let g:EasyMotion_leader_key = '<Leader>'

