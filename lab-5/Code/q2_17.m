%% Q2(c)

n = 0:1000;
w0 = pi/200;

s = 5*sin(w0*n);    % Original signal
v = randn(size(n)); % Gaussian noise
x = s + v;          % Final Signal

figure;
sgtitle("Moving Average Filter", "interpreter", "latex");

subplot(2,2,1);
plot(s);
hold on;
plot(x);
hold off;
xlim([0 length(x)]);
ylim([-11 11]);
grid on;
title("Original Signal and Noisy Signal", "interpreter", "latex");
xlabel("$n$", "interpreter", "latex");
ylabel("$s[n]$ and $x[n]$", "interpreter", "latex");
legend("$s[n]$ Original Signal", "$x[n]$ Noisy Signal", "interpreter", "latex");

%% Q2(d)

% for loop to plot y[t] for different values of M
M = [5, 21, 51];
for k = 1:3
	% Impulse response of Moving Average Filter
	% defined as a rectangular pulse
	% with base M
	% magnitude 1/M
	MAF = (1/M(k)) * ones(size(1:M(k)));
	y = conv(x, MAF, "full"); % Convolution of x[n] with impulse response of MAF

	subplot(2,2,k+1);
	plot(s);
	hold on;
	plot(y);
	hold off;
	xlim([0 length(y)]);
	ylim([-11 11]);
	grid on;
	title("Original Signal and Filtered Signal", "$M=$ " + M(k), "interpreter", "latex");
	xlabel("$n$", "interpreter", "latex");
	ylabel("$s[n]$ and $y[n]$", "interpreter", "latex");
	legend("$s[n]$ Original Signal", "$y[n]$ Noisy Signal", "interpreter", "latex");
end

%% Q2(f)

w = -10:0.01:10;
X = DT_Fourier(x, 1, w);

figure;
sgtitle("DTFT Magnitude Spectrums", "interpreter", "latex");

subplot(2,2,1);
plot(w, abs(X));
grid on;
title("DTFT Magnitude Spectrum of Noisy Signal x[n]", "interpreter", "latex");
xlabel("$\omega$", "interpreter", "latex");
ylabel("$|X(\omega)|$", "interpreter", "latex");

% for loop to plot DTFT magnitude spectrum for different M
M = [5, 21, 51];
for k = 1:3
	% Impulse response of Moving Average Filter
	% defined as a rectangular pulse
	% with base M
	% magnitude 1/M
	MAF = (1/M(k)) * ones(size(1:M(k)));
	y = conv(x, MAF, "full"); % Convolution of x[n] with impulse response of MAF

	Y = DT_Fourier(y, 1, w); % Calculating DTFT of y[n]

	subplot(2,2,k+1);
	plot(w, abs(Y));
	grid on;
	title("DTFT Magnitude Spectrum of Filtered Signal y[n]", "$M=$ " + M(k), "interpreter", "latex");
	xlabel("$\omega$", "interpreter", "latex");
	ylabel("$|Y(\omega)|$", "interpreter", "latex");
end

%% Q2(g)

figure;
sgtitle("Digital Differentiator Filter", "interpreter", "latex");

subplot(2,1,1);
plot(s);
hold on;
plot(x);
hold off;
xlim([0 length(x)]);
ylim([-11 11]);
grid on;
title("Original Signal and Noisy Signal", "interpreter", "latex");
xlabel("$n$", "interpreter", "latex");
ylabel("$s[n]$ and $x[n]$", "interpreter", "latex");
legend("$s[n]$ Original Signal", "$x[n]$ Noisy Signal", "interpreter", "latex");

% Impulse response of digital differentiator filter
% defined as a positive and a negative impulse
% of magnitude 1 and separated by 1 sample
DDiff = [1, -1];
y = conv(x, DDiff, "full"); % Convolution of x[n] with impulse response of DDiff

subplot(2,1,2);
plot(s);
hold on;
plot(y);
hold off;
xlim([0 length(y)]);
ylim([-11 11]);
grid on;
title("Original Signal and Filtered Signal", "interpreter", "latex");
xlabel("$n$", "interpreter", "latex");
ylabel("$s[n]$ and $y[n]$", "interpreter", "latex");
legend("$s[n]$ Original Signal", "$y[n]$ Filtered Signal", "interpreter", "latex");

w = -10:0.01:10;
X = DT_Fourier(x, 1, w);

figure;
sgtitle("DTFT Magnitude Spectrums", "interpreter", "latex");

subplot(2,1,1);
plot(w, abs(X));
grid on;
title("DTFT Magnitude Spectrum of Noisy Signal x[n]", "$M=$ " + M(k), "interpreter", "latex");
xlabel("$\omega$", "interpreter", "latex");
ylabel("$|X(\omega)|$", "interpreter", "latex");


% Impulse response of digital differentiator filter
% defined as a positive and a negative impulse
% of magnitude 1 and separated by 1 sample
DDiff = [1, -1];
y = conv(x, DDiff, "full"); % Convolution of x[n] with impulse response of DDiff

Y = DT_Fourier(y, 1, w); % Calculating DTFT of y[n]

subplot(2,1,2);
plot(w, abs(Y));
grid on;
title("DTFT Magnitude Spectrum of Filtered Signal y[n]", "$M=$ " + M(k), "interpreter", "latex");
xlabel("$\omega$", "interpreter", "latex");
ylabel("$|Y(\omega)|$", "interpreter", "latex");

%% Observations and Answers

%{
	Q2(a)

	The impulse response of the Moving Average Filter is
	discrete rectangular pulse with base M and magnitude 1/M
			 _
			| 1/M : |n| <= M/2
	h[n]  =	|
			|_ 0  : |n| > M/2
%}

%{
	Q2(e)

	As M is increased, we see that the error in the filtered
	signal becomes smaller and smaller and we get a better
	approximation of the original signal.

	The Moving Average Filter also causes a sample delay in
	the filtered signal as compared to the original signal.
	This increases as M increases.

	So, as M increases we get a better approximation of the
	original signal but this at the cost of delayed filtered
	signal.
%}

%{
	Q2(f)

	Expected plot :
	Two impulse responses at +pi/200 and -pi/200
	Final plot is sum of such impulse responses shifted by
	multiples 2*pi.

	Observed plot :
	We see 2 two impluses at +0.02 and -0.02 ~= pi/200 = 0.0157
	and these impulses repeat at +2*pi and -2*pi.

	As M gets larger, the noise in the DTFT also gets lowered.
%}

%{
	Q2(g)

	Since, the differentiator filter is independent of M, we only plot once.

	(a) The impulse response of the Digital Differentiator Filter
		is a negative and a positive impulse of magnitude 1 with
		separatation of 1 sample.
		h[n] = del(n) - del(n-1)

	(d) The filtered signal is the high frequency noise.

	(f) We observe that for lower frequencies the magnitude is small and
		for higher frequencies the magnitude is larger.
		This is because
		- for lower frequencies, the slope is smaller on average
		and thus the magnitude of DTFT is smaller.
		- for higher frequencies, the slope changes rapidly to give
		larger slope values and thus greatere magnitude in DTFT.
%}

%{
	Q2(h)

	Moving Average Filter has an sinc frequency response which
	acts as a non-ideal low-pass filter.

	Digital Differentiator acts as a high pass filter since
	for lower frequencies the magnitude is small and
	for higher frequencies the magnitude is larger.
%}