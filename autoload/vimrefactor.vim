function s:set_data()
  let s:data = split(getline('.'), '=')
  let s:method_name = substitute(s:data[0], '^\s*', '', '')
  let s:method_name = substitute(s:method_name, '\s*$', '', '')
  let s:method_body = substitute(s:data[1], '^\s*', '', '')
endfunction

function s:set_indentation()
  let s:indentation_string = get(split(getline('.'), '\S'), 0)
  let s:indentation_string = substitute(s:indentation_string, '  ', '', '')
endfunction

function s:init()
  call s:set_data()
  call s:set_indentation()
endfunction

function s:delete_line()
  execute "normal! .d"
endfunction

function s:get_end_of_parent_method_line_number()
  return search("^" . s:indentation_string . "end")
endfunction

function s:do_append()
  let s:line_number = s:get_end_of_parent_method_line_number()
  call append(s:line_number, s:indentation_string . 'end')
  call append(s:line_number, s:indentation_string . '  ' . s:method_body)
  call append(s:line_number, s:indentation_string . 'def ' . s:method_name)
  call append(s:line_number, '')
endfunction

function vimrefactor#extract_method()
  call s:init()
  call s:delete_line()
  call s:do_append()
endfunction
