
" To reload this file ... :so %
"                     ... :so ~/.vimrc
"

let $VIM='~/.vim/'
set synmaxcol=500
set shell=/bin/bash

"====[ activate pathogen. Note, must be before any filetype detection commands! ]=========
    let g:pathogen_disabled = []

    "call add(g:pathogen_disabled, 'bufexplorer.vim')
    "call add(g:pathogen_disabled, 'coc') " NOTE: If you disable this, comment out the coc config below
    "call add(g:pathogen_disabled, 'codeium')
    call add(g:pathogen_disabled, 'ctrlp')
    call add(g:pathogen_disabled, 'ctrlsf')
    "call add(g:pathogen_disabled, 'dracula-theme')
    "call add(g:pathogen_disabled, 'git-nerdtree')
    "call add(g:pathogen_disabled, 'gitgutter')
    call add(g:pathogen_disabled, 'html5')
    "call add(g:pathogen_disabled, 'instant-markdown-d')
    call add(g:pathogen_disabled, 'javascript')
    "call add(g:pathogen_disabled, 'localrc')
    call add(g:pathogen_disabled, 'php.vim')
    "call add(g:pathogen_disabled, 'surround')
    call add(g:pathogen_disabled, 'syntastic')
    "call add(g:pathogen_disabled, 'taboo')
    "call add(g:pathogen_disabled, 'tagbar')
    call add(g:pathogen_disabled, 'tern_for_vim')
    call add(g:pathogen_disabled, 'textobj-gitgutter')
    call add(g:pathogen_disabled, 'textobj-user')
    call add(g:pathogen_disabled, 'typescript-tsuquyomi')
    call add(g:pathogen_disabled, 'typescript-vim')
    "call add(g:pathogen_disabled, 'undotree')
    "call add(g:pathogen_disabled, 'vim-airline')
    call add(g:pathogen_disabled, 'vim-flow')
    call add(g:pathogen_disabled, 'vim-fugitive')
    "call add(g:pathogen_disabled, 'vim-go')
    call add(g:pathogen_disabled, 'vim-misc')
    call add(g:pathogen_disabled, 'vim-node')
    "call add(g:pathogen_disabled, 'vim-peekaboo')
    "call add(g:pathogen_disabled, 'vim-prettier')
    call add(g:pathogen_disabled, 'vim-session')
    "call add(g:pathogen_disabled, 'vim-terraform')
    call add(g:pathogen_disabled, 'VimCompletesMe')
    call add(g:pathogen_disabled, 'vimproc')

    "call pathogen"runtime_append_all_bundles()
    call pathogen#infect()
    call pathogen#helptags()

" Probably a no-op, but this ensure we are using vim instead of vi
set nocompatible
" good idea to keep tabstop, shiftwidth and softtabstop the same value
set autoindent tabstop=4 shiftwidth=4 softtabstop=4
set expandtab
" show line numbers
set number
" Allow vim to navigate away from unwritten changes in a buffer without warning
set hidden
" Keep the cursor in the center of the display where possible
set scrolloff=999
" ruler shows the column/row in the bottom right
set ruler
" highlight the entire column depending on where the cursor is
set cursorcolumn

"====[ Undo ]====
if has('persistent_undo')
    set undofile
    set undodir=$HOME/.vim_undofiles
    set undolevels=5000
endif

"====[ Key mappings ]=========
    let mapleader = ";" " default is \
    " ;h = help
    "nmap <leader>h :echo "h1 h2 hb ht hc he"<CR>
    "nmap <leader>h1 :echo "F3:help F5:whitespace F6:paste F7:unix"<CR>
    "nmap <leader>h2 :echo "n:number l:invisibles w:whitesapce"<CR>
    "nmap <leader>hb :echo "be:explorer ctrl-^:switch bd:close bp:previous :enew(new buffer in current window)"<CR>
    "nmap <leader>he :echo ";e:editwindow ;et:edittab ;es:editsplit ;ev:editvirticalsplit"<CR>
    "nmap <leader>ht :echo "gt:advance gT:backwards tabedit:new"<CR>
    "nmap <leader>hc :echo "changes:list g;:back g,:forward jumps:list ctrl-o:backward ctrl-i:forward"<CR>
    "nmap <leader>hw :echo "ctrl-w s:split(sp) v:vertical(vsp) :on:only w:cycle +/-/=/_/\|:size r/R:rotate x:exchange HJKL:move T:tabedit"<CR>

    " show line numbers
    nmap <leader>n :set number!<CR>
    " show invisibles
    nmap <leader>l :set list!<CR>
    " indent shortcuts
    "nmap <D-[> <<
    "nmap <D-]> >>
    "vmap <D-[> <gv
    "vmap <D-]> >gv
    "nmap <C-[> <<
    "nmap <C-]> >>
    "vmap <C-[> <gv
    "vmap <C-]> >gv
    " Easy paste toggel
    "nnoremap <silent> <F6> :set paste!<CR>
    " Change to unix
    "nnoremap <silent> <F7> :set fileformat=unix<CR>
    " Buffers
    "nnoremap <F8> :buffers<CR>:buffer<Space>
    "nnoremap <F9> :bn<CR>
    "nmap <leader>b :bn<CR>
    " Windows
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l
    " Tabs
    "map <D-S-]> gt
    "map <D-S-[> gT
    "map ’ gt
    "map ” gT
    " Undo tree
    nmap <leader>u :UndotreeToggle<cr>
    nmap <leader>e :earlier<CR>

" === codeium ===
    let g:airline_section_y = '{…}%3{codeium#GetStatusString()}'
    "let g:codeium_no_map_tab = 1
    let g:codeium_disable_bindings = 1

    imap <script><silent><nowait><expr> <C-\> codeium#Accept()
    imap <C-]>   <Cmd>call codeium#CycleCompletions(1)<CR>
    "imap <C-[>   <Cmd>call codeium#CycleCompletions(-1)<CR>
    "imap <C-x>   <Cmd>call codeium#Clear()<CR>
    "imap <leader>j   <Cmd>call codeium#CycleCompletions(1)<CR>
    "imap <leader>h   <Cmd>call codeium#CycleCompletions(-1)<CR>

"====[ CtrlSF ]====
    nmap     <C-F>f <Plug>CtrlSFPrompt
    vmap     <C-F>f <Plug>CtrlSFVwordPath
    vmap     <C-F>F <Plug>CtrlSFVwordExec
    nmap     <C-F>n <Plug>CtrlSFCwordPath
    nmap     <C-F>p <Plug>CtrlSFPwordPath
    nnoremap <C-F>o :CtrlSFOpen<CR>
    nnoremap <C-F>t :CtrlSFToggle<CR>
    inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
    "let g:ctrlsf_debug_mode = 1

"====[ git-nerdtree : NERD Tree (git) ]====
    "nmap <leader>t :NERDTreeToggle<CR>
    let g:NERDTreeUseSimpleIndicator = 1
    let g:NERDTreeQuitOnOpen = 1
    noremap <C-n> :NERDTreeToggle<CR>
    noremap <Leader>m :NERDTreeFind<CR>

"====[ gitgutter : Git Gutter ]====
    " git gutter hide/show
    nmap <leader>gt :GitGutterToggle<CR>
    nmap ]g <Plug>(GitGutterNextHunk)
    nmap [g <Plug>(GitGutterPrevHunk)
    nmap <Leader>gn <Plug>(GitGutterNextHunk)
    nmap <Leader>gp <Plug>(GitGutterPrevHunk)
    nmap <Leader>ga <Plug>(GitGutterStageHunk)
    nmap <Leader>gr <Plug>(GitGutterUndoHunk)
    nmap <Leader>gv <Plug>(GitGutterPreviewHunk)
    nmap <Leader>gd <Plug>(GitGutterDebug)
    nmap <Leader>gW :let g:gitgutter_diff_args = '-w'<CR>
    nmap <Leader>gw :let g:gitgutter_diff_args = ''<CR>
    " let g:gitgutter_sign_added = 'xx'
    " let g:gitgutter_sign_modified = 'yy'
    " let g:gitgutter_sign_removed = 'zz'
    " let g:gitgutter_sign_removed_first_line = '^^'
    " let g:gitgutter_sign_modified_removed = 'ww'
    execute "highlight GitGutterAdd guifg=#009900 guibg=NONE ctermfg=2 ctermbg=NONE"
    execute "highlight GitGutterChange guifg=#bbbb00 guibg=NONE ctermfg=3 ctermbg=NONE"
    execute "highlight GitGutterDelete guifg=#ff2222 guibg=NONE ctermfg=1 ctermbg=NONE"
    " set update times
    autocmd BufWritePost * GitGutter

"====[ Syntastic ]====
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    "let g:syntastic_debug = 3
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1 " 0
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0 " 1
    let g:syntastic_loc_list_height = 5
    ""let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': [] }
    ""let g:syntastic_html_tidy_exec = 'tidy --indent auto --indent-spaces 2'
    ""let g:syntastic_html_checkers = ['html_lint.py']
    ""let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]
    "let g:syntastic_html_tidy_blocklevel_tags=["md-tabs", "md-tab", "md-cards", "md-card", "md-card-content"]
    ""let g:syntastic_html_tidy_inline_tags=[]
    ""let g:syntastic_html_tidy_empty_tags=[]

    let g:syntastic_javascript_checkers = []
    "let g:syntastic_javascript_checkers = ['eslint']
    "let g:syntastic_javascript_checkers = ['flow']
    " npm install -g eslint eslint-react eslint-plugin-react
    "let g:syntastic_javascript_flow_exe = 'flow'

    let g:syntastic_error_symbol = '❌'
    let g:syntastic_style_error_symbol = '⁉️'
    let g:syntastic_warning_symbol = '⚠️'
    let g:syntastic_style_warning_symbol = '💩'

    highlight link SyntasticErrorSign SignColumn
    highlight link SyntasticWarningSign SignColumn
    highlight link SyntasticStyleErrorSign SignColumn
    highlight link SyntasticStyleWarningSign SignColumn

"====[ Airline ]====
    let g:airline#extensions#tabline#enabled = 1

"====[ Flow ]====
    let g:flow#autoclose=1

"===[ prettier ]===
    " npm -g install prettier
    " https://github.com/prettier/vim-prettier
    let g:prettier#config#tab_width = 4
    let g:prettier#config#jsx_bracket_same_line = 'false'
    let g:prettier#config#print_width = 120
    let g:prettier#config#parser = 'flow'
    "let g:prettier#config#use_tabls = 'false'
    "let g:prettier#config#semi = 'true'
    "let g:prettier#config#sinfle_quote = 'true'
    "let g:prettier#config#bracket_spacing = 'false'
    "let g:prettier#config#jsx_bracket_same_line = 'true'
    "let g:prettier#config#arrow_parens = 'always'
    "let g:prettier#config#trailing_comma = 'all'
    "let g:prettier#config#config_precedence = 'prefer-file'
    "let g:prettier#config#prose_wrap = 'preserve'
    "let g:prettier#config#html_whitespace_sensitivity = 'css'

" === terraform ===
    let g:terraform_binary_path = "/Users/matt/bin/,tofu"
    let g:terraform_fmt_on_save = 1

"===[ coc ]=== NOTE this is here as something above it breaks the ]g key combo
    set encoding=utf-8
    set nobackup
    set nowritebackup
    set updatetime=300
    "set signcolumn=yes

    " Use tab for trigger completion with characters ahead and navigate
    " NOTE: There's always complete item selected by default, you may want to enable
    " no select by `"suggest.noselect": true` in your configuration file
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config
    inoremap <silent><expr> <TAB>
          \ coc#pum#visible() ? coc#pum#next(1) :
          \ CheckBackspace() ? "\<Tab>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

    " Make <CR> to accept selected completion item or notify coc.nvim to format
    " <C-g>u breaks current undo, please make your own choice
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    function! CheckBackspace() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion
    if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window
    nnoremap <silent> K :call ShowDocumentation()<CR>

    function! ShowDocumentation()
      if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
      else
        call feedkeys('K', 'in')
      endif
    endfunction

    " Highlight the symbol and its references when holding the cursor
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s)
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Applying code actions to the selected code block
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying code actions at the cursor position
    nmap <leader>ac  <Plug>(coc-codeaction-cursor)
    " Remap keys for apply code actions affect whole buffer
    nmap <leader>as  <Plug>(coc-codeaction-source)
    " Apply the most preferred quickfix action to fix diagnostic on the current line
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Remap keys for applying refactor code actions
    nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
    xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
    nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

    " Run the Code Lens action on the current line
    nmap <leader>cl  <Plug>(coc-codelens-action)

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Remap <C-f> and <C-b> to scroll float windows/popups
    if has('nvim-0.4.0') || has('patch-8.2.0750')
      nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
      nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
      inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
      inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
      vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
      vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    endif

    " Use CTRL-S for selections ranges
    " Requires 'textDocument/selectionRange' support of language server
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer
    command! -nargs=0 Format :call CocActionAsync('format')

    " Add `:Fold` command to fold current buffer
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer
    command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

    " Add (Neo)Vim's native statusline support
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline
    "set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Mappings for CoCList
    " Show all diagnostics
    nnoremap <silent><nowait> fa  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent><nowait> fe  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent><nowait> fc  :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent><nowait> fo  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent><nowait> fs  :<C-u>CocList -I symbols<cr>
    " Do default action for next item
    nnoremap <silent><nowait> fj  :<C-u>CocNext<CR>
    " Do default action for previous item
    nnoremap <silent><nowait> fk  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent><nowait> fp  :<C-u>CocListResume<CR>

    " === coc-yank ===
    nnoremap <silent> fy  :<C-u>CocList -A --normal yank<cr>

"========================================================================

"====[ ctags and Tagbar ]====
    nmap <leader>tt :TagbarToggle<CR>
    map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
    " next line maps <A-]>
    map ‘ :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"====[ Modelines ]====
    " Check the first/last 5 lines for a modeline
    set modelines=5

    " if you use set the end of line must be a colon
    " There must be a space after the comment
    " For example...
    "    # vim: set expandtab:

    " Append modeline after last line in buffer.
    " Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
    " files.
    function! AppendModeline()
        let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :", &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
        let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
        call append(line("0"), l:modeline)
    endfunction
    nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

"====[ Invisibles ]=========
    "ctrl-v u00ac == not sign
    "ctrl-v u25b8 == triangle sign
    "ctrl-v ctrl-i == tab
    "set listchars=tab:>\ ,eol:$,trail:.
    "set listchars=tab:▸\ ,eol:¬,trail:.
    "SpecialKey = tab characters
    highlight NonText ctermfg=darkGrey
    highlight SpecialKey ctermfg=darkGrey
    "highlight NonText guifg=#4a4a59
    "highlight SpecialKey guifg=#4a4a59
    exec "set listchars=tab:\uBB\uBB,trail:·,nbsp:~"
    set list


" Edit helper
map <leader>ew :e <C-R>=expand("%:p:h") . "/"<CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/"<CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/"<CR>
map <leader>et :tabedit <C-R>=expand("%:p:h") . "/"<CR>

" Colours
    "colorscheme darkblue
    highlight Visual ctermfg=lightRed ctermbg=black cterm=reverse
    highlight Search ctermfg=lightRed ctermbg=black cterm=reverse
    color dracula
    "" au BufNewFile,BufRead *.phtml setf php

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
vmap <BS> h

set history=50 " keep 50 lines of command line history
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set incsearch " do incremental searching

" In many terminal emulators the mouse works just fine, thus enable it.
" if has('mouse')
"     set mouse=a
" endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " For all text files set 'textwidth' to 78 characters.
        "autocmd FileType text setlocal textwidth=10

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event
        " handler (happens when dropping a file on gvim).
        " Also don't do it when the mark is in the first line, that is the
        " default position when opening a file.
        autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

    augroup END

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
endif

"====[ Strip whitespace from end of lines ]====
    nmap <leader>w :call <SID>StripTrailingWhitespaces()<CR>
    nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

    function! <SID>StripTrailingWhitespaces()
        " Preparation: save last search, and cursor position
        let _s=@/
        let l = line(".")
        let c = col(".")
        " Do the business:
        %s/\s\+$//e
        " Clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction

"====[ Make the (vtextwidth)th column stand out ]====================
    let g:vtextwidth_limit = 101
    highlight ColorColumn ctermbg=magenta
    call matchadd('ColorColumn', '\%'.(g:vtextwidth_limit).'v', 100)
    " ============================================================================================> = <=

"=====[ Highlight matches when jumping to next ]=============
    " This rewires n and N to do the highlighing...
    nnoremap <silent> n   n:call HLNext(0.4)<cr>
    nnoremap <silent> N   N:call HLNext(0.4)<cr>
    highlight WhiteOnRed ctermbg=red ctermfg=white

    function! HLNext (blinktime)
        let [bufnum, lnum, col, off] = getpos('.')
        let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
        let target_pat = '\c\%#'.@/
        if exists("matchadd")
            let ring = matchadd('WhiteOnRed', target_pat, 101)
        endif
        redraw
        exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
        if exists("matchadd")
            call matchdelete(ring)
        endif
        redraw
    endfunction

"====[ Always turn on syntax highlighting for diffs ]=========================
    " EITHER select by the file-suffix directly...
    augroup PatchDiffHighlight
        autocmd!
        autocmd BufEnter  *.patch,*.rej,*.diff   syntax enable
    augroup END

    " OR ELSE use the filetype mechanism to select automatically...
    filetype on
    augroup PatchDiffHighlight
        autocmd!
        autocmd FileType  diff   syntax enable
    augroup END

"====[ Open any file with a pre-existing swapfile in readonly mode ]=========
    "augroup NoSimultaneousEdits
    "    autocmd!
    "    autocmd SwapExists * let v:swapchoice = 'o'
    "    autocmd SwapExists * echomsg ErrorMsg
    "    autocmd SwapExists * echo 'Duplicate edit session (readonly)'
    "    autocmd SwapExists * echohl None
    "    autocmd SwapExists * sleep 2
    "augroup END

    " Also consider the autoswap_mac.vim plugin (but beware its limitations)

"====[ Add support for arduino ]====
    autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

autocmd FileType gitconfig setlocal tabstop=4 noexpandtab shiftwidth=4
autocmd FileType gitconfig setlocal listchars=tab:\ \ 
"autocmd BufNewFile,BufRead *.rss,*.atom setfiletype xml

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
":execute "helptags " . g:opamshare . "/merlin/vim/doc"

"===[ golang ]===
    autocmd FileType go setlocal shiftwidth=4 softtabstop=4 noexpandtab
    autocmd FileType go setlocal listchars=tab:\ \ ,trail:·,nbsp:~

"===[ eof ]===

if has('mac')
   :set t_RV=
endif

"autocmd VimEnter * redraw!

" We will update the comment colour too while we are here
highlight Comment ctermfg=69

