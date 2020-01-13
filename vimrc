" ========================================================================
" minpac stuff
" ========================================================================

" Initialize minpac
packadd minpac
call minpac#init()

" let minpac manage Minpac
call minpac#add('k-takata/minpac', {'type': 'opt'})

" General
call minpac#add('AndrewRadev/splitjoin.vim')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('airblade/vim-rooter')
call minpac#add('bogado/file-line')
call minpac#add('ctrlpvim/ctrlp.vim')
call minpac#add('danro/rename.vim')
call minpac#add('itchyny/lightline.vim')
call minpac#add('janko-m/vim-test')
call minpac#add('kana/vim-textobj-user')
call minpac#add('machakann/vim-highlightedyank')
call minpac#add('mileszs/ack.vim')
call minpac#add('tomtom/tcomment_vim')
call minpac#add('tpope/vim-dispatch')
call minpac#add('tpope/vim-endwise')
call minpac#add('tpope/vim-eunuch')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-sleuth')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-vinegar')

" Ruby
call minpac#add('nelstrom/vim-textobj-rubyblock')
call minpac#add('tpope/vim-bundler')
call minpac#add('tpope/vim-rails')
call minpac#add('vim-ruby/vim-ruby')

" JS
call minpac#add('burnettk/vim-angular')
call minpac#add('elzr/vim-json')
call minpac#add('leafgarland/typescript-vim')
call minpac#add('mustache/vim-mustache-handlebars')
call minpac#add('othree/javascript-libraries-syntax.vim')
call minpac#add('pangloss/vim-javascript')

" Elixir
call minpac#add('elixir-lang/vim-elixir')

" Colors
call minpac#add('lifepillar/vim-solarized8')

command! PackUpdate packadd minpac | source $MYVIMRC | redraw | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

" ========================================================================
" Colors
" ========================================================================

let g:solarized_termtrans=1

set termguicolors
set background=dark
colorscheme solarized8

syntax on

highlight rubyDefine cterm=bold

" ========================================================================
" Statusline
" ========================================================================

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ' '.fugitive#head()
  else
    return ''
endfunction

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \ 'left': [ [ 'mode', 'paste' ],
      \           [ 'gitbranch' ],
      \           [ 'readonly', 'filename', 'modified' ] ],
      \ 'right': [ [ 'lineinfo' ],
      \            [ 'percent' ],
      \            [ 'filetype' ] ]
      \ },
      \ 'component': {
      \   'lineinfo': '%l:%L  %c'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'GitInfo'
      \ },
      \ }

" ========================================================================
" Mapping
" ========================================================================

let mapleader = " "

nnoremap <leader><leader> <c-^> " Switch between the last two files
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <leader>. :CtrlPTag<cr>
map <Leader>ac :vs app/controllers/application_controller.rb<cr>
map <Leader>c :noh<cr>
map <Leader>fa :vs spec/factories.rb<CR>i
map <Leader>i mmgg=G`m
map <Leader>m :Rmodel
map <Leader>r :RunRuby<CR>
map <Leader>ra :%s/
map <Leader>sc :sp db/schema.rb<cr>
map <Leader>vc :Vcontroller<cr>
map <Leader>vf :Vfunctional<cr>
map <Leader>vm :Vmodel<cr>
map <Leader>vu :Vunittest<CR>
map <Leader>vv :Vview<cr>
map <Leader>B :call ChangeBackgroundColor()<CR>

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>g :TestVisit<CR>

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

" ========================================================================
" Settings
" ========================================================================

set backspace=indent,eol,start    " intuitive backspacing
set history=500                   " keep 500 lines of command line history
set ruler                         " show the cursor position all the time
set showcmd                       " display incomplete commands
set autoindent                    " always set autoindenting on
set tabstop=2                     " number of visual spaces per TAB
set softtabstop=2                 " number of spaces in tab when editing
set shiftwidth=2                  " number of spaces to use for autoindent
set expandtab                     " tabs are space
set showmatch
set nowrap
set backupdir=~/.tmp
set directory=~/.tmp              " don't clutter my dirs up with swp and tmp files
set autoread
set hidden
set wmh=0
set viminfo+=!
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8
set noincsearch
set ignorecase                    " case-insensitive searching
set smartcase                     " but case-sensitive if expression contains a capital letter
set laststatus=2                  " always display the status line
set gdefault                      " assume the /g flag on :s substitutions to replace all matches in a line
set lazyredraw                    " Don't redraw screen when running macros.
set relativenumber
set number
set numberwidth=4
set scrolloff=3                   " Show 3 lines of context around the cursor
set nofoldenable                  " Say no to code folding...
set wildmenu                      " enhanced command line completion
set noswapfile
set list listchars=tab:»·,trail:· " Display extra whitespace
set wildignore+=tmp/**            " Ignore stuff that can't be opened
set splitbelow                    " Open horizontal split below
set splitright                    " Open vertical split to the right
set shortmess=at
set cmdheight=2
set nojoinspaces
set complete-=t
set diffopt=filler,vertical
set undodir=~/.vim/undodir
set undofile
set tags=./tags

if has('mouse')
  set mouse=a
endif

if has('nvim')
  set inccommand=nosplit
endif

" ========================================================================
" Ruby stuff
" ========================================================================
augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml,sh,zsh setlocal ai shiftwidth=2 tabstop=2 et
  autocmd FileType ruby,eruby,yaml,sh,zsh setlocal path+=lib
  autocmd FileType ruby,eruby,yaml,sh,zsh setlocal colorcolumn=80
  " Make ?s part of words
  autocmd FileType ruby,eruby,yaml,sh,zsh setlocal iskeyword+=?
  " Appraisal files are ruby too
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby

augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on

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
  \ c,coffee,cpp,css,html,java,javascript,pascal,php,python,ruby,sass,scss,sh,zsh
  \ autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Use Ripgrep https://github.com/BurntSushi/ripgrep/
if executable('rg')
  " Use Rg over Grep
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m

  " Use rg in CtrlP for listing files
  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never'

  " Use CtrlP's Most Recently Used (MRU) search
  let g:ctrlp_cmd = 'CtrlPMixed'

  " rg is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " Use rg in Ack
  let g:ackprg = 'rg -S --vimgrep --no-messages'
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
command! RunRuby execute "Dispatch ruby %"

" vim-test mappings
if has('nvim')
  let test#strategy = 'neovim'
else
  let test#strategy = 'dispatch'
endif

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1

let g:ragtag_global_maps = 1

let g:mustache_abbreviations = 1

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

function! ChangeBackgroundColor()
  if &background ==# "dark"
    let g:solarized_termtrans = 0
    set background=light
    colorscheme solarized8
  else
    let g:solarized_termtrans = 1
    set background=dark
    colorscheme solarized8
  endif
  runtime autoload/lightline/colorscheme/solarized.vim
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction
