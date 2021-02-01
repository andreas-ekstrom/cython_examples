module chp_interface
  use iso_c_binding, only: c_double, c_int
  use angmom
  implicit none
contains
  
  subroutine c_precalculate_binomials() bind(c)
    call precalculate_binomials
  end subroutine c_precalculate_binomials
  
  subroutine c_cleb(j1, m1, j2, m2, j, m, cg) bind(c)
    integer(c_int), intent(in) :: j1,m1,j2,m2,j,m
    real(c_double), intent(inout) :: cg
    cg = cleb(j1,m1,j2,m2,j,m)
  end subroutine c_cleb
end module chp_interface
