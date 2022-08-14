function X = radix2fft(x)
	N = length(x); % Assumed to be of form 2^m

	wn = exp(-1j*2*pi/N); % Twiddle Factor

	if N == 2 % Base case N=2
		GE = x(1);
		GO = x(2);
		X = [GE + GO, GE - GO];
	else      % Otherwise
		XE = x(1:2:N);     % Even samples
		XO = x(2:2:N);     % Odd samples
		W = wn.^(0:N/2-1); % Powers of Twiddle Factor

		GE = radix2fft(XE);
		GO = radix2fft(XO);

		X = [GE + W.*GO, GE - W.*GO];
	end
end