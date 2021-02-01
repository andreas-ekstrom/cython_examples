module my_cbinding_to_fortran

  use iso_c_binding
  use my_fortran_module

  implicit none

contains

  ! glue the fortran routine to c via an explicit API
  subroutine bind_my_subroutine(foo, bar, baz) bind(c)

    integer(c_int), intent(inout) :: foo, bar, baz

    call foobar(foo, bar, baz)

  end subroutine bind_my_subroutine
  
end module my_cbinding_to_fortran
  
