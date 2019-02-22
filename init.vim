if &compatible
  set nocompatible               " Be iMproved
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')


  call dein#add('autozimu/LanguageClient-neovim', {
    \ 'rev': 'next',
    \ 'build': 'bash install.sh',
    \ })
  call dein#add('rust-lang/rust.vim')
  call dein#add('vim-jp/vimdoc-ja')
  call dein#add('joeeee44/vvemt')
  " call dein#add('SpaceVim/SpaceVim')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('Shougo/deoplete.nvim', {
    \ 'do': ':UpdateRemotePlugins',
    \ })
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('joshdick/onedark.vim')
  call dein#add('othree/html5.vim')
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('lilydjwg/colorizer')
  call dein#add('jelera/vim-javascript-syntax')
  call dein#add('w0rp/ale')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('mattn/emmet-vim')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('Shougo/vimfiler.vim')
  call dein#add('Shougo/defx.nvim')
  call dein#add('mbbill/undotree')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('vim-scripts/grep.vim')
  call dein#add('Shougo/context_filetype.vim')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('posva/vim-vue')
  call dein#add('mattn/excitetranslate-vim')
  call dein#add('mattn/webapi-vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')
  " call dein#add('edkolev/tmuxline.vim')
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
  call dein#add('thinca/vim-quickrun')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('twitvim/twitvim')

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

" mattn/emmet-vim
" autocmd FileType html,css,scss,pug,jade,ejs,erb imap <buffer><expr><tab>
"    \ emmet#isExpandable() ? "\<plug>(emmet-expand-abbr)" :
"    \ "\<tab>"

" autozimu/LanguageClient-neovim
" $ yarn global add vue-language-server
" $ yarn global add javascript-typescript-langserver
set hidden
let g:LanguageClient_serverCommands = {
  \ 'vue': ['vls'],
  \ 'html': [],
  \ 'css': [],
  \ 'javascript': ['javascript-typescript-stdio'],
  \ 'typescript': ['javascript-typescript-stdio'],
  \ 'ruby': ['solargraph', 'stdio'],
  \ 'java': ['jdtls', '-data', getcwd(), '-Dlog.level=ALL'],
  \ }
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
" nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<CR>
" not stop completion $ & /
setlocal iskeyword+=$
setlocal iskeyword+=-
" rust-lang/rust.vim
let g:rustfmt_autosave = 1

" lilydjwg/colorizer'
" :ColorHighlight	- start/update highlighting
" :ColorClear      - clear all highlights
" :ColorToggle     - toggle highlights
" call dein#add('unite-webcolorname') #error

" vim-jp/vimdoc-ja
set helplang=ja

" neosnippet.vim
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#expand_word_boundary = 1

" python3
let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'

" Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1
" <TAB>: completion.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ deoplete#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"
" <BS>: close popup and delete backword char.
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#cancel_popup() . "\<CR>"
endfunction

" joshdick/onedark.vim
colorscheme onedark
let g:onedark_termcolors=256
" syntax on
" :so $VIMRUNTIME/syntax/colortest.vim
" :so $VIMRUNTIME/syntax/hitest.vim

" Alacrittyでopacity設定してもvimは透過されない為追記 colorscheme xxx より後に書くこと
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight SpecialKey ctermbg=NONE guibg=NONE
" highlight EndOfBuffer ctermbg=NONE guibg=NONE

" w0rp/ale
let g:ale_linters = {
  \ 'html': [''],
  \ 'css': ['stylelint'],
  \ 'javascript': ['eslint'],
  \ 'vue': ['vls', 'eslint'],
  \ 'ruby': ['rubocop'],
  \ 'eruby': ['erubi'],
  \ 'erb': ['erb'],
  \ }
let b:ale_linter_aliases = {
  \ 'vue': 'css',
  \ 'eruby': 'html',
  \ }
let g:ale_open_list = 0
let g:ale_statusline_format = ['E%d', 'W%d', '']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_sign_error      ='✖'
" let g:ale_sign_warning    ='⚠'
" :ALELint

" Shougo/vimfiler.vim
nnoremap fi :VimFilerBufferDir<CR>
nnoremap fe :VimFilerExplorer -split -simple -winwidth=35 -toggle -no-quit<CR>

" call dein#add('vim-scripts/taglist.vim')
" call dein#add('szw/vim-tags')
" set tags=tags
" " let Tlist_Ctags_Cmd = "/usr/bin/ctags" // Macの場合コメントアウト
" let g:tlist_javascript_settings = 'js;o:object;f:function'
" let g:tlist_php_settings        = 'php;c:class;f:function;d:constant'
" let Tlist_Auto_Open = 1
" let Tlist_Auto_Update = 1
" let Tlist_Auto_Highlight_Tag = 1
" let Tlist_Show_One_File = 1
" let Tlist_Use_Right_Window = 1
" let g:Tlist_WinWidth = 35
" let Tlist_Exit_OnlyWindow = 1
" let Tlist_Highlight_Tag_On_BufEnter = 1
" let Tlist_Display_Prototype = 1
" let Tlist_Compact_Format = 0


" mbbill/undotree
nnoremap :ut :UndotreeToggle
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 'topleft'
let g:undotree_SplitWidth = 35
let g:undotree_diffAutoOpen = 1
let g:undotree_diffpanelHeight = 25
let g:undotree_RelativeTimestamp = 1
let g:undotree_TreeNodeShape = '*'
let g:undotree_HighlightChangedText = 1
let g:undotree_HighlightSyntax = "UnderLined"

" easymotion
nmap s <Plug>(easymotion-overwin-f2)
vmap s <Plug>(easymotion-bd-f2)

" posva/vim-vue
autocmd FileType vue syntax sync fromstart
autocmd BufNewFile,BufRead *.{html,htm} set filetype=html
autocmd BufNewFile,BufRead *.erb set filetype=eruby.html

" mattn/webapi-vim
nnoremap :et :ExciteTranslate
vnoremap :et :ExciteTranslate

" terryma/vim-multiple-cursors
nnoremap :mmm :MultipleCursorsFind
vnoremap :mmm :MultipleCursorsFind

" call dein#add('ctrlpvim/ctrlp.vim')
set rtp+=~/.fzf
nnoremap <C-t> :call fzf#run({'sink': 'edit'})

" vim-airline
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme = 'dark'

" tpope/vim-fugitive'
let g:airline#extensions#branch#enabled = 1
" git add % => :Gwrite
" git status => :Gstatus "[-]add [D]Gblame
" git commit => :Gcommit -m 'xxx'
" git push => :Git push
" :Gdiff
"   do 取込, dp 書出
" :Gblame
" :Glog
" :Git log

" thinca/vim-quickrun'
" let g:quickrun_config={'_': {'split': 'vertical'}}
" set splitbelow
set splitright
" let g:quickrun_config['markdown'] = {
"   \   'outputter': 'browser'
"   \ }
" :echo &filetype or :set filetype?
" :setfiletype ***
" \r
" .ex
" 3.times do
"   puts "Hello ruby!"
" end
" :setfiletype ruby
" \r

" nathanaelkane/vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=236 ctermfg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=238 ctermfg=238

au BufEnter * execute 'lcd ' fnameescape(expand('%:p:h'))

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\""

nnoremap ff <C-w>
inoremap jj <Esc>
nnoremap // :noh<CR>
nnoremap <C-j> }
nnoremap <C-k> {
inoremap {<Enter> {<Enter>}<Esc><S-o>
inoremap [<Enter> [<Enter>]<Esc><S-o>
inoremap (<Enter> (<Enter>)<Esc><S-o>
nnoremap > <C-w>5>
nnoremap < <C-w>5<
nnoremap + <C-w>5+
nnoremap - <C-w>5-
nnoremap <Tab> :b<Space>
nnoremap <Tab>q :bd<Space>

set cursorline
hi CursorLine ctermbg=232
" set cursorcolumn
" hi CursorColumn ctermbg=232
set number
hi CursorLineNr term=bold cterm=NONE ctermfg=green ctermbg=NONE

set clipboard&
set clipboard^=unnamedplus
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
" set cindent
" set smartcase
set ignorecase
set noswapfile
set whichwrap=b,s,h,l,<,>,[,]
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set scrolloff=20
set hidden
function! s:newfile(title)
  execute ":f ~/dotfiles/".strftime('%Y-%m-%d-%H-%M-%S').a:title.".txt"
endfunction

" Vim終了時に現在のセッションを保存する
" au VimLeave * mks!  ~/vimsession

"引数なし起動の時、前回のsessionを復元
" autocmd VimEnter * nested if @% == '' && s:GetBufByte() == 0 | source ~/vimsession | endif
" function! s:GetBufByte()
"     let byte = line2byte(line('$') + 1)
"     if byte == -1
"         return 0
"     else
"         return byte - 1
"     endif
" endfunction

augroup fileTypeIndent
autocmd!
  autocmd BufNewFile,BufRead *.php setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.py  setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.rb  setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" Slack
" let g:slaq_token = "token"

" TwitVim
let twitvim_enable_python = 1
"Plugin commands
" :PosttoTwitter - This command will prompt you for a message to send to Twitter.
" :CPosttoTwitter - This command posts the current line in the current buffer to Twitter.
" :BPosttoTwitter - This command posts the current buffer to Twitter.
" :FriendsTwitter - View friends timeline.
" :UserTwitter - View your timeline.
" :MentionsTwitter - View @-mentions.
" :PublicTwitter - View public timeline.
" :DMTwitter - View direct messages.
" :SearchTwitter - Use Twitter Search.

