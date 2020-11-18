
function [res] = test(x)
	 res = sin(2 * %pi * x);
endfunction

function [res] = explicite(n, m1, j, dt, dx, func)
	 // Init result
	 res = 0;

	 // Compute dx^2
	 dx2 = dx ** 2;

	 // Compute r
	 r = dt / dx2;

	 // Compute h
	 h = 1 / n;

	 if (m1 - 1 == 0)
	    res = func(j * h);
	    return
	 end

	 if (j == 0 || j == n)
	    res = 0;
	    return
	 end
	 
	 // Compute result
	 res = r * explicite(n, m1 - 1, j + 1, dt, dx, func) + (1 - 2 * r) * explicite(n, m1 - 1, j, dt, dx, func) + r * explicite(n, m1 - 1, j - 1, dt, dx, func);
endfunction