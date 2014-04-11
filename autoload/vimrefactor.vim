function s:set_data()
  let s:data = split(getline('.'), '=')
  let s:method_name = substitute(s:data[0], '^\s*', '', '')
  let s:method_name = substitute(s:method_name, '\s*$', '', '')
  let s:method_body = substitute(s:data[1], '^\s*', '', '')
endfunction

function s:do_append()
  call append('.', 'end')
  call append('.', '  ' . s:method_body)
  call append('.', 'def ' . s:method_name)
  call append('.', '')
endfunction

function s:delete_line()
  execute "normal! .d"
endfunction

function s:find_end_of_parent_method()
  execute "normal! /end"
endfunction

function vimrefactor#extract_method()
  call s:set_data()
  call s:delete_line()
  call s:find_end_of_parent_method()
  call s:do_append()
endfunction
