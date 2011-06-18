require 'fileutils'

class WizardFile
  attr_accessor :filename, :body

  def initialize(filename)
    @body = []
    @filename = filename
  end
end

