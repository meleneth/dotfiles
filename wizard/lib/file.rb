require 'fileutils'

class WizardFile
  attr_accessor :filename, :body

  def initialize
    @body = []
    @filename = ""
  end

  def initialize(filename)
    initialize
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
  def initialize 
    super
    @includes  = []
    @classes   = []
    @functions = []
  end

  def as_text
    return <<EOT
#{ @includes.join("\n") }

#{ @functions.join("\n") }

EOT
  end
end

class WizardMakefile < WizardFile
  attr_accessor :key_order, :key_values

  def intialize()
    super
    @filename = "Makefile.am"

    @key_order = []
    @key_values = {}
  end

  def as_text
    return @key_order.map {|k| "#{k} = #{@key_values[k]}"}.join("\n\n\n")
  end

end
