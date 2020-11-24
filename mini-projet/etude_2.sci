// Exercice 2

// Exact solution
function [res] = exact(x)

	res = 1 / (x + 1);
	
endfunction

// Euler explicite
function [res] = euler_explicite(n)

	// Stop recursion
	if (n == 0)
	    res = 1;
	    return
	end

	// Compute delta t
	delta_t = 1 / n;

	// Recursion
	res = euler_explicite(n-1) * (1 - delta_t * euler_explicite(n-1));

endfunction

// Euler implicite
function [res] = euler_implicite(n)

	// Stop recursion
	if (n == 0)
	    res = 1;
	    return
	end

	// Compute delta t
	delta_t = 1 / n;

	// Recursion
	res = ( sqrt(4 * delta_t * euler_implicite(n-1)) - 1 ) / ( 2 * delta_t );

endfunction

// Main
function main()

	// Compute exact solution
	sol = exact(1);

	// 
	n = [1:10];

	ee = zeros(10);
	ei = zeros(10);

	for i = n
	    j = i;
	    ee(j) = norm(sol - euler_explicite(i)) / norm(sol);
	    ei(j) = norm(sol - euler_implicite(i)) / norm(sol);
	end

	xdata = [1, 1/2, 1/3, 1/4, 1/5, 1/6, 1/7, 1/8, 1/9, 1/10];

	xtitle("Euler Explicite", "pas", "erreur");
	plot(xdata, ee);
	xs2png(0, "img/etude_2_ee.png");
	clf();

	xtitle("Euler Implicite", "pas", "erreur");
	plot(xdata, ei);
	xs2png(0, "img/etude_2_ei.png");
	clf();

endfunction

