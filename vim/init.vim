if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})

  call dein#add('posva/vim-vue')

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

" python3
let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'

" Alacrittyでopacity設定してもvimは透過されない為追記 colorscheme xxx より後に書くこと
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight SpecialKey ctermbg=NONE guibg=NONE
" highlight EndOfBuffer ctermbg=NONE guibg=NONE

set rtp+=~/.fzf
nnoremap <C-t> :call fzf#run({'sink': 'edit'})

au BufEnter * execute 'lcd ' fnameescape(expand('%:p:h'))

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\""

" posva/vim-vue
autocmd FileType vue syntax sync fromstart
autocmd BufNewFile,BufRead *.{html,htm*} set filetype=html
" autocmd BufNewFile,BufRead *.{html,htm,vue*} set filetype=html
autocmd BufNewFile,BufRead *.erb set filetype=eruby.html

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

augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI * call s:auto_cursorline('CursorMoved')
  autocmd CursorHold,CursorHoldI * call s:auto_cursorline('CursorHold')
  autocmd WinEnter * call s:auto_cursorline('WinEnter')
  autocmd WinLeave * call s:auto_cursorline('WinLeave')

  let s:cursorline_lock = 0
  function! s:auto_cursorline(event)
    if a:event ==# 'WinEnter'
      setlocal cursorline
      let s:cursorline_lock = 2
    elseif a:event ==# 'WinLeave'
      setlocal nocursorline
    elseif a:event ==# 'CursorMoved'
      if s:cursorline_lock
        if 1 < s:cursorline_lock
          let s:cursorline_lock = 1
        else
          setlocal nocursorline
          let s:cursorline_lock = 0
        endif
      endif
    elseif a:event ==# 'CursorHold'
      setlocal cursorline
      let s:cursorline_lock = 1
    endif
  endfunction
augroup END

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

augroup fileTypeIndent
autocmd!
  autocmd BufNewFile,BufRead *.php setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.py  setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.rb  setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

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

" 自動折りたたみ
" set foldenable
" set foldmethod=indent
" set foldopen=all  " fold内に移動すれば自動で開く
" set foldclose=all  " fold外に移動しfoldlevelより深ければ閉じる
" set foldlevel=0   " 折りたたみの具合
" set foldnestmax=2  " 最大折りたたみ深度$
" set foldcolumn=2  " 左側に折りたたみガイド表示$

