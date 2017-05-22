" curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', { 'build': {
      \   'windows': 'make -f make_mingw32.mak',
      \   'cygwin': 'make -f make_cygwin.mak',
      \   'mac': 'make -f make_mac.mak',
      \   'unix': 'make -f make_unix.mak',
      \ } }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'vim-scripts/The-NERD-tree'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'editorconfig-vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'nvie/vim-flake8'
NeoBundle 'tpope/vim-pathogen'
NeoBundle 'vim-syntastic/syntastic'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'

call neobundle#end()

execute pathogen#infect()

"设置行号，语法高亮，当前行高亮
set number
set background="dark"
let g:solarized_termcolors=256
colorscheme solarized
"进入粘贴模式，不自动缩进
set pastetoggle=<F9>
"设置backspace的行为
set backspace=indent,eol,start
set wildmode=longest,list,full
set wildmenu

"设置高亮
set hls
set cursorline

"设置编码
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5
set fileencoding=utf-8
set termencoding=utf-8

"设置缩进
filetype plugin on
filetype indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
syntax on

set laststatus=2
set t_Co=256

"NERDTree设置
nmap <F11> :NERDTreeToggle<cr>
let g:NERDTreeWinPos='left'

"Tagbar设置
nmap <F10> :TagbarToggle<cr>
let g:tagbar_left=1

"syntastic设置
let g:syntastic_python_checkers=['flake8']
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open=1
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_wq = 0

"using brewed python in macvim
if has("gui_macvim")
  let g:ycm_path_to_python_interpreter = '/usr/local/bin/python'
  set guifont=Monaco:h12
endif

if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

"jedi-vim设置
let g:jedi#completions_command = "<C-j>"
let g:jedi#popup_on_dot=0

"Easymotion设置
let g:EasyMotion_leader_key = 'f'

"airline设置
let g:airline_left_sep = ''
let g:airline_right_sep = ''
"let g:airline_theme = "dark"
let g:airline_theme = "murmur"

"Emmet设置
let g:user_emmet_install_global = 1

"UltiSnips设置
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"NeoComplCache设置
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3

" make neocomplcache use jedi#completions omini function for python scripts
if !exists('g:neocomplcache_omni_functions')
    let g:neocomplcache_omni_functions = {}
    let g:neocomplcache_omni_functions['python'] = 'jedi#completions'
endif
" make Vim call omni function when below patterns matchs
let g:neocomplcache_force_omni_patterns = {}
let g:neocomplcache_force_omni_patterns.python = '[^. \t]\.\w*'

"unite.vim设置
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
let g:unite_winheight = 10
let g:unite_split_rule = 'botright'
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--line-numbers --nocolor --nogroup --smart-case'
let g:unite_source_grep_recursive_opt = ''

nnoremap <space>/ :Unite -buffer-name=matches -no-quit grep:.<cr>
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Not showing the trailing space as red if has vim-trailing-color installed
  autocmd InsertLeave <buffer> match ExtraWhitespace //
  autocmd InsertEnter <buffer> match ExtraWhitespace //
  autocmd BufWinEnter <buffer> match ExtraWhitespace //
  " Other Customizations
  nmap <silent><buffer><expr> <C-x> unite#do_action('split')
  nmap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

set tabpagemax=18
set showtabline=2


let g:autopep8_ignore="E501,W293"
let g:autopep8_select="E501,W293"
let g:autopep8_pep8_passes=100
let g:autopep8_max_line_length=110
let g:autopep8_aggressive=1
let g:autopep8_indent_size=2
let g:autopep8_disable_show_diff=1

