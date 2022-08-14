function xn = SineSum(A, F, P, td, fs)
	N = length(A);
	t = 0:1/fs:td;
	xn = zeros(size(t));
	for k = 1:N
		xn = xn + A(k)*sin(2*pi*F(k)*t+P(k));
	end
end