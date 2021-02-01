MODULE angmom

  use constants
  
  IMPLICIT NONE

CONTAINS

  SUBROUTINE precalculate_binomials
  
    INTEGER :: i,j
    
    DO i = 0, maxjj
       DO j = 0, i
          binom(i,j) = fbinom(i,j)
       END DO
    END DO
    
  END SUBROUTINE precalculate_binomials

  ! calculates a clebsch-gordan coefficient < j1/2 m1/2 j2/2 m2/2 | j/2 m/2 >
  ! arguments are integer and twice the true value.
  FUNCTION cleb (j1, m1, j2, m2, j, m)
    INTEGER, INTENT(IN) :: j1, m1, j2, m2, j, m
    INTEGER             :: par, z, zmin, zmax
    REAL(DP)            :: cleb, factor, sum
        
    ! some checks for validity (let's just return zero for bogus arguments)  
    IF (2*(j1/2)-INT(2*(j1/2.0)) /= 2*(ABS(m1)/2)-int(2*(ABS(m1)/2.0)) .OR. &
         2*(j2/2)-INT(2*(j2/2.0)) /= 2*(ABS(m2)/2)-int(2*(ABS(m2)/2.0)) .OR. &
         2*(j/2)-INT(2*(j/2.0)) /= 2*(ABS(m)/2)-int(2*(ABS(m)/2.0)) .OR. &
         j1<0 .OR. j2<0 .or. j<0 .OR. ABS(m1)>j1 .OR. ABS(m2)>j2 .OR.&
         ABS(m)>j .or. j1+j2<j .OR. ABS(j1-j2)>j .OR. m1+m2/=m) THEN
       cleb= 0.0_dp
       
    ELSE
       factor = 0.0_dp
       factor = binom(j1,(j1+j2-j)/2) / binom((j1+j2+j+2)/2,(j1+j2-j)/2)
       factor = factor * binom(j2,(j1+j2-j)/2) / binom(j1,(j1-m1)/2)
       factor = factor / binom(j2,(j2-m2)/2) / binom(j,(j-m)/2)
       factor = SQRT(factor)
       
       zmin = MAX(0,j2+(j1-m1)/2-(j1+j2+j)/2,j1+(j2+m2)/2-(j1+j2+j)/2)
       zmax = MIN((j1+j2-j)/2,(j1-m1)/2,(j2+m2)/2)
       
       sum=0.0_dp
       DO z = zmin,zmax
          par=1
          IF (2*(z/2)-INT(2*(z/2.0)) /= 0) par=-1
          sum=sum+par*binom((j1+j2-j)/2,z)*binom((j1-j2+j)/2,(j1-m1)/2-z)*&
               binom((-j1+j2+j)/2,(j2+m2)/2-z)
       ENDDO
       
       cleb = factor*sum

    ENDIF
  END FUNCTION cleb
  
  RECURSIVE FUNCTION fbinom(n,r) RESULT(res)
    INTEGER, INTENT(IN)  :: n,r
    REAL(DP)             :: res
    IF (n==r .OR. r==0) THEN
       res = 1.0_dp
    ELSEIF (r==1) THEN
       res = REAL(n,dp)
    ELSE
       res = REAL(n,dp) / REAL(n-r,dp) * fbinom(n-1,r)
    ENDIF
  END FUNCTION fbinom
  
END MODULE angmom

