" quickly modify vimrc and zshrc, and reload vimrc
nnoremap <leader>ev :sp ~/.config/nvim/init.vim<CR>
nnoremap <leader>ez :sp ~/.zshrc<CR>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>

" window switching
nnoremap <C-down> <C-W>j
nnoremap <C-up> <C-W>k
nnoremap <C-right> <C-W>l
nnoremap <C-left> <C-W>h

" fold all
nnoremap <space> za

" unhighlight search
nnoremap <leader><space> :noh<CR>
