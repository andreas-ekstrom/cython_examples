cdef extern from "cbinding_headers.h":
    void bind_my_subroutine(int* foo, int* bar, int* baz);

def my_fortran_call_from_python(int ham, int eggs):
    cdef int spam

    bind_my_subroutine(&ham, &eggs, &spam)

    return spam

