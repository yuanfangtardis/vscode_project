!******************************************************************
module store_pathname_HS
!******************************************************************
 implicit none

 integer,parameter:: pathname_length= 73
 character(len=pathname_length),parameter :: pathname_HS= &
     &     "/home/yuanfang/Desktop/multinest_latest/Externals/HiggsSignals-2.1.0beta" // &
     &     "/"

end module store_pathname_HS
!******************************************************************
