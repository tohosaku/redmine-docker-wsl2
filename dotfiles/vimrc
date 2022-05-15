" dein.vim settings {{{
" install dir {{{
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" }}}

" dein installation check {{{
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif
" }}}

" begin settings {{{
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " .toml file
  let s:rc_dir = expand('~/.vim')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml = s:rc_dir . '/dein.toml'

  " read toml and cache
  call dein#load_toml(s:toml, {'lazy': 0})

  " end settings
  call dein#end()
  call dein#save_state()
endif
" }}}

" plugin installation check {{{
if dein#check_install()
  call dein#install()
endif
" }}}

" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
" }}}

let g:eskk#directory = "~/.config/eskk"
let g:eskk#dictionary = { 'path': "~/.config/eskk/my_jisyo", 'sorted': 1, 'encoding': 'utf-8',}
let g:eskk#large_dictionary = {'path': "~/.config/eskk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp',}

"表示文字を変更(オレ サンカクデ ハンダン デキナイ)
"let g:eskk#marker_henkan = "[変換]"
"let g:eskk#marker_henkan_select = "[選択]"
"let g:eskk#marker_okuri = "[送り]"
"let g:eskk#marker_jisyo_touroku = "[辞書]"

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932
set fileformat=unix
set fileformats=unix,dos
set ambiwidth=double

set listchars=tab:>\ ,trail:\
set list
set smartindent

set laststatus=2
set statusline=%f\ %{'['.(&fenc!=''?&fenc:&enc).','.&ff.']'}%m%r%h%w%=%l,%2v%6P

set tabstop=2       " <tab>1文字分の幅を半角2文字分に設定
set shiftwidth=2    " インデントをスペース2つずつに設定
set expandtab       " <tab>文字を使わず全てスペースで記述
set autoindent      " 新しい行を入力するときに自動的にインデント

autocmd ColorScheme * highlight lineNr ctermfg=8 guifg=grey

syntax on
colorscheme desert256

highlight JpSpace term=underline ctermbg=238
au BufRead,BufNew * match JpSpace /　/

set nowrap
set nocompatible
filetype on
filetype indent on
filetype plugin on

map <C-l> :tabnext<CR>
map <C-h> :tabprevious<CR>


let mapleader = ","
nnoremap <Leader>a :echo "Hello"<CR>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" function to find file under current node
function! NERDTreeFindFile(node)
  if a:node.path.isDirectory == 1
    let path = a:node.path.str()
  else
    let path = a:node.path.getDir().str()
  endif
  echo path
  NERDTreeClose
  call fzf#vim#files(path)
endfunction

" function to grep files under current node
function! NERDTreeGrepFile(node)
  if a:node.path.isDirectory == 1
    let path = a:node.path.str()
  else
    let path = a:node.path.getDir().str()
  endif
  NERDTreeClose
  call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case \"\" ".shellescape(path), 1, fzf#vim#with_preview())
endfunction

augroup nerdtree
  autocmd!
  " find file under current node
  autocmd VimEnter * call NERDTreeAddKeyMap({
        \ 'key': 'zf',
        \ 'callback': 'NERDTreeFindFile',
        \ 'quickhelpText': 'find file under current node',
        \ 'scope': 'Node' })
  " grep files under current node
  autocmd VimEnter * call NERDTreeAddKeyMap({
        \ 'key': 'zg',
        \ 'callback': 'NERDTreeGrepFile',
        \ 'quickhelpText': 'grep files under current node',
        \ 'scope': 'Node' })
augroup END

" tig-explorer
" open tig with current file
nnoremap <Leader>T :TigOpenCurrentFile<CR>

" open tig with Project root path
nnoremap <Leader>t :TigOpenProjectRootDir<CR>

" open tig grep
nnoremap <Leader>g :TigGrep<CR>

" resume from last grep
nnoremap <Leader>r :TigGrepResume<CR>

" open tig grep with the selected word
vnoremap <Leader>g y:TigGrep<Space><C-R>"<CR>

" open tig grep with the word under the cursor
nnoremap <Leader>cg :<C-u>:TigGrep<Space><C-R><C-W><CR>

" open tig blame with current file
nnoremap <Leader>b :TigBlame<CR>

set number
" set cursorline
" hi clear CursorLine

