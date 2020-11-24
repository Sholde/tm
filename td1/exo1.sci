// Exercice 1

// Analytique
function [res] = a_numerique(x)
	 res = sin(2 * %pi * x);
endfunction

// Numerique
function [res] = a_analytique(x, t)
	 res = exp(- 4 * (%pi ** 2) * t) * a_analytique(x);
endfunction

// Euler explicite
function [res] = explicite(n, dt, dx, func)
	 // Init U_0
	 U_0 = zeros(n);

	 for j = 1:n
	     U_0(j) = func(j * dx);
	 end

	 // Compute delta x square
	 dx2 = dx^2;

	 // Compute delta
	 delta = dt / dx2;

	 // Init I
	 I = zeros(n, n);
	 for i = 1:n
	     for j = 1:n
	     	 if (i == j)
		    I(i, j) = 1;
		 end
	     end
	 end

	 // Init B
	 B = zeros(n, n);
	 for i = 1:n
	     for j = 1:n
	     	 if (i == j)
		    B(i, j) = -2;
		 end
		 if (i == j - 1 || i == j + 1)
		    B(i, j) = 1;
		 end
	     end
	 end

	 // Init U_m
	 U_m = zeros(n);

	 // Compute
	 for i = 1:n
	     for j = 1:n
	     	 U_m(j) = U_m(j) + (I(i, j) + delta * B(i, j))^(n) * U_0(j);
	     end
	 end

	 // Result
	 res = U_m(n/2);
	 
endfunction