require 'fileutils'

class WizardProject
  attr_accessor :project_name, :files, :classes

  def initialize(project_name)
    @project_name = project_name
    @files = []
    @classes = []
  end

  def generate
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
AC_CONFIG_MACRO_DIR([m4])
AC_OUTPUT

HERE

    File.open('configure.ac', 'w') {|f| f.write(configure_ac_contents) }
    system('git add configure.ac')

    makefile_am_contents = <<HERE
bin_PROGRAMS = src/#{project_name}
src_#{project_name}_SOURCES = src/#{project_name}.cpp

ACLOCAL_AMFLAGS = -I m4
HERE

#{class_files.map {|x| "#{x}.cpp #{x}.hpp"}.join(' ')}

    File.open('Makefile.am', 'w') {|f| f.write(makefile_am_contents) }
    system('git add Makefile.am')

    system('autoreconf --install')
    system('./configure')
    system('make')
    FileUtils.cd("..")
  end
end

