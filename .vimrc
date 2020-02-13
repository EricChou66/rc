"                                   __________________________
"                                   |    Vim-Plug Settings   |
"                                   ￣￣￣￣￣￣￣￣￣￣￣￣￣
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-signify'
"Plug 'airblade/vim-gitgutter'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
"Plug 'ervandew/supertab'
Plug 'Valloric/MatchTagAlways', { 'for': 'html' }
Plug 'tpope/vim-surround', { 'for': 'html' } 
Plug 'jnurmine/Zenburn'
Plug 'tpope/vim-fugitive'
"Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs', { 'branch': 'legacy' }
Plug 'zxqfl/tabnine-vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'dense-analysis/ale'
Plug 'maximbaz/lightline-ale'
"Plug 'sheerun/vim-polyglot'
Plug 'alvan/vim-closetag', { 'for': 'html' }

  " Compile YouCompleteMe
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !python3 ./install.py
  endif
endfunction
"Plug 'ycm-core/YouCompleteMe', { 'for':  ['python','javascript'], 'do': function('BuildYCM') }
call plug#end()
"  _________________________________________________________________________________________________
"                                   __________________________
"                                   |    Plugin Settings     |
"                                   ￣￣￣￣￣￣￣￣￣￣￣￣￣
" --------------------------------------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1
"                                   __________________________
"                                   |   Zenburn Color Scehem |
"                                   ￣￣￣￣￣￣￣￣￣￣￣￣￣
set t_Co=256
"let g:zenburn_high_Contrast=1
"let g:zenburn_force_dark_Background=1
colors zenburn
" --------------------------------------------------------------------------------------------------
"                                   __________________________
"                                   |    MatchTagAlways      |
"                                   ￣￣￣￣￣￣￣￣￣￣￣￣￣
let g:mta_set_default_matchtag_color = 0
let g:mta_use_matchparen_group = 0
highlight MatchTag ctermfg=white ctermbg=lightblue guifg=white guibg=lightblue
" --------------------------------------------------------------------------------------------------
"                                   __________________________
"                                   |       LightLine        |
"                                   ￣￣￣￣￣￣￣￣￣￣￣￣￣

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
set noshowmode
set laststatus=2
" --------------------------------------------------------------------------------------------------
"                                   __________________________
"                                   |      lightline-ale     |
"                                   ￣￣￣￣￣￣￣￣￣￣￣￣￣
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }
let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]] }
"let g:lightline#ale#indicator_checking
"let g:lightline#ale#indicator_infos
"let g:lightline#ale#indicator_warnings
"let g:lightline#ale#indicator_errors
"let g:lightline#ale#indicator_ok

" --------------------------------------------------------------------------------------------------
"                                   __________________________
"                                   |       NerdTree         |
"                                   ￣￣￣￣￣￣￣￣￣￣￣￣￣
"Mouse support
set mouse=a
let NerdTreeMouseMode=3
map <F2> :NERDTreeToggle<CR>
map <C-o> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
let NERDTreeShowBookmarks=1
"Open new file in tabs
"let NERDTreeMapOpenInTab='<Enter>'
"Ignore file typee
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"Startup with NERDTree when open a folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"Close vim when there is only exist NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Custom arrow
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"Nerdtree-git
let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ 'Ignored'   : '☒',
        \ "Unknown"   : "?"
    \ }
"Nerdtree-devicons
set guifont=DroidSansMono_Nerd_Font:h11

"NerdtreeTabs
let g:nerdtree_tabs_open_on_console_startup=1
" --------------------------------------------------------------------------------------------------
"                                   __________________________
"                                   |     YouCompleteMe      |
"                                   ￣￣￣￣￣￣￣￣￣￣￣￣￣
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"confirm extra_config before executing
"let g:ycm_confirm_extra_conf=0
set completeopt=longest,menu
"python path
"let g:ycm_path_to_python_interpreter= '~/.pyenv/shims/python3' 
"Turn on Auto Complete
let g:ycm_seed_identifiers_with_syntax=1
"Turn off diagnostic display features
"let g:ycm_show_diagnostics_ui=0
"Turn on Auto Complete in Comment
let g:ycm_complete_in_comments=1
"Auto Complete in String
let g:ycm_complete_in_strings=1
"Auto collecting identifiers from strings and comments
let g:ycm_collect_identifiers_from_comments_and_strings=0
"The Characters of Auto Complete start
let g:ycm_min_num_of_chars_for_completion=2
"Automatically close the Auto Complete window
let g:ycm_key_list_select_completion = ['<TAB>']
"Auto-close the preview window after the user leaves insert mode.
let g:ycm_autoclose_preview_window_after_completion=1
"Don't Cache
let g:ycm_cache_omnifunc=0
"Close Auto Complete window when leave insert mode"
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
let g:ycm_autoclose_preview_window_after_insertion=1
"Press Enter to select current option"
let g:ycm_key_list_stop_completion = ['<Enter>']
"autocmd CompleteDone * pclose
"inoremap <expr> <CR> pumvisible() ? '<C-y>' : '<CR>'
"virtualenv support
"let g:virtualenv_directory = '~/.virtualenvs'
" --------------------------------------------------------------------------------------------------
"                                   __________________________
"                                   |       Hexokinase       |
"                                   ￣￣￣￣￣￣￣￣￣￣￣￣￣
let g:Hexokinase_highlighters = [ 'backgroundfull' ]
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla,colour_names'
let g:Hexokinase_ftEnabled = ['css', 'html', 'javascript']
" --------------------------------------------------------------------------------------------------
"                                   __________________________
"                                   |       ALE Settings     |
"                                   ￣￣￣￣￣￣￣￣￣￣￣￣￣
let b:ale_linters = {
\   'javascript': ['eslint'],
\}
let b:ale_fixers = {
\   'javascript': ['eslint'],
\}

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '✹'
" --------------------------------------------------------------------------------------------------
"                                   __________________________
"                                   |       vim-closetag     |
"                                   ￣￣￣￣￣￣￣￣￣￣￣￣￣
" These are the file extensions where this plugin is enabled.
"let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" This will make the list of non-closing tags self-closing in the specified files.
"let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" These are the file types where this plugin is enabled.
"let g:closetag_filetypes = 'html,xhtml,phtml'

" This will make the list of non-closing tags self-closing in the specified files.
"let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"let g:closetag_emptyTags_caseSensitive = 1

" Disables auto-close if not in a "valid" region (based on filetype)
"let g:closetag_regions = {
"    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
"    \ 'javascript.jsx': 'jsxRegion',
"    \ }

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

"  _________________________________________________________________________________________________
"                                   __________________________
"                                   |     Other Settings     |
"                                   ￣￣￣￣￣￣￣￣￣￣￣￣￣
" Use F9 to compile python3 file in vim
nnoremap <buffer> <F9> :exec '! clear; python3' shellescape(@%, 1)<cr>

nmap tp :tabprevious<CR>
nmap tn :tabnext<CR>
nmap tt :tabe<SPACE>
nmap ts :tab split<CR>
nmap vs :vs<space>
set number
set noruler
set ignorecase
set smartcase
set smarttab
set cindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=indent,eol,start
set history=500
set autowrite
"set mouse=a
set incsearch
set hlsearch
set lazyredraw
set noerrorbells
set novisualbell
set clipboard=unnamed
set cursorline
set cursorcolumn
set termguicolors
xnoremap p pgvy
