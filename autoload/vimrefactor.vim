function s:set_data()
  let s:data = split(getline('.'), '=')
  let s:method_name = substitute(s:data[0], '^\s*', '', '')
  let s:method_name = substitute(s:method_name, '\s*$', '', '')
  let s:method_body = substitute(s:data[1], '^\s*', '', '')
endfunction

function s:do_append()
  call append('$', '')
  call append('$', 'def ' . s:method_name)
  call append('$', '  ' . s:method_body)
  call append('$', 'end')
endfunction

function s:delete_line()
  execute "normal! .d"
endfunction

function vimrefactor#extract_method()
  call s:set_data()
  call s:do_append()
  call s:delete_line()
endfunction
