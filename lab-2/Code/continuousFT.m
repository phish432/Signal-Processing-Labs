% Function to calculate the continuous fourier transform of x(t)
function X = continuousFT(xt, t, a, b, w)

	% f is the integrand
	f = xt * exp(-1j * w * t);

	% Calculates the continuous time fourier tranform
	X = int(f, t, a, b);

end