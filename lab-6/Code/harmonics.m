function xn = harmonics(A, f0, P, td, fs)
	N = length(A); % Number of harmonics
	F = f0 * (1:N); % Getting the N harmonics of f0
	xn = SineSum(A, F, P, td, fs); % Summing the sin waves of f0*k
end