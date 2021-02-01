cdef extern from "headers.h":
    int foobar(int* foo, int* bar);

def my_c_call_from_python(int ham, int eggs):
    cdef int spam

    spam = foobar(&ham, &eggs)

    return spam

