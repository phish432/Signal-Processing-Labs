function xr = sinc_recon(n, xn, Ts, t_fine)
% n - the integer locations of the samples x[n]
% xn - the sampled signal x[n] = x(n*Ts)
% Ts - the sampling interval
% t_fine - the time-grid for reconstruction of xr
% xr - the reconstructed signal over the time-grid t_fine

ws = 2*pi/Ts;
wc = ws/2;

len_t = length(t_fine);
len_s = length(n);

xr = zeros(1, len_t);

for t = 1:len_t
	% For every time instant 't'
	% We calculate the sinc-interpolation over all samples
	% And add it to the running sum
	% xr(t) = xr(t) + Ts * x(n*Ts) * (wc/pi) * sinc(wc*(t-n*Ts)/pi)
	for s = 1:len_s
		xr(t) = xr(t) + Ts*xn(s)*(wc/pi)*sinc(wc*(t_fine(t)-n(s)*Ts)/pi);
	end
end

end