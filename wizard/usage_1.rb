require 'fileutils'

class Wizard
end

class Wizard::Project
  attr_accessor :project_name, :files, :classes

  def initialize(project_name)
    @project_name = project_name
    @files = []
    @classes = []
  end
end

class Wizard::File
  attr_accessor :filename, :body

  def initialize(filename)
    @body = []
    @filename = filename
  end
end

class Wizard::Class
  attr_accessor :classname, :body

  def initialize(classname)
    @body = []
    @classname = classname
  end
end

class Wizard::Function
  attr_accessor :functionname, :body
  attr_accessor :return_value, :arguments

  def initialize(return_value, functionname, arguments)
    @body = []
    @functionname = functionname
    @return_value = return_value
    @arguments = arguments
  end
end

def create_project(project_name)
  project = Wizard::Project.new(project_name)

  project_class = Wizard::Class.new(project_name)

  project.classes << project_class

  main_file = Wizard::File.new "src/#{project_name}.cpp"

  project.files << main_file

  main = Wizard::Function.new('int', 'main', 'int argc, char *argv[]')

  main.body << "cout << \"#{ project_name }\""
  main.body << "return 0;"

  main_file.body << main

  makefile_am = Wizard::File.new "Makefile.am"

#makefile_am.body << <<HERE
#this is a multi line text field
#so I can type long strings
#HERE

  FileUtils.mkdir(project_name)
  FileUtils.cd(project_name)
  system('git init')

  FileUtils.mkdir('src')
  FileUtils.mkdir('m4')

  configure_ac_contents = <<HERE
AC_INIT([#{project_name}], [1.0], [your_email@example.org])
AM_INIT_AUTOMAKE([foreign -Wall -Werror])
AC_PROG_CXX
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_FILES([Makefile])
AC_OUTPUT

HERE

  File.open('configure.ac', 'w') {|f| f.write(configure_ac_contents) }
  system('git add configure.ac')

  makefile_am_contents = <<HERE
bin_PROGRAMS = src/#{project_name}
#{project_name}_SOURCES = src/#{project_name}.cpp 
HERE

#{class_files.map {|x| "#{x}.cpp #{x}.hpp"}.join(' ')}

  File.open('Makefile.am', 'w') {|f| f.write(makefile_am_contents) }
  system('git add Makefile.am')

  system('autoreconf --install')
  system('./configure')
  system('make')
  FileUtils.cd("..")

end

create_project('guinea')

