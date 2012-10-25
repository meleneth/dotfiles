require 'fileutils'

class WizardFile
  attr_accessor :filename, :body

  def initialize(filename)
    @body     = Array.new
    @filename = filename
  end

  def as_text
    return body.join("\n")
  end

  def save_file
    return if @filename == ""

    if File.exists? @filename then
      puts "Aborting: file #{ @filename } already exists"
    end

    File.open(@filename, 'w') {|f| f.write(as_text) }
  end
end

class WizardSourceFile < WizardFile
  attr_accessor :includes, :classes, :functions

  def initialize(filename)
    super(filename)
    @includes  = Array.new
    @classes   = Array.new
    @functions = Array.new
  end

  def as_text
    return <<EOT
#{ @includes.join("\n") }

#{ @functions.map {|x| x.as_body}.join("\n") }

EOT
  end
end

class WizardMakefile < WizardFile
  attr_accessor :key_order, :key_values

  def initialize(filename)
    super(filename)

    @key_order  = Array.new
    @key_values = Hash.new
  end

  def as_text
    return @key_order.map {|k| "#{k} = #{@key_values[k]}"}.join("\n\n\n")
  end

end
