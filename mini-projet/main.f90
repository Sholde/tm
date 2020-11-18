
! Calcul Euler Explicite
function euler_explicite(n)

  real :: euler_explicite
  real :: n
  
  euler_explicite = (1 - (1 / n)) ** n
  return
  
end function euler_explicite

! Calcul Euler Implicite
function euler_implicite(n)

  real :: euler_implicite
  real :: n
  
  euler_implicite = 1 / ((1 + (1 / n)) ** n)
  return
  
end function euler_implicite

! Calcul numerique
function numerique(n)

  real :: numerique
  real :: n
  
  numerique = ( (2 - (1 / n)) / (2 + (1 / n)) ) ** n
  return
  
end function numerique

program main

  implicit none
  real :: euler_explicite
  real :: euler_implicite
  real :: numerique
  real :: n1, n2
  real :: ee1, ei1, num1
  real :: ee2, ei2, num2
  real :: dee, dei, dnum

  ! Display choice
  print *, "Choose n1 :"
  read (*, *) n1
  print *, "Choose n2 :"
  read (*, *) n2

  ! Compute scheme with n2
  ee1 = euler_explicite(n1)
  ei1 = euler_implicite(n1)
  num1 = numerique(n1)

  ! Display result of scheme with n1
  print *, ""
  print *, "Avec n = " , n1
  print *, "euler explicite : ", ee1
  print *, "euler implicite : ", ei1
  print *, "numerique       : ", num1

  ! Compute scheme with n2
  ee2 = euler_explicite(n2)
  ei2 = euler_implicite(n2)
  num2 = numerique(n2)

  ! Display result of scheme with n2
  print *, ""
  print *, "Avec n = " , n2
  print *, "euler explicite : ", ee2
  print *, "euler implicite : ", ei2
  print *, "numerique       : ", num2

  ! Compute delta
  dee = abs(ee1 - ee2)
  dei = abs(ei1 - ei2)
  dnum = abs(num1 - num2)

  ! Display delta
  print *, ""
  print *, "Delta :"
  print *, "delta euler explicite : ", dei
  print *, "delta euler implicite : ", dee
  print *, "delta numerique       : ", dnum

end program main
