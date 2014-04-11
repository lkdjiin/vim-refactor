Vim-refactor
===========

Installation
------------

    Bundle 'git@github.com:lkdjiin/vim-refactor.git'

Usage
-----

### Exposed function

    :ExtractMethod

### Example

``` ruby
class HelloWorld
  def initialize(name)
    @name = name
  end

  def greet
    greeting = "Hello #{@name}"
    puts greeting
  end
end
```

Position the cursor on `greeting = "Hello #{@name}"` and type `:ExtractMethod`
or whatever mapping you like (see next section) and this is what you get:

``` ruby
class HelloWorld
  def initialize(name)
    @name = name
  end

  def greet
    puts greeting
  end

  def greeting
    "Hello #{@name}"
  end
end
```

### Recommended Mapping

    <Leader>r

License
-------

MIT
