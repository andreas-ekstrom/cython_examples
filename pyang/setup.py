from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext
# This line only needed if building with NumPy in Cython file.
from numpy import get_include
from os import system

# compile the fortran modules without linking
fortran_mod_comp_1 = 'gfortran -O3 -fdefault-real-8 -fdefault-double-8 -cpp -ffree-form -ffree-line-length-1000 -c constants.f90'
print(fortran_mod_comp_1)
system(fortran_mod_comp_1)
fortran_mod_comp_2 = 'gfortran -O3 -fPIC -fdefault-real-8 -fdefault-double-8 -cpp -ffree-form -ffree-line-length-1000 -c angmom.f90'
print(fortran_mod_comp_2)
system(fortran_mod_comp_2)
shared_obj_comp = 'gfortran pyang.f90 -c -o pyang.o -O3 -fdefault-real-8 -fdefault-double-8 -cpp -ffree-form -ffree-line-length-100'
print(shared_obj_comp)
system(shared_obj_comp)

ext_modules = [Extension(# module name:
                         'pyang',
                         # source file:
                         ['pyang.pyx'],
                         # other compile args for gcc
                         extra_compile_args=['-fPIC', '-O3', '-Wno-cpp'],
                         # other files to link to
                         extra_link_args=['constants.o', 'angmom.o', 'pyang.o','-lgfortran'])]

setup(name = 'pyang',
      cmdclass = {'build_ext': build_ext},
      # Needed if building with NumPy.
      # This includes the NumPy headers when compiling.
      include_dirs = [get_include()],
      ext_modules = ext_modules)
