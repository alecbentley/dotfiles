

" ALEC'S VIM CONFIG FILE
" MIT license

"---------------------------------------
"--------------------------------------- 
       "BASIC CONFIGS 
"--------------------------------------- 
"---------------------------------------


set relativenumber
set number
set numberwidth=4
set expandtab 
set shiftwidth=4
set tabstop=4
set hidden
set signcolumn=yes
set path+=**
set termguicolors
set t_Co=256
set clipboard=unnamedplus
set undofile
set nospell
set title
set ignorecase
set smartcase
set nowrap
set mouse=a
set scrolloff=10
set sidescrolloff=10
set nojoinspaces
set splitright
set exrc
set updatetime=300
set redrawtime=10000
set laststatus=2
syntax enable
syntax on
"uncomment below to force italic comments, along with last line in doc
"set t_ZH=[3m
"set t_ZR=[23m

"Block cursor on normal mode, thin bar on insert mode SI=insert EI=normal
let &t_SI = "\e[5 q"
let &t_EI = "\e[0 q"

"backup - every time you :w or :wq it will save a copy in .vim
"create a dir in .vim called 'backups' with an s
"set swapfile
"set backup
"set backupdir=~/.vim/backups//
"set writebackup
"set backupcopy=yes
"set backupext=.txt
"au BufWritePre * let &bex = '@' . strftime("%d-%H:%M:%S")



"---------------------------------------
"--------------------------------------- 
       "KEY REMAPS 
"---------------------------------------
""--------------------------------------



"map leader key to <space>
nnoremap <space> <nop>
let mapleader = " "

"add a line above without leaving normal mode (Space + Enter)
"noremap <silent> <s-space> :exe "normal a" .nr2char(getchar())<CR>

"add a line below without leaving normal mode (Enter)
"nnoremap <Enter> i<Enter><Esc>k$

"remap tab switching keys (Ctrl + left or right)
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

"remap the :noh command to quickly clear post-search highlighting.
"Every time you press esc it clears search highlighting.
noremap <esc> :noh<cr>

"reselect visual selection after indenting.
vnoremap < <gv
vnoremap > >gv

"Maintain the cursor position when yanking a visual selection.
vnoremap y myy'y
vnoremap Y myY'y

"when text is wrapped, move by terminal rows, not lines, 
"unless a count is provided
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

"keep it centered
nnoremap N Nzzzv
nnoremap J mxJ'z



"------------------------------------------
"------------------------------------------
        "PLUGINS   use Vim-Plug
        "Go to vimawesome.com for a plugin directory
"------------------------------------------
"------------------------------------------

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"COLLECTION OF PLUGINS
call plug#begin()


"FZF fuzzifinder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"NERDtree
Plug 'preservim/nerdtree'

"Quick scope lateral movement assistant
Plug 'unblevable/quick-scope'

"CoC LSP
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Polyglot - syntax highlighter
Plug 'sheerun/vim-polyglot'

"Smooth scroll
Plug 'psliwka/vim-smoothie'

"Lightline status bar plugin
Plug 'itchyny/lightline.vim'

"Tmux navigator
Plug 'christoomey/vim-tmux-navigator'

"Vim-Startify (create cool splash screen)
Plug 'mhinz/vim-startify'

"Nerdtree Git Plugin and nerdtree syntax highlight
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"Devicons for nerdtree
Plug 'ryanoasis/vim-devicons'

"comment out multiple lines at once (I remapped it to ++)
Plug 'scrooloose/nerdcommenter'

"Changes to document are visible in gutter
Plug 'airblade/vim-gitgutter'

"Indentation Guidelines
Plug 'Yggdroot/indentLine'

"Visual Multi insert to multiple lines at once
Plug 'mg979/vim-visual-multi', {'branch': 'master'}


"-----------------THEMES IN DESC. ORDER - SORT BY FAVORITES FIRST


"Cyberspace theme
Plug 'hiroakis/cyberspace.vim'

"Night Owl theme
"Plug 'haishanh/night-owl.vim'

"Tomasiser theme
"Plug 'tomasiser/vim-code-dark'

"Janah theme
"Plug 'mhinz/vim-janah'

"Hardhackerlabs theme
"Plug 'hardhackerlabs/theme-vim', { 'as': 'hardhacker' }

call plug#end()



"-------------------------------------------
"-------------------------------------------
       "APPENDIX - addendums to Themes
"-------------------------------------------
"-------------------------------------------


set nocompatible
set noshowmode
set background=dark


"colorscheme night-owl

colorscheme cyberspace

"colorscheme codedark

"autocmd ColorScheme janah highlight Normal ctermbg=235
"colorscheme janah

"colorscheme hardhacker



"------------------------------------------
"------------------------------------------
        "PLUGIN CONFIGS
"------------------------------------------
"------------------------------------------



" Color setup for quick-scope
highlight QuickScopePrimary guifg='#ff0000' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#f9ff00' gui=underline ctermfg=81 cterm=underline


" NERDtree Key Remaps
nnoremap <leader>t :NERDTreeFocus<CR>
"nnoremap <leader>n :NERDTree<CR>
"nnoremap <leader>f :NERDTreeFind<CR>


"nerdcommenter
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle


"CoC Config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-tailwindcss',
  \ 'coc-html',
  \ 'coc-sql',
  \ 'coc-sh',
  \ 'coc-lua',
  \ 'coc-go',
  \ 'coc-docker',
  \ 'coc-css',
  \ '@yaegassy/coc-nginx',
  \ 'coc-vimlsp',
  \ 'coc-graphql',
  \ 'coc-marketplace',
  \ ]



"highlight Comment cterm=italic
