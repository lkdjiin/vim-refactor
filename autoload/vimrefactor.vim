function vimrefactor#extract_method()
  let s:data = split(getline('.'), '=')
  let s:method_name = substitute(s:data[0], '^\s*', '', '')
  let s:method_name = substitute(s:method_name, '\s*$', '', '')
  let s:method_body = substitute(s:data[1], '^\s*', '', '')


  call append('$', '')
  call append('$', 'def ' . s:method_name)
  call append('$', '  ' . s:method_body)
  call append('$', 'end')
  execute "normal! .d"
endfunction
