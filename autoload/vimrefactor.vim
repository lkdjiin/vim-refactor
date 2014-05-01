function s:init()
  call s:set_data()
  call s:set_indentation()
endfunction

function s:set_data()
  let l:data = split(getline('.'), '=')
  let s:method_name = substitute(l:data[0], '^\s*', '', '')
  let s:method_name = substitute(s:method_name, '\s*$', '', '')
  let s:method_body = substitute(l:data[1], '^\s*', '', '')
endfunction

" What we want here is to set the indentation level of the method to
" extract.
" To find out the desired indentation level, we simply have to look at
" the previous ruby `def` method and take the leading spaces.
" Note:
" - We are assuming that one level of indentation is two spaces.
" - An indentation level is nothing more but a string full of spaces.
function s:set_indentation()
  let l:line_number_for_def = search('^\s*def', 'bn')
  let l:line_for_def = getline(l:line_number_for_def)
  let s:indentation_string = substitute(l:line_for_def, 'def.*$', '', '')
endfunction

function s:delete_line()
  execute "normal! dd"
endfunction

function s:do_append()
  let l:line_number = s:get_end_of_parent_method_line_number()
  call append(l:line_number, s:indentation_string . 'end')
  call append(l:line_number, s:indentation_string . '  ' . s:method_body)
  call append(l:line_number, s:indentation_string . 'def ' . s:method_name)
  call append(l:line_number, '')
endfunction

function s:get_end_of_parent_method_line_number()
  return search("^" . s:indentation_string . "end")
endfunction

function vimrefactor#extract_method()
  call s:init()
  call s:delete_line()
  call s:do_append()
endfunction
