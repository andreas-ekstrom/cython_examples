#
# python setup.py build_ext --inplace
#
from numpy import empty
from numpy cimport ndarray as ar

cdef extern from "pyang.h":
    void c_precalculate_binomials();
    void c_cleb(int* j1, int* m1, int* j2, int* m2, int* j, int* m, double* cg);

def precalculate_binomials():
    c_precalculate_binomials()
    return None
    
def cleb(int j1, int m1, int j2, int m2, int j, int m):
    cdef double cg
    
    c_cleb(&j1, &m1, &j2, &m2, &j, &m, &cg)
    
    return cg
