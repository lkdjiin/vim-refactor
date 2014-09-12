class ExtractMethod

  def initialize
    @buffer = VIM::Buffer.current
    @line = @buffer.line
    @line_number = @buffer.line_number
    @indent = build_indent
    @end_of_parent_line_number = VIM.evaluate "search('^#{@indent}end')"
  end

  def execute
    name, body = @line.split('=')
    vim_puts('',
             "#{@indent}def #{name.strip}",
             "#{@indent}  #{body.strip}",
             "#{@indent}end")

    @buffer.delete(@line_number)

    VIM::message('Done!')
  end

  private

  # Get the indentation level of the method to extract.
  # To find out the desired indentation level, we simply have to look at
  # the previous ruby `def` method and take the leading spaces.
  #
  # Note:
  # - We are assuming that one level of indentation is two spaces.
  # - An indentation level is nothing more but a string full of spaces.
  #
  # Returns a String with 0 or more spaces.
  def build_indent
    line_number_for_def = VIM.evaluate 'search("\s*def", "bn")'
    @buffer[line_number_for_def].sub(/def.*$/, '')
  end

  def vim_puts(*lines)
    lines.reverse.each do |line|
      @buffer.append(@end_of_parent_line_number, line)
    end
  end

end
