" ----- vim-plug ------------------------------------------------------
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin()
" ----- Colorschemes --------------------------------------------------
Plug 'altercation/vim-colors-solarized'
" solarized without the nonsense
Plug 'romainl/flattened'
Plug 'robertmeta/nofrils'
Plug 'EdenEast/nightfox.nvim'

" ----- Making Vim look good ------------------------------------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Highlight words based on their hashing
" Plug 'blahgeek/neovim-colorcoder'
" Vim plugin for automatically highlighting other uses of the current word under the cursor
Plug 'RRethy/vim-illuminate'
" Preview colours in source code while editing
Plug 'ap/vim-css-color'

" ----- Vim as a programmer's text editor -----------------------------
Plug 'tpope/vim-commentary'
" Asynchronous Lint Engine
" Plug 'w0rp/ale'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
" Alternate Files quickly (.c --> .h etc)
" Plug 'vim-scripts/a.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
" default snippets
Plug 'honza/vim-snippets'
Plug 'udalov/kotlin-vim'
" Debugging
" Plug 'puremourning/vimspector'

" ----- Working with Git ----------------------------------------------
" A Vim plugin which shows a git diff in the sign column
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" ----- Other text editing features -----------------------------------
Plug 'junegunn/goyo.vim'

" ----- Custom/Additional Vim functionality features ------------------
Plug 'qpkorr/vim-bufkill'

" ---- Extras/Advanced plugins ----------------------------------------
" Highlight and strip trailing whitespace
Plug 'ntpeters/vim-better-whitespace'
" enable repeating supported plugin maps with "."
Plug 'tpope/vim-repeat'
" Easily surround chunks of text
Plug 'tpope/vim-surround'
"use CTRL-A/CTRL-X to increment dates, times, and more
Plug 'tpope/vim-speeddating'
" Alignment and text filtering
Plug 'godlygeek/tabular'
Plug 'mattn/emmet-vim'
call plug#end()


" --- General settings ------------------------------------------------
set title
set number relativenumber
"set tabstop=8 softtabstop=4 shiftwidth=4 expandtab
set tabstop=4 softtabstop=-1 shiftwidth=4 noexpandtab
set clipboard=unnamedplus
set noshowmode
set ignorecase smartcase
set splitright splitbelow
set mouse=a                    " all mouse modes
set path+=**
set list lcs=tab:\|\

syntax enable                  " syntax highlighting

" We need this for plugins like Syntastic and vim-gitgutter which put symbols
" in the sign column.
hi clear SignColumn

nmap  :w<CR>
command Rc tabe $HOME/.config/nvim/init.vim
nmap <leader>d :bd<CR>

command Copyrightmessage normal cc/* Copyright (c) 2022 Abdullah Güntepe, <abdullah@guentepe.com>


" --- Development Specific settings -----------------------------------
set makeprg=make\ -j\ 8
nmap <leader>m :make<CR>

" Map CMake build and execute commands
command Cmake !(mkdir -p build && cd build && cmake -DCMAKE_BUILD_TYPE=Debug ..)
nmap <leader>r !(cd build && make -j 8) && make test


" ----- Plugin-Specific Settings --------------------------------------

" Set the colorscheme
set background=dark
 let g:solarized_termtrans = 0
" colorscheme flattened_dark
colorscheme terafox
" call togglebg#map("<leader>b")


" ----- vim-airline/vim-airline settings -----

" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
"     https://github.com/abertsch/Menlo-for-Powerline
let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste = 1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Enable airline for ale
" let g:airline#extensions#ale#enabled = 1

" Set a theme for the Airline status bar
" let g:airline_theme = 'solarized_flood'


" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
set updatetime=100
let g:airline#extensions#hunks#non_zero_only = 1


" ----- junegunn/fzf.vim settings -----
nmap <leader>t :Buffers<CR>
nmap <leader>f :Files<CR>


" ----- blahgeek/neovim-colorcoder -----
"let g:colorcoder_enable_filetypes = ['cpp', 'hpp']
set termguicolors

"nmap <leader>c :ColorcoderUpdate!<CR>


" ----- SirVer/UltiSnips -----
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetsDir="~/.config/nvim/snip"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snip"]


" ----- mattn/emmet-vim -----
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall


" ----- qpkorr/vim-bufkill -----
nmap <leader>D :BD<CR>


" ----- junegunn/goyo.vim -----
nmap <leader>g :Goyo<CR>

" ----- puremourning/vimspector -----
let g:vimspector_enable_mappings = 'HUMAN'
