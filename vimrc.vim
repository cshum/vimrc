set nocompatible
set laststatus=2   "Always show statusline
set encoding=utf-8 

" { Find Project Directory
function ProjectDir()
	if expand("%:p:h") =~ '[\\/]Workspace[\\/]'
		let workdir = matchstr(expand("%:p"),".*[\\/]Workspace[\\/][a-zA-Z_0-9\.\ ]*[\\/]")
		silent! cd `=workdir` "goto dir under Workspace (*nix)
	else
		silent! cd %:p:h "goto current dir
	endif
endfunction
au BufEnter * :call ProjectDir() 
" }

" { Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle' 
Bundle 'tpope/vim-vividchalk'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'henrik/vim-indexed-search'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'edsono/vim-matchit'
Bundle 'docunext/closetag.vim'
Bundle 'scrooloose/syntastic'
Bundle 'python.vim'
Bundle 'pythoncomplete'
Bundle 'mattn/zencoding-vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'groenewege/vim-less'
Bundle 'pangloss/vim-javascript'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'tpope/vim-markdown'

if has('gui_macvim')
	Bundle 'suan/vim-instant-markdown' 
endif
if has("gui_win32") || has("gui_win64")
	Bundle 'xolox/vim-shell'
endif
if has('gui_running')
	Bundle 'skammer/vim-css-color'
endif

Bundle 'godlygeek/csapprox'
" }

syntax on
filetype plugin indent on

set number " show line numbers
set ai
set smartindent
set tabstop=4
set shiftwidth=4
set autoread " auto reload files
set incsearch " highlight when typing search
set hlsearch " highlight search
set nohidden "clear buffer when close
au BufNewFile,BufRead *.tex,*.md,*.markdown setlocal spell "spellcheck
colorscheme vividchalk

set grepprg=grep\ -nH\ $*

" { gVim stuff
if has('gui_running')
	set guioptions-=T  "remove toolbar
	set guioptions-=m  "remove menubar
	set guioptions+=LlRrb 
	set guioptions-=LlRrb "remove scrollbars
endif
if has('gui_macvim')
	set guifont=Monaco:h13
endif
if has("gui_win32") || has("gui_win64")
	set guifont=Consolas:h11
	au GUIEnter * simalt ~x "maximize window
endif
if has('gui_gtk2')
endif
" }

" { autocomplete
set ofu=syntaxcomplete#Complete
au FileType python set omnifunc=pythoncomplete#Complete
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType xml set omnifunc=xmlcomplete#CompleteTags
au FileType php set omnifunc=phpcomplete#CompletePHP
au FileType c set omnifunc=ccomplete#Complete
" }

" { NERD Tree stuffs
command -range NT NERDTreeToggle
let g:NERDTreeWinSize = 20
" }
" { TagBar stuff
command -range TB TagbarToggle
" }
" { Fuzzy Finder stuffs
nmap ,c :FufCoverageFile<CR>
nmap ,f :FufFileWithCurrentBufferDir<CR>
nmap ,b :FufBuffer<CR>
nmap ,r :FufRenewCache<CR>
let g:fuf_file_exclude= '\v\.DS_Store|\.directory|\.git\/|\.swp|\.svn|\.jpg|\.png'
let g:fuf_coveragefile_exclude= '\v\.DS_Store|\.directory|\.git\/|\.swp|\.svn|\.jpg|\.png'
let g:fuf_enumeratingLimit = 20
" }

" { HTML indentation
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
" }
" { syntastic
let g:syntastic_check_on_open=1
" }
" { Zencoding
let g:user_zen_expandabbr_key='<C-z>'
" }
