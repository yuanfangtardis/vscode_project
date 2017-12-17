!******************************************************************
module store_pathname
!******************************************************************
 implicit none

 integer,parameter:: pathname_length= 72
 character(len=pathname_length),parameter :: pathname= &
     &     "/home/yuanfang/Desktop/multinest_latest/Externals/HiggsBounds-5.1.1beta" // &
     &     "/"

end module store_pathname
!******************************************************************
