require 'fileutils'

class WizardProject
  attr_accessor :project_name, :files, :classes, :makefile

  def initialize(project_name)
    @project_name = project_name
    @files = []
    @classes = []
    @makefile = nil
  end

  def generate
    FileUtils.mkdir(project_name)
    FileUtils.cd(project_name)
    system('git init')

    FileUtils.mkdir('src')
    FileUtils.mkdir('bin')
    FileUtils.mkdir('m4')

    FileUtils.touch('bin/.empty')
    system('git add bin/.empty')
    FileUtils.touch('m4/.empty')
    system('git add m4/.empty')

    configure_ac_contents = <<HERE
AC_INIT([#{project_name}], [1.0], [your_email@example.org])
AM_INIT_AUTOMAKE([foreign -Wall -Werror subdir-objects])
AC_PROG_CXX
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_FILES([Makefile])
AC_CONFIG_MACRO_DIR([m4])
AC_OUTPUT

HERE

    File.open('configure.ac', 'w') {|f| f.write(configure_ac_contents) }
    system('git add configure.ac')

    @files.each do |f| 
      f.save_file
      system("git add #{f.filename}")
    end

    system("git commit -a -m \"initial import of #{project_name}\"")

#{class_files.map {|x| "#{x}.cpp #{x}.hpp"}.join(' ')}

    system('autoreconf --install')
    system('./configure')
    system('make')
    FileUtils.cd("..")
  end
end

