call SetupCommandAlias("W", "NERDTree")
"A shortcut to open NERDTree
map <C-n> :NERDTreeToggle<CR>

"Opens a NERDTree automatically when vim starts up if no files
"were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Opens NERDTree when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"Shows dot files
let NERDTreeShowHidden=1
