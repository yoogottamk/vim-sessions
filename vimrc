"  Basic vim settings
set nu rnu

" set backspace properly
set backspace=indent,eol,start

" update file if content changed outside
set autoread

" disable swapfile
set nobackup noswapfile nowb

set autoindent smartindent

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4

set hlsearch
set incsearch
set ignorecase smartcase

set undolevels=999 history=999

set noshowmode
set showcmd

" show splits on the right and below
set spr sb

" for spellings
nnoremap <F7> :setlocal spell! spelllang=en<CR>

" auto correct spelling mistakes by pressing CTRL-L
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" for split navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" move (selected) line(s) up or down
nnoremap <silent> + :m .+1<CR>==
nnoremap <silent> - :m .-2<CR>==
vnoremap <silent> + :m '>+1<CR>gv=gv
vnoremap <silent> - :m '<-2<CR>gv=gv

if has("autocmd")
    " jump to the last known location
    augroup vimStartup
        au!
        autocmd BufReadPost *
          \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
          \ |   exe "normal! g`\""
          \ | endif
    augroup END
