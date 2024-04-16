-- vim.keymap.set('n', '<leader>q', '<cmd>q!<cr>', { desc = 'Quit Neovim' })

vim.cmd [[
    nnoremap <leader>w <C-W>
    nnoremap <M-Right> <c-w>2>
    nnoremap <M-Left> <c-w>2<
    nnoremap <M-Up> <c-w>2+
    nnoremap <M-Down> <c-w>2-
        " Normal mode:
    nnoremap <M-h> <c-w>h
    nnoremap <M-j> <c-w>j
    nnoremap <M-k> <c-w>k
    nnoremap <M-l> <c-w>l

    " command! Cnext try | cnext | catch | cfirst | catch | endtry
    " command! Cprev try | cprev | catch | clast | catch | endtry
    " command! Lnext try | lnext | catch | lfirst | catch | endtry
    " command! Lprev try | lprev | catch | llast | catch | endtry
    "
    " nnoremap [q <cmd>Cprev<CR>
    " nnoremap ]q <cmd>Cnext<CR>
    " nnoremap [l <cmd>Lprev<CR>
    " nnoremap ]l <cmd>Lnext<CR>

    ]]
