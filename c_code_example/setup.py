from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext
from os import system

# compile the c code without linking
shared_obj_comp = 'gcc c_code.c -c -o c_code.o -O3'
print(shared_obj_comp)
system(shared_obj_comp)

ext_modules = [Extension(# module name:
    'my_c_routine',
    # source file:
    ['cython_source.pyx'],
    # other compile args for gcc
    extra_compile_args=['-fPIC', '-O3', '-Wno-cpp'],
    # other files to link to
    extra_link_args=['c_code.o'])]

setup(name = 'my_c_routine',
      cmdclass = {'build_ext': build_ext},
      ext_modules = ext_modules)


