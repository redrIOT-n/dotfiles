noh
nnoremap <CR> <Nop>
syntax on
let mapleader = "\<space>"
set encoding=utf-8
set hidden
set nobackup
"set makeprg=make all
set termguicolors
set t_Co=16
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set nocompatible
set showmode
set showcmd
set ruler
set number
set cursorline
set expandtab
set noshiftround
set lazyredraw
set magic
set hlsearch
set incsearch
set ignorecase
set smartcase
set encoding=utf-8
set modelines=0
set formatoptions=tqn1
set tabstop=4
set shiftwidth=2
set softtabstop=4
set cmdheight=1
set laststatus=2
set backspace=indent,eol,start
set list
set listchars=tab:\│\ 
set matchpairs+=<:>
set statusline=%1*\ file\ %3*\ %f\ %4*\ 
set statusline+=%=\ 
set statusline+=%3*\ %l\ of\ %L\ %2*\ line\ 
set scrolloff=8
nmap <C-S> :w<CR>
nmap <C-_> :noh<CR>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
nmap <C-Up> 8k
nmap <C-Down> 8j
nmap <C-O> o<Esc>
nmap <C-Z> u
nmap <C-Y> <C-R>
nmap <C-F> /
nmap <C-H> i<C-W><Esc>
nmap <F3> :set invnumber<CR>
nmap <F4> :q<CR>
nmap <C-v> "+p
imap <C-S> <Esc>:w<CR>a
imap <C-_> <Esc>:noh<CR>a
imap <S-Left> <Esc>lv<Left>
imap <S-Right> <Esc>lv<Right>
imap <C-Up> <Esc>8ka
imap <C-Down> <Esc>8ja
imap <C-O> <Esc>o
imap <C-Z> <Esc>ua
imap <C-Y> <Esc><C-R>a
imap <Nul> <C-N>
imap <C-F> <Esc>/
imap <C-H> <C-W>
imap <C-V> <Esc>pa
imap <F3> <Esc>:set invnumber<CR>a
imap <F4> <Esc>:q<CR>
vmap <C-Up> 8k
vmap <C-Down> 8j
hi linenr ctermfg=8
hi cursorline cterm=NONE
hi cursorlinenr ctermfg=15
hi comment ctermfg=8
hi pmenu ctermbg=0 ctermfg=NONE
hi pmenusel ctermbg=4 ctermfg=0
hi pmenusbar ctermbg=0
hi pmenuthumb ctermbg=7
hi matchparen ctermbg=black ctermfg=NONE
hi search ctermbg=0
hi statusline ctermbg=0 ctermfg=NONE
hi statuslinenc ctermbg=0 ctermfg=0
hi user1 ctermbg=1 ctermfg=0
hi user2 ctermbg=4 ctermfg=0
hi user3 ctermbg=0 ctermfg=NONE
hi user4 ctermbg=NONE ctermfg=NONE
hi group1 ctermbg=NONE ctermfg=0
autocmd colorscheme * hi clear cursorline
match group1 /\t/

call plug#begin('~/.vim/autoload')

Plug 'NLKNguyen/papercolor-theme'
Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'https://github.com/nanotech/jellybeans.vim.git'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'https://github.com/lifepillar/vim-gruvbox8.git'
Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'preservim/nerdcommenter'
Plug 'frazrepo/vim-rainbow'
"Plug 'fholgado/minibufexpl.vim'
Plug 'xavierd/clang_complete'
Plug 'preservim/tagbar'
Plug 'vim-syntastic/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'preservim/nerdtree'
Plug 'liuchengxu/space-vim-theme'
Plug 'sainnhe/sonokai'
Plug 'ghifarit53/tokyonight-vim'
"Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'sonph/onehalf',{ 'rtp': 'vim' }
Plug 'https://github.com/liuchengxu/space-vim-dark.git'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'jlanzarotta/bufexplorer'
Plug 'jremmen/vim-ripgrep'
Plug 'https://github.com/Raimondi/delimitMate.git'
Plug 'voldikss/vim-floaterm'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/vim-scripts/c.vim.git'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'https://github.com/mkitt/tabline.vim.git'
"Plug 'https://github.com/powerline/powerline.git'
Plug 'https://github.com/wadackel/vim-dogrun.git'
Plug 'https://github.com/arzg/vim-colors-xcode.git'
"Plug 'powerline/powerline'
Plug 'safv12/andromeda.vim'
Plug 'romgrk/doom-one.vim'
Plug 'https://github.com/NLKNguyen/c-syntax.vim.git'

call plug#end()

" Correct RGB escape codes for vim inside tmux
if !has('nvim') && $TERM ==# 'screen-256color'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

""" floatterm
let g:floatterm_position='bottom'
let g:floaterm_width=0.6
let g:floaterm_height=0.2

nnoremap <Leader>ft :FloatermNew<CR>
nnoremap <Leader>t :FloatermToggle<CR>

""" fzf
nnoremap <Leader>gf :GFiles<CR>
nnoremap <Leader>fi  :Files<CR>
nnoremap <Leader>tgg :Tags<CR>
nnoremap <Leader>bu :Buffers<CR>
nnoremap <Leader>gg :Ag<CR>
nnoremap <Leader>tb :TagbarToggle<CR>
nnoremap  <Leader>n :NERDTreeToggle<CR>

"" flutter


"some additional keys for buffers
nnoremap <Leader>e<CR> :bd<CR>
nnoremap <Leader>1<CR> :1b<CR>
nnoremap <Leader>2<CR> :2b<CR>
nnoremap <Leader>3<CR> :3b<CR>
nnoremap <Leader>4<CR> :4b<CR>
nnoremap <Leader>5<CR> :5b<CR>
nnoremap <Leader>6<CR> :6b<CR>
nnoremap <Leader>7<CR> :7b<CR>
nnoremap <Leader>8<CR> :8b<CR>
nnoremap <Leader>9<CR> :9b<CR>
nnoremap <Leader>0<CR> :10b<CR>





""" rainbow brackets.. (not the gay rainbow)
let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

""" tagbar
let g:tagbar_width = 30

""" colorscheme
set background=dark
colorscheme onedark
"onedark
"purify
"PaperColor

"let g:PaperColor_Theme_Options = {
""  \   'theme': {
""  \     'default.light': {
""  \       'transparent_background' : 0,
""  \       'override' : {
""  \         'color00' : ['#1c1c1c', '234'],
""  \         'linenumber_bg' : ['#1c1c1c', '234'],
""  \         'color05' : ['#878787', '244'],
""  \         'color07' : ['#d0d0d0', '252'],
""  \         'color08' : ['#585858', '240']
""  \       }
""  \     }
""  \   }
""  \ }

if &term =~ "xterm\\|rxvt"
   "" use an orange cursor in insert mode
    let &t_SI = "\<Esc>]12;purple\x7"
    "use a red cursor otherwise
    let &t_EI = "\<Esc>]12;blue\x7"
    silent !echo -ne "\033]12;blue\007"
    "reset cursor when vim exits
    autocmd VimLeave * silent !echo -ne "\033]112\007"
    "use \003]12;gray\007 for gnome-terminal
endif


""" floaterm
let g:floaterm_autoclose = 2

""" powerline 
let g:Powerline_symbols = 'fancy'

""" airline themes / lightline 

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

set guifont=DroidSansMono\ Nerd\ Font\ 12

" airline symbols
"circles 
"set t_Co=256
"let g:airline_left_sep = "\uE0B4"
"let g:airline_right_sep = "\uE0B6"
"let g:airline_left_alt_sep = "\uE0B5"
"let g:airline_right_alt_sep = "\uE0B7"

"cuts
"let g:airline_left_sep =  "\uE0BC"
"let g:airline_right_sep = "\uE0BE"
"let g:airline_left_alt_sep = "\uE0BD"
"let g:airline_right_alt_sep = "\uE0BF"

"dust
"let g:airline_left_sep =  "\uE0C6"
"let g:airline_right_sep = "\uE0C7"
"let g:airline_left_alt_sep = "\uE0BD"
"let g:airline_right_alt_sep = "\uE0BF"



let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])

"let g:airline_theme='solarized'
"let g:lightline = {}
"let g:lightline.colorscheme = 'tokyonight

"let g:lightline = {'colorscheme': 'onedark'}    
"go back to airline after nice icons
"let g:tabline#enabled = 1

""" nerd tree
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

let g:NERDTreeWinSize = 30
"autocmd BufWinEnter * silent NERDTreeMirror
"autocmd bufenter * if (winnr(“$”) == 1 && exists(“b:NERDTreeType”) && b:NERDTreeType == “primary”) | q | endif
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsiblDTreeGitStatusIndicatorMapCustom = {
                  \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusUseNerdFonts = 1
 
""" go setup
filetype plugin indent on
filetype plugin on

set autowrite

let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

 " Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)


""" autocomplete
set encoding=utf-8
set hidden
set nowritebackup
set updatetime=300
set shortmess+=c

"map <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<Plug>delimitMateCR"
if has("nvim-0.5.0") || has("patch-8.1.1564")
" Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Make enter  auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
