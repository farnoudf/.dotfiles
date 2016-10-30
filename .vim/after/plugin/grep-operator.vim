" Taken from Learn Vimscript the Hard Way by Steve Losh
" http://learnvimscriptthehardway.stevelosh.com/

nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<CR>g@
vnoremap <leader>g :<C-u>call <SID>GrepOperator(visualmode())<CR>

function! s:GrepOperator(type)
   let saved_unnamed_register = @@

   if a:type ==# 'v'
      normal! `<v`>y
   elseif a:type ==# 'char'
      normal! `[v]`y
   else
      return
   endif

   silent execute "grep! -R " . shellescape(@@) . " ."
   copen

   let @@ = saved_unnamed_register
endfunction
