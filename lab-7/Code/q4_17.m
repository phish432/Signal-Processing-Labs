%% Q4

%% We will use p(t) = cos(2pi.f0.t) with f0 = 12 Hz

f0 = 12;
fs = 64;

N = 64; % Should be of form 2^m
L = 16;

ts = 0:1/fs:(N-1)/fs;

pn = cos(2*pi*f0*ts);           % Given sampled sequence
wn = [ones(1,L), zeros(1,N-L)]; % Window function
xn = pn.*wn;

%% Calculating the FFTs

yn_fft = fft(xn);         % In-built function
yn_r2fft = radix2fft(xn); % radix2fft function

%% Calculating Error

diff = yn_fft - yn_r2fft;
avg_error = sum(abs(diff))/length(diff);
fprintf("Average Error = %f\n", avg_error);

%% Plotting the FFTs

figure;
sgtitle("Magnitude of FFT of windowed $cos(2\pi f_0t)$", "interpreter", "latex");

xaxis = (2*pi/N)*(0:N-1);

% In-built
subplot(2,1,1);
stem(xaxis, abs(yn_fft), 'LineWidth', 1);
grid on;
xlim([0 2*pi]);
ylim([min(abs(yn_fft))-1 max(abs(yn_fft))+1]);
title("Using In-built fft Function");
xlabel("Frequency $\omega$", "interpreter", "latex");
ylabel("$|X[k]|$", "interpreter", "latex");

% radix2fft
subplot(2,1,2);
stem(xaxis, abs(yn_r2fft), 'LineWidth', 1);
grid on;
xlim([0 2*pi]);
ylim([min(abs(yn_r2fft))-1 max(abs(yn_r2fft))+1]);
title("Using radix2fft Function");
xlabel("Frequency $\omega$", "interpreter", "latex");
ylabel("$|X[k]|$", "interpreter", "latex");

%% Observations

%{
	The DFT matrix for N = 2
	Twiddle factor wn = e^{-j(2*pi/2)} = e^{-j*pi} = -1
	So,
	    | wn^0 wn^0 |   | 1  1 |
	F = |           | = |      |
	    | wn^0 wn^1 |   | 1 -1 |

	Also, since the average error between in-built fft
	and radix2fft is 0.00. Therefore, verified.
%}