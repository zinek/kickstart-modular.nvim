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

vim.cmd [[

" replaced text copied into unnamed register
nmap <leader>P :set opfunc=ReplaceAndKeepUnnamedRegister<CR>g@
nmap <leader>PP <leader>P_
function! ReplaceAndKeepUnnamedRegister(type, ...)
  let sel_save = &selection
  let &selection = "inclusive"
  if a:type == 'line'
    silent exe "normal! '[V']P"
  elseif a:type == 'char'
    silent exe "normal! `[v`]P"
  endif
  let &selection = sel_save
endfunction

" unnamed register not changed
nmap <leader>p :set opfunc=ReplaceAndChangeUnnamedRegister<CR>g@
nmap <leader>pp <leader>p_
function! ReplaceAndChangeUnnamedRegister(type, ...)
  let sel_save = &selection
  let &selection = "inclusive"
  if a:type == 'line'
    silent exe "normal! '[V']p"
  elseif a:type == 'char'
    silent exe "normal! `[v`]p"
  endif
  let &selection = sel_save
endfunction


" -- next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nmap <leader>Y "+Y

nnoremap <leader>d "_d
vnoremap <leader>d "_d

]]
