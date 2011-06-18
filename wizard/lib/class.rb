class WizardClass
  attr_accessor :classname, :methods

  def initialize(classname)
    @methods = []
    @classname = classname

    add_method WizardFunction.new(nil, classname, '')
    add_method WizardFunction.new(nil, "~#{classname}", '')
  end

  def add_method(method)
    @methods << method
    method.wizardclass = self
  end

  def as_body
    return <<HERE
#include "#{@classname.downcase}.hpp"

#{@methods.collect {|x| x.as_body}.join("\n")}
HERE
  end

  def as_header
    return <<HERE
#ifndef INC_GUARD_#{@classname.upcase}
#define INC_GUARD_#{@classname.upcase} 1

class #{@classname} {
#{ @methods.collect {|x| ' ' + x.as_header}.join("\n") }
}

#endif
HERE
  end
end

