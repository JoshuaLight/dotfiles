" -------------
" -- Plugins --
" -------------
call plug#begin('~/.local/share/nvim/plugged')

" -- Visual --
" Atom One Dark theme.
Plug 'joshdick/onedark.vim'

" -- Common --

" Git.
Plug 'tpope/vim-fugitive'

" Icons are shown in many plugins.
Plug 'ryanoasis/vim-devicons'

" More flexible search motions.
Plug 'easymotion/vim-easymotion'

" Yanks are highlighted.
Plug 'machakann/vim-highlightedyank'

" Highlights after incremental search are turned off automatically.
Plug 'haya14busa/is.vim'

" Incredible fast fuzzy search.
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Filesystem tree.
Plug 'scrooloose/nerdtree'

" Autocompletion.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" .editorconfig.
Plug 'editorconfig/editorconfig-vim'

" Syntax checking.
Plug 'w0rp/ale'

" Start screen is more customizable.
Plug 'mhinz/vim-startify'

" Tags.
" Plug 'ludovicchabant/vim-gutentags'

" Second brain.
Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vim-zettel'

" Brackets are paired automatically.
Plug 'jiangmiao/auto-pairs'

" Floating terminal is available.
Plug 'voldikss/vim-floaterm'

" -- Languages --
" Latex.
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" Markdown.
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Python - Syntax highlighting.
Plug 'vim-python/python-syntax'

" Python - Automatic sorting of imports.
Plug 'fisadev/vim-isort'

" Python - Automatic imports.
Plug 'mgedmin/python-imports.vim'

" C#.
Plug 'OmniSharp/omnisharp-vim'
Plug 'OrangeT/vim-csharp'

" Rust.
Plug 'rust-lang/rust.vim'

" LaTeX.
Plug 'lervag/vimtex'

call plug#end()


" -------------
" -- Configs --
" -------------
" Encoding is UTF-8.
set encoding=utf-8

" When a new buffer is opened, the old one is hidden instead of being closed.
set hidden

" Lines are not wrapped.
set nowrap

" Swap files are created.
set swapfile

" All swap files are gathered in one place and are stored by full paths.
set directory=~/.vim/swap//

" Backup is enabled.
set backup

" All backup files are gathered in one place and are stored by full paths.
set backupdir=~/.vim/backup//

" For each change there is an undo file created to store the history of a file. 
set undofile

" All undo files are gathered in one place and are stored by full paths.
set undodir=~/.vim/undo//

" Searching with `/` highlights results as you type.
set incsearch

" Searching with `/` is case insensitive.
set ignorecase

" Searching with `/` is case insensitive only if there are no capital letters
" in search.
set smartcase

" Line numbers are visible.
set number

" Buffer for writing commands and echoing results is bigger.
set cmdheight=2

" Swap files are created, and `CursorHold` autocommand is called at a shorter
" interval of time.
set updatetime=50

" When auto-completion is used, short messages like "The only match"
" or "match 1 of 2" are not shown.
set shortmess+=c

" Cursor has always block shape.
set guicursor=n-v-c-i:block-cursor

" The column for syntax errors and other signs is always visible (not shifting
" the text).
set signcolumn=yes

" Colors from dark palette are used (doesn't actually change the background
" color).
set background=dark

" Sounds for errors are disabled.
set noerrorbells

" Screen flashing instead of sounds for errors is enabled (only to disable it
" later).
set visualbell

" Screen flashing is disabled at a terminal level.
set t_vb=

" Tab character is expanded to a number of space characters.
set expandtab

" Tab is equal to 4 spaces.
set tabstop=4

" The indentation level is equal to 4 spaces.
set shiftwidth=4

" Messages are not shown at last line when in Insert, Visual or Replace modes.
set noshowmode

" Current line is highlighted.
set cursorline

" '.vimrc' from the current project directory is sourced automatically.
set exrc

" '.vimrc' that is sourced from `exrc` option has some disabled commands.
set secure

" Set leader as space character.
let mapleader = ' '

filetype indent plugin on

syntax enable

augroup ActiveWindow
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END

fun! InitCompletion()
    set completeopt=menuone,noinsert

    " Closes the preview window after the completion is made.
    autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

    " Make <Tab> to complete the selected option.
    inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"

    " Make <CR> to complete the selected option.
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
endfun

:call InitCompletion()

" Allows to check syntax highlighting groups under the cursor.
fun! SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfun

nmap <Leader>h :call SynStack()<CR>

fun! InitColors()
    " Syntax highlighting is on.
    syntax on

    " Color scheme is OneDark.
    colorscheme onedark

    " 24-bit RGB palette is used to display colors.
    set termguicolors

    " A highlight group for black color.
    hi Black guifg=#000000 guibg=#000000

    " Default OneDark colors are customized.
    hi Normal guifg=#abb2bf guibg=#2d2f36
    hi White guifg=#abb2bf
    hi ColorColumn guifg=#5c6370
    hi StatusLine guibg=#26292e
    hi StatusLineNc guibg=#26292e
    hi CursorLine guibg=#23272c

    hi Keyword guifg=#c678dd
    hi link Boolean Keyword
    hi link Float Keyword
    hi link vimIsCommand Keyword

    hi Identifier guifg=#bfd2ff
    hi link vimVar Identifier
    hi link vimFuncVar Identifier
    hi link vimOption Identifier
    hi link vimHiGroup Identifier
    hi link vimSynType Identifier
    hi link vimHiGuiFgBg Identifier

    hi Function guifg=#dcdcaa
    hi link vimFunction Function
    hi link vimFunc Function
    hi link vimFuncName Function
    hi link vimUserFunc Function
    hi link vimNumber Function

    hi Operator guifg=#f92672
    hi link vimHiKeyList Operator
    hi link vimContinue Operator

    hi Structure guifg=#61afef
    hi link vimAutoEvent Structure
    hi link vimAutoEventList Structure
    hi link vimGroup Structure

    hi Interface guifg=#fd971f
    hi Enum guifg=#92e22e

    hi Character guifg=#ce9178
    hi link vimString Character

    hi Error guifg=#ff3333
    hi link ErrorMsg Error
    hi link SpellBad Error

    hi Warning guifg=#ffb700
    hi link WarningMsg Warning
    hi link SpellCap Warning

    " Autocompletion popup.
    hi Pmenu guibg=#212429
    hi PmenuSbar guibg=#212429
    hi PmenuThumb guibg=#323841
endfun

:call InitColors()


" -- Plugins --
fun! InitEasyMotion()
    " Jump to the beginning of a word that matches the character.
    map s :call EasyMotion#User('\V\<'.escape(nr2char(getchar()), '\'), 0, 2, 0)<CR>
endfun

:call InitEasyMotion()

fun! InitFZF()
    fun! RipgrepFzf(query, fullscreen)
        let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
        let initial_command = printf(command_fmt, shellescape(a:query))
        let reload_command = printf(command_fmt, '{q}')
        let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
        call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
    endfun

    fun! RipgrepFiles(query, fullscreen)
        call fzf#run(fzf#wrap({'source': 'rg --files --hidden --glob "!.git"'}))
    endfun

    " An interactive fuzzy search with RG command.
    command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
    command! -nargs=* -bang RGFiles call RipgrepFiles(<q-args>, <bang>0)

    :nnoremap <M-p> <Nop>
    :nnoremap <M-p> :RGFiles<CR>

    :nnoremap <M-f> <Nop>
    :nnoremap <M-f> :Rg<CR>

    :nnoremap <M-x> <Nop>
    :nnoremap <M-x> :Commands<CR>

    " Completion is done in floating window at the center of the screen.
    let g:fzf_layout = { 'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8, 'yoffset': 0.5, 'xoffset': 0.5, 'highlight': 'VertSplit', 'border': 'sharp' } }
    let g:fzf_colors = { 'bg+': ['bg', 'Pmenu'], 'hl+': ['bg', 'Cursor'], 'info': ['fg', 'Function'], 'prompt': ['fg', 'Keyword'], 'pointer': ['fg', 'Operator'], 'border': ['bg', 'CursorLine'], 'hl': ['bg', 'Cursor'] }
endfun

:call InitFZF()

fun! InitNERDTree() 
    :nnoremap <M-1> :NERDTreeToggle<CR>

    let g:NERDTreeShowHidden = 1
endfun

:call InitNERDTree()

fun! InitCOC()
    " Navigation.
    nmap gd <Nop>
    nmap gd <Plug>(coc-definition)

    nmap gy <Nop>
    nmap gy <Plug>(coc-type-definition)

    nmap gi <Nop>
    nmap gi <Plug>(coc-implementation)

    nmap gr <Nop>
    nmap gr <Plug>(coc-references)

    " Map function and class text objects.
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Diagnostics.
    nmap g[ <Nop>
    nmap g[ <Plug>(coc-diagnostic-prev)

    nmap g] <Nop>
    nmap g] <Plug>(coc-diagnostic-next)

    " Refactoring.
    nmap <Leader>r <Nop>
    nmap <Leader>r <Plug>(coc-rename)

    " Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    " Use Alt+Enter to open actions popup.
    nmap <A-Return> <Plug>(coc-codeaction)

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
    "
    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')
endfun

:call InitCOC()

fun! InitAle()
    let g:ale_lint_on_enter = 0
    let g:ale_lint_on_save = 0
    let g:ale_lint_delay = 50
    let g:ale_lint_on_text_changed = 'always'

    let g:ale_linters = { 
    \ 'cs': ['OmniSharp']
    \ }

    hi link ALEError Error
    hi link ALEStyleWarning Warning
    hi link ALEStyleWarningSign Warning
    hi link ALEErrorLine Error
    hi link ALEErrorSign Error
endfun

:call InitAle()

fun! InitVimWiki()
    let g:vimwiki_list = [{'path': '~/git/JoshuaLight/zettelkasten', 'ext': 'md', 'syntax': 'markdown'}]
    let g:vimwiki_table_mappings = 0

    hi VimwikiCode guibg=#212429 guifg=#c678dd
    hi link VimwikiHeader1 Function
    hi link VimwikiHeader2 Function
    hi link VimwikiHeader3 Function
    hi link VimwikiHeaderChar Operator
endfun

:call InitVimWiki()

fun! InitVimZettel()
    let g:zettel_fzf_command = 'rg -l --column --line-number --no-heading --color=always --ignore-case'
    let g:zettel_format = '%y%m%d%H%M %title'
endfun

:call InitVimZettel()

fun! InitAutoPairs()
    let g:AutoPairsShortcutToggle = ''
endfun

:call InitAutoPairs()

fun! InitFloaterm()
endfun

:call InitFloaterm()


" -- Languages --
fun! InitPython()
    let g:python_highlight_all = 1
    let g:kite_tab_complete = 1
    let g:vim_isort_python_version = 'python3'

    let NERDTreeIgnore=['\.pyc$', '\~$']

    au BufNewFile,BufRead *.py
      \   set tabstop=4
      \ | set softtabstop=4
      \ | set shiftwidth=4
      \ | set textwidth=79
      \ | set expandtab
      \ | set autoindent
      \ | set fileformat=unix
      \ | nmap <Leader>s :call CleanUp()<CR>
      \ | nmap <Leader>i :call Import()<CR>

    fun! CleanUp()
        let cursor_position = getpos('.')
        exec 'Isort'
        call setpos('.', cursor_position)
    endfun

    fun! Import()
        let cursor_position = getpos('.')
        exec 'ImportName'
        exec 'Isort'
        call setpos('.', cursor_position)
    endfun
endfun

:call InitPython()

fun! InitCSharp()
    " stdio Roslyn server is used (instead of HTTP).
    let g:OmniSharp_server_stdio = 1

    " Highlight as you type.
    let g:OmniSharp_highlighting = 3

    " Semantic highlighting is turned on.
    let g:OmniSharp_highlight_types = 3

    " fzf is used as selector UI.
    let g:OmniSharp_selector_ui = 'fzf'
    let g:OmniSharp_selector_findusages = 'fzf'

    " Show type information automatically when the cursor stops moving.
    " Note that the type is echoed to the Vim command line, and will overwrite
    " any other messages in this space including e.g. ALE linting messages.
    "
    " Update: Turned this off, cause command line wasn't working at all.
    " autocmd CursorHold *.cs OmniSharpTypeLookup

    autocmd FileType cs nmap <silent> <buffer> <Leader>f <Plug>(omnisharp_code_format)
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>

    autocmd BufNewFile,BufRead *.cs
      \   set tabstop=2
      \ | set softtabstop=2
      \ | set shiftwidth=2
      \ | set expandtab
      \ | set autoindent

    " Colors.
    hi link csNumber Function

    hi link csModifier Keyword
    hi link csTypeDecleration Keyword
    hi link csType Keyword

    hi link csStorage Identifier
    hi link csClassType Identifier
    hi link csLogicSymbols Identifier

    hi link csClass Structure

    hi link csString Character
    hi link csVerbatimString Character
    hi link csInterpolatedString Character
    hi link csQuote Character

    " OmniSharp semantic highlighting.
    let g:OmniSharp_highlight_groups = {
    \ 'Keyword': 'Keyword',
    \ 'ClassName': 'Structure',
    \ 'StructName': 'Structure',
    \ 'EnumName': 'Enum',
    \ 'TypeParameterName': 'Identifier',
    \ 'InterfaceName': 'Interface',
    \ 'NumericLiteral': 'Function',
    \ 'Operator': 'Operator',
    \ 'Punctuation': 'White',
    \ }
endfun

:call InitCSharp()

fun! InitRust()
    let g:rustfmt_autosave = 1
    let g:rustfmt_emit_files = 1

    autocmd BufNewFile,BufRead *.rs
      \   set tabstop=4
      \ | set softtabstop=4
      \ | set shiftwidth=4
      \ | set expandtab
      \ | set autoindent
      \ | set fileformat=unix
      \ | let b:ale_linters=[]
      \ | nmap <Leader>s :RustFmt<CR>

    :nnoremap <Leader>; mzA;<Esc>`z

    " Colors.
    hi link rustKeyword Keyword
    hi link rustDynKeyword Keyword
    hi link rustStorage Keyword
    hi link rustType Keyword
    hi link rustStructure Keyword
    hi link rustSigil Keyword
    hi link rustAssert Keyword
    hi link rustSelf Keyword
    hi link rustTypedef Keyword
    hi link rustBoolean Keyword

    hi link rustModPath Identifier

    hi link rustFuncCall Function
    hi link rustFuncName Function
    hi link rustDecNumber Function
    hi link rustFloat Function

    hi link rustString String
    hi link rustStringDelimiter String

    hi link rustIdentifier Structure
    hi link rustEnumVariant Structure
    hi link rustAttribute Structure
    hi link rustDerive Structure
    hi link rustTrait Structure

    hi link rustOperator Operator
    hi link rustArrowCharacter Operator
    hi link rustQuestionMark Operator
    hi link rustModPathSep Operator
endfun

:call InitRust()

fun! InitElm()
    autocmd BufNewFile,BufRead *.elm
      \   set filetype=elm

endfun

:call InitElm()

fun! InitLatex()
    let g:vimtex_view_method = 'skim'
    let g:vimtex_quickfix_mode = 0
    let g:vimtex_syntax_conceal = {
        \ "accents": 1,
        \ "cites": 1,
        \ "fancy": 1,
        \ "greek": 1,
        \ 'math_bounds': 1,
        \ 'math_delimiters': 1,
        \ 'math_fracs': 1,
        \ 'math_super_sub': 0,
        \ 'math_symbols': 1,
        \ 'styles': 1,
        \}

    let g:tex_flavor = 'latex'

    " These are not working since vimtex 2.0.
    "let g:tex_conceal='abdgm'
    "let g:tex_superscripts= "[0-9a-zA-W.,:;+-<>/()=]"
    "let g:tex_subscripts= "[0-9aehijklmnoprstuvx,+-/().]"

    set conceallevel=2
endfun

:call InitLatex()

" --------------
" -- Bindings --
" --------------
" Reload a current file.
:nnoremap <A-r> :source %<CR>

" Exit from whole VIM like in Emacs.
" (Not works without unbinding <C-c> first.)
:nnoremap <C-c> <Nop>
:nnoremap <C-x><C-c> :qa!<CR>

" Use 0 as ^.
:noremap 0 ^
:noremap ^ 0

" Use jj to escape Insert mode.
imap jj <Esc>

" Make sure <C-c> behaves as <Esc> (it helps with autoclosing windows).
imap <C-c> <Esc>

" Splits.
nnoremap <A-w> :q<CR>

" Run previous shell command.
nnoremap <A-;> :!!<CR>

" Git.
nnoremap <A-g> :Git<CR>
nnoremap <C-k> :Git commit<CR>
nmap <C-p> <Nop>
nnoremap <C-p> :Git push<CR>
nnoremap <C-j> :Git pull --rebase<CR>
