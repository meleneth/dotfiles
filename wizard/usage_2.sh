# new project, 2 executables (guinea, guineat)
wizard project guinea guineat
cd guinea/src

#  make some classes.  First word after class is magic, if it is the name of an executable or
# library it is linked with that file.  Otherwise, links to the first program. 
wizard class shape 
wizard class triangle:shape
wizard class rectangle:shape

# convert build to library based.  First argument is new library name, after that are class names.
# at the end are a list of targets that will link with the new library.
# if the individual file used to be in the list for a given target, it will be removed and
# the library will be added to that executable.
wizard library geometry shape triangle rectangle guinea guineat


