
// Solution exacte
function [res] = sol_exacte(x)

res = exp(- x)

endfunction

// Calcul Euler Explicite
function [res] = euler_explicite(n)

res = (1 - (1 / n)) ** n

endfunction

// Calcul Euler Implicite
function [res] = euler_implicite(n)

res = 1 / ((1 + (1 / n)) ** n)

endfunction

// Calcul numerique
function [res] = numerique(n)

res = ( (2 - (1 / n)) / (2 + (1 / n)) ) ** n

endfunction

// Main function
function main()

// Display exact solution
sol = sol_exacte(1)
printf("Solution exacte à t = 1 : %lf\n", sol)

n = 100

// Compute scheme with n
ee = euler_explicite(n)
ei = euler_implicite(n)
num = numerique(n)

// Display result of scheme with n
printf("\n")
printf("Avec n = %d\n" , n)
printf("euler explicite : %lf\n", ee)
printf("euler implicite : %lf\n", ei)
printf("numerique       : %lf\n", num)

// Compute delta
dee = abs(ee - sol)
dei = abs(ei - sol)
dnum = abs(num - sol)

// Display delta
printf("\n")
printf("Delta :\n")
printf("delta euler explicite : %lf\n", dee)
printf("delta euler implicite : %lf\n", dei)
printf("delta numerique       : %lf\n", dnum)

endfunction
