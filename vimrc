" ========================================================================
" Vundle stuff
" ========================================================================
set nocompatible " Required by vundle
filetype off     " Required by vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" General
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'airblade/vim-rooter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'danro/rename.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'kana/vim-textobj-user'
Plugin 'mattn/emmet-vim'
Plugin 'mileszs/ack.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Ruby
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'

" JS
Plugin 'burnettk/vim-angular'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'

" Colors
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ========================================================================
" Colors
" ========================================================================

let base16colorspace=256
set background=dark
colorscheme base16-default

syntax on

highlight rubyDefine cterm=bold

" ========================================================================
" Mapping
" ========================================================================

let mapleader = " "

nnoremap <leader><leader> <c-^> " Switch between the last two files
map <Leader>ac :vs app/controllers/application_controller.rb<cr>
map <Leader>b :!bundle install<cr>
map <Leader>fa :vs spec/factories.rb<CR>i
map <Leader>i mmgg=G`m
map <Leader>l oconsole.log 'debugging'<esc>:w<cr>
map <Leader>m :Rmodel
map <Leader>r :RunRuby<CR>
map <Leader>ra :%s/
map <Leader>s :w<cr>:call RunNearestSpec()<CR>
map <Leader>sc :sp db/schema.rb<cr>
map <Leader>t :w<cr>:call RunCurrentSpecFile()<CR>
map <Leader>u :Runittest<cr>
map <Leader>vc :Vcontroller<cr>
map <Leader>vf :Vfunctional<cr>
map <Leader>vm :Vmodel<cr>
map <Leader>vu :Vunittest<CR>
map <Leader>vv :Vview<cr>

" Let's be reasonable, shall we?
nmap k gk
nmap j gj

" Get off my Lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Toggle background
call togglebg#map("<F5>")

" ========================================================================
" Settings
" ========================================================================

set backspace=indent,eol,start    " intuitive backspacing
set history=500                   " keep 500 lines of command line history
set ruler                         " show the cursor position all the time
set showcmd                       " display incomplete commands
set autoindent                    " always set autoindenting on
set showmatch
set nowrap
set backupdir=~/.tmp
set directory=~/.tmp              " don't clutter my dirs up with swp and tmp files
set autoread
set hidden
set wmh=0
set viminfo+=!
set guioptions-=T
set guifont=Inconsolata\ for\ Powerline:h15
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set smarttab
set noincsearch
set ignorecase                    " case-insensitive searching
set smartcase                     " but case-sensitive if expression contains a capital letter
set laststatus=2                  " always display the status line
set gdefault                      " assume the /g flag on :s substitutions to replace all matches in a line
set lazyredraw                    " Don't redraw screen when running macros.
set relativenumber
set number
set numberwidth=5
set scrolloff=3                   " Show 3 lines of context around the cursor
set shiftround                    " When at 3 spaces and I hit >>, go to 4, not 5.
set nofoldenable                  " Say no to code folding...
set wildmenu                      " enhanced command line completion
set noswapfile
set mouse=a                       " Scroll vim not the terminal
set list listchars=tab:»·,trail:· " Display extra whitespace
set wildignore+=tmp/**            " Ignore stuff that can't be opened
set splitbelow                    " Open horizontal split below
set splitright                    " Open vertical split to the right
set shortmess=at
set cmdheight=2

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" ========================================================================
" Ruby stuff
" ========================================================================
augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml setlocal path+=lib
  autocmd FileType ruby,eruby,yaml setlocal colorcolumn=80
  " Make ?s part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?
  " Appraisal files are ruby too
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby

augroup END

" Enable built-in matchit plugin
runtime macros/matchit.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" By default, vim thinks .md is Modula-2.
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Enable spellchecking for Markdown
autocmd FileType markdown setlocal spell

" Automatically wrap at 78 characters for Markdown and text files
autocmd FileType text setlocal textwidth=78
autocmd BufRead,BufNewFile *.md setlocal textwidth=78

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction

autocmd FileType
  \ c,coffee,cpp,css,html,java,javascript,pascal,php,python,ruby,sass,scss
  \ autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Font
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:solarized_base16 = 1

" Use Ripgrep https://github.com/BurntSushi/ripgrep/
if executable('rg')
  " Use Rg over Grep
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m

  " Use rg in CtrlP for listing files
  let g:ctrlp_user_command = 'rg %s --files --color=never'

  " Use rg in Ack
  let g:ackprg = 'rg -S --no-heading --vimgrep'

  " rg is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Run current ruby file
command RunRuby execute "Dispatch ruby %"

" vim-rspec mappings
let g:rspec_command = "Dispatch bin/rspec {spec}"

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1

let g:ragtag_global_maps = 1

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Adjusts quickfix window height
au FileType qf call AdjustWindowHeight(3, 20)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction
