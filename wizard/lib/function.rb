require 'fileutils'

class WizardFunction
  attr_accessor :functionname, :body
  attr_accessor :return_type, :arguments
  attr_accessor :wizardclass

  def initialize(return_type, functionname, arguments)
    @body = []
    @functionname = functionname
    @return_type = return_type
    @arguments = arguments
    @wizardclass = nil
  end

  def as_body
  return <<HERE
#{@return_type ? @return_type + ' ' : ''}#{@wizardclass ? @wizardclass.classname + '::' : ''}#{@functionname}(#{@arguments})
{
#{ @body.join("\n") }
}

HERE
  end

  def as_header
    return "#{@return_value} #{@functionname}(#{@arguments});"
  end
end

