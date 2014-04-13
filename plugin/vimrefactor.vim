if exists('g:loaded_vimrefactor') || &cp || v:version < 700
  finish
endif
let g:loaded_vimrefactor = 1

command! ExtractMethod call vimrefactor#extract_method()
