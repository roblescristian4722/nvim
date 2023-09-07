-- Terminal on split screen
-- vim.cmd([[
--     " turn terminal to normal mode with escape
--     tnoremap <Esc> <C-\><C-n>
--     " start terminal in insert mode
--     au BufEnter * if &buftype == 'terminal' | :startinsert | endif
--     " open terminal on ctrl+n
--     function! OpenTerminal()
--       split term://zsh
--       resize 10
--     endfunction
--     nnoremap <c-t> :call OpenTerminal()<CR>
-- ]])

vim.cmd([[
    function! LightlineFilename()
      let root = fnamemodify(get(b:, 'git_dir'), ':h')
      let path = expand('%:p')
      if path[:len(root)-1] ==# root
        return path[len(root)+1:]
      endif
      return expand('%')
    endfunction
]])

-- Move lines up and down (functions)
vim.cmd([[
    function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
    endfunction

    function! s:swap_up()
        let n = line('.')
        if n == 1
            return
        endif

        call s:swap_lines(n, n - 1)
        exec n - 1
    endfunction

    function! s:swap_down()
        let n = line('.')
        if n == line('$')
            return
        endif

        call s:swap_lines(n, n + 1)
        exec n + 1
    endfunction

    noremap <silent> <C-l> :call <SID>swap_up()<CR>
    noremap <silent> <C-k> :call <SID>swap_down()<CR>
]])
