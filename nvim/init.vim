syntax on
set termguicolors
set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ї],фa,іs,вd,аf,пg,рh,оj,лk,дl,ж\\;,є',ґ\\,яz,чx,сc,мv,иb,тn,ьm,ю.,./,ЙQ,ЦW,УE,КR,ЕT,НY,НY,ГU,ШI,ЩO,ЗP,Х{,Ї},ФA,ІS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж\\:,Є\\",Ґ<bar>,ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б\\<,Ю>,№#
set encoding=UTF-8
set hidden
set confirm
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set relativenumber
set nonu
set nowrap
set splitright
set smartcase
set noswapfile
set undofile
set incsearch
set colorcolumn=80
set mouse=a
if !has('nvim')
    set ttymouse=xterm2
    set nobackup
    set undodir=~/.vim/undodir
endif
let mapleader=" "

fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun

" vim-plug auto-install
let s:plug_dir = '~/.vim'
if has('nvim')
    if exists("$XDG_DATA_HOME")
        let s:plug_dir = $XDG_DATA_HOME
    else
        let s:plug_dir = $HOME.'/.local/share'
    endif
    let s:plug_dir .= "/nvim/"
endif
if empty(glob(s:plug_dir.'/autoload/plug.vim'))
    silent exe "!curl -fLo ".s:plug_dir."/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall --sync  
    if exists("$MYVIMRC") | source $MYVIMRC | else | echoerr "$MYVIMRC isn't set" | endif
endif

"let $NVIM_COC_LOG_LEVEL='debug'
if exists("$MYVIMRC_DIR")
    for f in split(glob($MYVIMRC_DIR.'/*.vim'), '\n')
        if f ==# $MYVIMRC | continue | endif
        exe 'source' f
    endfor
else
    echoerr "$MYVIMRC_DIR isn't set"
endif

call plug#begin(s:plug_dir.'/plugged')
" nerdtree related plugins
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'preservim/nerdcommenter'
" else
Plug 'morhetz/gruvbox'
Plug 'junegunn/goyo.vim'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()

" fzf
nmap <leader>f :FZF<CR>
" gruvbox
let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox
" goyo.vim
nnoremap <leader>c :Goyo<CR>

" Yankes (pastes) chunks to (from) clipboard
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>Y "*y
noremap <leader>P "*p

" Window Navigation with Ctrl-[hjkl]
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" Shortcuts for jumping between buffers
nnoremap <silent> [b :bprevious<CR> 
nnoremap <silent> ]b :bnext<CR> 
nnoremap <silent> [B :bfirst<CR> 
nnoremap <silent> ]B :blast<CR> 

" Buffer(s) manipulations
nnoremap <leader>s :w<CR>
nnoremap <leader>as :wa<CR>
nnoremap <expr><silent> <leader>q bufname('%') == '' ? ':q<CR>' : ':bw<CR>'
nnoremap <leader>aq :qa<CR>
nnoremap <leader>ax :qa!<CR>
nnoremap <leader>my :tabedit $MYVIMRC<CR>
nnoremap <leader><CR> :source $MYVIMRC<CR>

" Aliases        
call SetupCommandAlias("H","vert h")
call SetupCommandAlias("Vb","vert belowright sb")

" Other shortcuts
noremap <leader>o o<esc>
noremap <leader>O O<esc>
nnoremap <silent> <leader>h :setlocal hlsearch!<CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
map <F5> :setlocal spell! spelllang=en_us,uk<CR>
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
endif
