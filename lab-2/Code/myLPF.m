% Low-Pass Filter
function B = myLPF(A, w0_FS, wc)

	N = (size(A, 1) - 1)/2;
	B = zeros(2 * N + 1, 1);

	for k = -N : N
		% If the frequency is greater than cutoff
		% it does not pass
		if abs(k * w0_FS) > wc
			B (N + k + 1) = 0;
		else
			B(N + k + 1) = A(N + k + 1);
		end
	end

end