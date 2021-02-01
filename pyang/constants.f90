MODULE constants
  
  IMPLICIT NONE
  
  ! kinds
  !
  INTEGER, PARAMETER, PUBLIC :: dp  = KIND(1.0D0)
  INTEGER, PARAMETER, PUBLIC :: maxjj = 140
  REAL(DP), PUBLIC :: binom(0:maxjj,0:maxjj)
  
END MODULE constants
