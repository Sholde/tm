
// Solution exacte
function [res] = sol_exacte(x)

res = exp(- x);

endfunction

// Calcul Euler Explicite
function [res] = euler_explicite(n)

res = (1 - (1 / n))^n;

endfunction

// Calcul Euler Implicite
function [res] = euler_implicite(n)

res = 1 / ((1 + (1 / n))^n);

endfunction

// Calcul numerique
function [res] = numerique(n)

res = ( (2 - (1 / n)) / (2 + (1 / n)) )^n;

endfunction

// Main function
function main()

// Compute exact solution
sol = sol_exacte(1);

// 
n = [100:100:1000];

ee = zeros(10);
ei = zeros(10);
num = zeros(10);

for i = n
    j = i / 100;
    ee(j) = abs(sol - euler_explicite(i));
    ei(j) = abs(sol - euler_implicite(i));
    num(j) = abs(sol - numerique(i));	
end

xdata = [1/100, 1/200, 1/300, 1/400, 1/500, 1/600, 1/700, 1/800, 1/900, 1/1000];

xtitle("Euler Explicite", "pas", "erreur");
plot(xdata, ee);
xs2png(0, "img/etude_1_ee.png");
clf();

xtitle("Euler Implicite", "pas", "erreur");
plot(xdata, ei);
xs2png(0, "img/etude_1_ei.png");
clf();

xtitle("Numerique", "pas", "erreur");
plot(xdata, num);
xs2png(0, "img/etude_1_num.png");
clf();

endfunction
