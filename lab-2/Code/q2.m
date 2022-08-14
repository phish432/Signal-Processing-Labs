syms t;

%% Function Parameters
T = 2 * pi;
t1 = - T / 2;
t2 = T / 2;
tg = -2*T:0.01:2*T;
N = 10;
w0_FS = 1;

%% 2(b) Low-Pass Filter
%% wc = 2
xt = cos(t);

% Finding the fourier coefficients of x(t)
A = fourierCoeff(t, xt, T, t1, t2, N);

wc = 2;
B = myLPF(A, w0_FS, wc);

%% wc = 0.5
% xt = cos(t);
%
% % Finding the fourier coefficients of x(t)
% A = fourierCoeff(t, xt, T, t1, t2, N);
%
% wc = 0.5;
% B = myLPF(A, w0_FS, wc);

%% 2(c) High-Pass Filter
%% wc = 2
% xt = cos(t);
%
% % Finding the fourier coefficients of x(t)
% A = fourierCoeff(t, xt, T, t1, t2, N);
%
% wc = 2;
% B = myHPF(A, w0_FS, wc);

%% wc = 0.5
% xt = cos(t);
%
% % Finding the fourier coefficients of x(t)
% A = fourierCoeff(t, xt, T, t1, t2, N);
%
% % Low-Pass Filter
% wc = 0.5;
% B = myHPF(A, w0_FS, wc);

%% 2(d) Non-Ideal Filter
% xt = cos(t);
%
% % Finding the fourier coefficients of x(t)
% A = fourierCoeff(t, xt, T, t1, t2, N);
%
% G = 1;
% a = 1;
% B = NonIdeal(A, w0_FS, G, a);

%% 2(e)
% xt = sin(2*t) + cos(3*t);
%
% % Finding the fourier coefficients of x(t)
% A = fourierCoeff(t, xt, T, t1, t2, N);

%% Low Pass Filter
% wc = 2.5;
% B = myLPF(A, w0_FS, wc);

%% High Pass Filter
% wc = 2.5;
% B = myHPF(A, w0_FS, wc);

%% Non-Ideal Filter
% G = 1;
% a = 1;
% B = NonIdeal(A, w0_FS, G, a);

%% Reconstruction
yA = partialfouriersum(A, T, tg); % Reconstructing x(t) from A
yB = partialfouriersum(B, T, tg); % Reconstructing filtered signal y(t) from B

%% Plotting
figure;

subplot(2, 2, 1);
plot(tg, real(yA));
axis([-15 15 -2 2]);
grid on;
title("Real Part of Reconstruction of x(t)");
xlabel("$t$", "interpreter", "latex");
ylabel("$\Re(x(t))$", "interpreter", "latex");

subplot(2, 2, 2);
plot(tg, imag(yA));
axis([-15 15 -2 2]);
grid on;
title("Imaginary Part of Reconstruction of x(t)");
xlabel("$t$", "interpreter", "latex");
ylabel("$\Im(x(t))$", "interpreter", "latex");

subplot(2, 2, 3);
plot(tg, real(yB));
axis([-15 15 -2 2]);
grid on;
title("Real Part of y(t)");
xlabel("$t$", "interpreter", "latex");
ylabel("$\Re(y(t))$", "interpreter", "latex");

subplot(2, 2, 4);
plot(tg, imag(yB));
axis([-15 15 -2 2]);
grid on;
title("Imaginary Part of y(t)");
xlabel("$t$", "interpreter", "latex");
ylabel("$\Im(y(t))$", "interpreter", "latex");

%% Observations

%{
	Observations of LPF and HPF in the function files
%}

%{
	2(b) - We pass the signal through Low-Pass Filter

	Low-Pass Filter passes frequencies below cutoff frequency

	The original signal is cos(t) which has
	fourier series a_{-1} = a_{1} = 1, a_{i} = 0 (i != 1 or -1)
	So, it only has frequencies +1 and -1

	-> w_c = 2
		- Frequencies below 2 get passed.
		- So, +1 and -1 get passed and we get the original funcion itself.
	-> w_c = 0.5
		- Frequencies below 0.5 get passed.
		- But since the fourier series only has +1 and -1, both greater than 0.5,
		  so they do not get passed and we get 0.
%}

%{
	2(c) - We pass the signal through High-Pass Filter

	High-Pass Filter passes frequencies above cutoff frequency

	The original signal is cos(t) which has
	fourier series a_{-1} = a_{1} = 1, a_{i} = 0 (i != 1 or -1)
	So, it only has frequencies +1 and -1

	-> w_c = 2
		- Frequencies above 2 get passed.
		- But since the fourier series only has +1 and -1, both less than 2,
		  so they do not get passed and we get 0.
	-> w_c = 0.5
		- Frequencies above 0.5 get passed.
		- So, +1 and -1 get passed and we get the original funcion itself.
%}

%{
	2(e) - We set w0_FS = 1 and wc = 2.5

	Fourier coefficients in sin(2x) + cos(3x)
		[ ... , a[-4], a[-3] , a[-2] , a[-1] , a[0] , a[1] , a[2]  , a[3] , a[4] , ... ]
		[ ... ,  0   ,  1/2  ,-1/(2i),   0   ,  0   ,  0   , 1/(2i), 1/2  ,  0   , ... ]
	
	-> Low-Pass Filter
		- Frequencies below 2.5 will pass.
		- a[-2] and a[2] get passed => (1/(2i))(e^{2x}-e^{-2x}) = sin(2x)
		- We see that the low frequency sin-wave gets passed

	-> High-Pass Filter
		- Frequencies above 2.5 will pass.
		- a[-3] and a[3] get passed => (1/2)(e^{3x}+e^{-3x}) = cos(3x)
		- We see that the high frequency cos-wave gets passed

	-> Non-Ideal Filter : We see that the signal gets shrinked and slightly right-shifted
%}