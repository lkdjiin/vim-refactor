ruby load File.join(VIM::evaluate("expand('<sfile>:p:h')"),'extract_method.rb')

function! vimrefactor#extract_method()
  ruby <<EOF
  ExtractMethod.new.execute
EOF
endfunction
