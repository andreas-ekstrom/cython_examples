from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext
from os import system

# compile the fortran modules without linking
fortran_mod_comp_1 = 'gfortran -O3 -cpp -ffree-form -c fortran_module.f90'
print(fortran_mod_comp_1)
system(fortran_mod_comp_1)
shared_obj_comp = 'gfortran fortran_cbinding.f90 -c -o fortran_cbinding.o -O3 -cpp -ffree-form -ffree-line-length-100'
print(shared_obj_comp)
system(shared_obj_comp)

ext_modules = [Extension(# module name:
    'my_fortran_routine',
    # source file:
    ['cython_source.pyx'],
    # other compile args for gcc
    extra_compile_args=['-fPIC', '-O3', '-Wno-cpp'],
    # other files to link to
    extra_link_args=['fortran_module.o', 'fortran_cbinding.o','-lgfortran'])]

setup(name = 'my_fortran_routine',
      cmdclass = {'build_ext': build_ext},
      ext_modules = ext_modules)


