call plug#begin('~/.config/nvim/bundle')
Plug 'itchyny/lightline.vim'
Plug 'chun-yang/auto-pairs'
Plug 'w0rp/ale'
Plug 'morhetz/gruvbox'
Plug 'icymind/neosolarized'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" Plug 'sheerun/vim-polyglot'
" Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'unblevable/quick-scope'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

let mapleader = "\<Space>"

" Split
" nnoremap <Leader>\ :vsplit<CR>
" nnoremap <Leader>- :split<CR>
" Natural split to bot and right
set splitbelow
set splitright

" Save buffer
noremap <C-s> <Esc><Esc>:w!<Cr>
inoremap <C-s> <Esc><Esc>:w!<Cr>

" Exit
nnoremap qq <ESC>:q<cr>
nnoremap qw <ESC>:wq<cr>
nnoremap q1 <ESC>:q!<cr>

" ESC 
inoremap jj <ESC>
inoremap jk <ESC>


"Useful mappings for managing tabs:

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/
" Enable mouse
set mouse=a

" Relative number
set number
set relativenumber
set numberwidth=5

" 10 lines / 1 scroll Strl D / Ctrl U
autocmd BufEnter * :set scroll=10

" Switch between windows
noremap <silent> <c-k> :wincmd k<CR>
noremap <silent> <c-j> :wincmd j<CR>
noremap <silent> <c-h> :wincmd h<CR>
noremap <silent> <c-l> :wincmd l<CR>

" Off status insert for lightline
set noshowmode
" On tabline
set showtabline=2


" Switch tab
nnoremap H gT
nnoremap L gt

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set shiftwidth=4                " One tab == four spaces.
set tabstop=4                   " One tab == four spaces.
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab "YAML 1tab=2spaces
autocmd FileType py set expandtab autoindent tabstop=4 softtabstop=4 shiftwidth=4 foldmethod=indent
au BufNewFile,BufRead *.py
    \ set expandtab       |" replace tabs with spaces
    \ set autoindent      |" copy indent when starting a new line
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
" au BufNewFile,BufRead *.py
"     \ set foldmethod=indent
"     \ set foldlevel=0


set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list

set background=dark
set termguicolors
colorscheme gruvbox
" colorscheme NeoSolarized
highlight Normal ctermbg=NONE
set colorcolumn=80
" highlight ColorColumn ctermbg=0 guibg=darkgray

set nobackup
set nowritebackup
set noswapfile

" Auto update file if this change by other process
set autoread
set autowrite


" Use clipboard
set clipboard+=unnamedplus

set pyx=3

"Easy motion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-overwin-f2)
"FZF
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
noremap <leader>o :Files!<Cr>
nnoremap <leader>rg :Rg! 
nnoremap <leader>b :Buffers<Cr>
nnoremap <leader>hf :History<Cr>
nnoremap <leader>hc :History:<Cr>
nnoremap <leader>gbc :BCommits!<Cr>
nnoremap <leader>gc :Commits!<Cr>
nnoremap <leader>c :Commands<Cr>
nnoremap <leader>w :Window<Cr>
inoremap <C-f> <Esc><Esc>:BLines!<Cr>
noremap <C-f> <Esc><Esc>:BLines!<Cr>

"Vim Tmux Navigator
let g:tmux_navigator_disable_when_zoomed = 1

"Lightline
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo', 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status'
      \ },
      \ }

let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be" }
let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf529"
let g:lightline#ale#indicator_errors = "\uf00d"
let g:lightline#ale#indicator_ok = "\uf00c"

let g:python_highlight_all = 1

" COC
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"To make <cr> select the first completion item and confirm the completion when no item has been selected:
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

"To make coc.nvim format your code on <cr>, use keymap:
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"Close the preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Navigate snippet placeholders using tab
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

" Use enter to accept snippet expansion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

" coc-explore
nmap <leader>e :CocCommand explorer<CR>



" ALE
let g:ale_linters = {
      \ 'python': ['flake8', 'pylint'],
      \ 'javascript': ['eslint'],
      \}
let g:ale_fixers = {
      \    'python': ['yapf'],
      \}

nmap <F10> :ALEFix<CR>
let g:ale_fix_on_save = 1

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']


let g:fugitive_gitlab_domains = ['https://gitlab.id.vin']

" Vim-go
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
" let g:go_highlight_array_whitespace_error = 0
" let g:go_highlight_chan_whitespace_error = 0
let g:go_highlight_extra_types = 1
" let g:go_highlight_space_tab_error = 1
" let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
" let g:go_highlight_generate_tags = 0
" let g:go_highlight_string_spellcheck = 1
" let g:go_highlight_format_strings = 1
" let g:go_highlight_variable_declarations = 1
" let g:go_highlight_variable_assignments = 1
" let g:go_highlight_diagnostic_errors = 1
" let g:go_highlight_diagnostic_warnings = 1
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap gvd <Plug>(go-def-vertical)
au FileType go nmap gy <Plug>(go-def-type)
au FileType go nmap gvy <Plug>(go-def-type-vertical)
au FileType go nmap gr <Plug>(go-referrers) 
au FileType go nmap gi <Plug>(go-implements) 
