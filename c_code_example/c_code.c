#include <stdio.h>

int foobar(int* foo, int* bar) {

  int baz = *foo + *bar;
  
  printf("c: foobar %d\n",baz);

  return baz;

}

