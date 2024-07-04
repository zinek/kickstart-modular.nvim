command! OpenInRider <cmd>system(['rider64.exe', expand('%') .. ":" .. line(".")])<CR>
command! OpenInRider :echo <cmd><C-R>=expand("%")<CR><CR>
nmap <leader>or :silent !rider64.exe %:<C-R>=line(".")<CR><CR>
" nmap <leader>oo :silent !explorer.exe %<CR>
" nmap <leader>oe :silent !explorer.exe %:h<CR>
