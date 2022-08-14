% Non-Ideal Filter
function B = NonIdeal(A, w0_FS, G, a)
	N = (length(A) - 1)/2;
	B = zeros((2 * N + 1), 1);

	% Uses H(w) = G / (a + jw) as frequency respose
	for k = -N : N
		B(N + k + 1) = A(N + k + 1) * (G / (a + (1j * k * w0_FS));
	end
end