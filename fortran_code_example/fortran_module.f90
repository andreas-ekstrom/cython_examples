module my_fortran_module

  implicit none

contains

  subroutine foobar(foo, bar, baz)

    integer, intent(in) :: foo, bar
    integer, intent(inout) :: baz

    baz = foo + bar

    write(6,*) 'fortran: foobar ', baz
    
  end subroutine foobar
  
end module my_fortran_module
