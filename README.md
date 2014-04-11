Vim-refactor
===========

Easily extract a local variable assignment into a method in your Ruby code!

Installation
------------

In your .vimrc

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

    <Leader>r

License
-------

MIT
