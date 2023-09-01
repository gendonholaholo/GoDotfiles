set encoding=utf-8
set nobackup
set nowritebackup

set updatetime=300

set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <leader>ac  <Plug>(coc-codeaction-cursor)
nmap <leader>as  <Plug>(coc-codeaction-source)
nmap <leader>qf  <Plug>(coc-fix-current)

nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

nmap <leader>cl  <Plug>(coc-codelens-action)

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

command! -nargs=0 Format :call CocActionAsync('format')

command! -nargs=? Fold :call     CocAction('fold', <f-args>)

command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

set nocompatible              " be iMproved, required
set nowrap
set number
set tabstop=4
set shiftwidth=4
set expandtab

filetype on                  " required
syntax enable
filetype indent on
filetype plugin on

autocmd VimEnter * NERDTree

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'cristianoliveira/vim-react-html-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'ap/vim-css-color'
Plugin 'chiel92/vim-autoformat'
Plugin 'vim-airline/vim-airline'
Plugin 'chun-yang/auto-pairs'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'pangloss/vim-javascript'
Plugin 'omnisharp/omnisharp-vim'
Plugin 'bignimbus/pop-punk.vim'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'tpope/vim-commentary'
Plugin 'mxw/vim-jsx'
Plugin 'naumazeredo/vim-unity3d-snippets'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'rust-lang/rust.vim'
Plugin 'timonv/vim-cargo'
Plugin 'arzg/vim-rust-syntax-ext'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'c.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'philj56/vim-asm-indent'
Plugin 'compnerd/arm64asm-vim'
Plugin 'morhetz/gruvbox'
Plugin 'miyakogi/seiya.vim'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'hdima/python-syntax'
Plugin 'davidhalter/jedi-vim'
Plugin 'nvie/vim-flake8'
Plugin 'kitao/unity_dict'
Plugin 'scrooloose/syntastic'
Plugin 'valloric/youcompleteme'
Plugin 'metakirby5/codi.vim'

call vundle#end()            " required
filetype plugin indent on    " required
autocmd BufNewFile,BufRead *.yar,*.yara setlocal filetype=yara

let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

let t:is_transparent = 0                     
function! Toggle_transparent_background()                      
  if t:is_transparent == 0                   
    hi Normal guibg=#111111 ctermbg=black                     
    let t:is_transparent = 1
  else
    hi Normal guibg=NONE ctermbg=NONE                    
    let t:is_transparent = 0                        
  endif                    
endfunction               
nnoremap <F1> :call Toggle_transparent_background()<CR>

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

let g:seiya_auto_enable = 1
let g:pop_punk_italic = 0
colorscheme pop-punk
let g:airline#extensions#tabline#enabled = 1
let g:terminal_ansi_colors = pop_punk#AnsiColors()
let g:airline_theme = 'pop_punk'
let g:airline_section_c = '🍺 %F'

let g:OmniSharp_server_use_net6 = 1
au User lsp_setup call lsp#register_server({
        \   'name': 'eclipse-jdt-ls',
        \   'cmd': {server_info->[
        \     'java',
        \     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        \     '-Dosgi.bundles.defaultStartLevel=4',
        \     '-Declipse.product=org.eclipse.jdt.ls.core.product',
        \     '-Dlog.level=ALL',
        \     '-noverify',
        \     '-Xmx1G',
        \     '-jar',
        \       expand('~/bin/jdt-server/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'),
        \     '-configuration',
        \       expand('~/bin/jdt-server/config_linux'),
        \     '-data',
        \       expand('~/bin/jdt-server/data'),
        \     '--add-modules=ALL-SYSTEM',
        \     '--add-opens',
        \       expand('~/bin/jdt-server/java.base/java.util=ALL-UNNAMED'),
        \     '--add-opens',
        \       expand('~/bin/jdt-server/java.base/java.lang=ALL-UNNAMED')
        \   ]},
        \   'allowlist': ['java'],
        \ })
