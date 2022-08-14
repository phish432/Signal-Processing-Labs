% This is the function that will calculate the partial Fourier sum from a
% given vector of Fourier series coefficients.

function y = partialfouriersum (A, T, tg)

	syms t;

	% Now here, we take the value of n based on the length of A.
	n = (length(A) - 1)/2;

	% Initializes 'y' to an array of zeroes the size of 'tg'
	y = zeros(size(tg));
	w0 = 2 * pi / T;

	% A simple 'for' loop that adds the next term to y, and reinitialises it to y.
	for k = -n:n
		y = y + (A(k + n + 1) * exp(1i*k*w0*tg));
	end

end
