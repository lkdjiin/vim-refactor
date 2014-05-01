Vim-refactor
===========

Easily extract a local variable assignment into a method in your Ruby code!

Installation
------------

With Vundle:

    Bundle 'git@github.com:lkdjiin/vim-refactor.git'

Usage
-----

### Exposed function

    :ExtractMethod

### Example

``` ruby
class HelloWorld

  def greet
    greeting = "Hello World!"
    puts greeting
  end

end
```

Position the cursor on `greeting = "Hello World!"` and type `:ExtractMethod`
or whatever mapping you like (see next section) and this is what you get:

``` ruby
class HelloWorld

  def greet
    puts greeting
  end

  def greeting
    "Hello World!"
  end
end
```

### Recommended Mapping

You should map the `ExtractMethod` function to ease its use. Here is an
example of such a mapping:

    map <Leader>r :ExtractMethod<Enter>

License
-------

Copyright 2014, Xavier Nayrac and Victor Mours.

Distributed under the [MIT License](http://opensource.org/licenses/MIT).
