%% Q3

%% Part (a)

% Defining given variables
L = 4;
N = [4, 16, 64];


for i = 1:3

	% Finding DFT using FFT technique
	x1 = [ones(L, 1); zeros(N(i)-L,1)];
	y1 = fft(x1);

	% Plotting the given graphs
	figure;

	xaxis = (2*pi/N(i))*(0:N(i)-1);

	subplot(3, 1, 1);
	stem(1:N(i), x1, 'LineWidth', 1);
	grid on;
	xlim([1 N(i)]);
	title("Samples");
	ylabel("$x[n]$", "interpreter", "latex");
	xlabel("$n$", "interpreter", "latex");

	subplot(3, 1, 2);
	stem(xaxis, abs(y1), 'LineWidth', 1);
	grid on;
	xlim([0 2*pi]);
	title("Magnitude");
	ylabel("$|X[k]|$", "interpreter", "latex");
	xlabel("Frequency $\omega$", "interpreter", "latex");

	subplot(3, 1, 3);
	stem(xaxis, angle(y1), 'LineWidth', 1);
	grid on;
	xlim([0 2*pi]);
	title("Phase");
	ylabel("$\angle{X[k]}$", "interpreter", "latex");
	xlabel("Frequency $\omega$", "interpreter", "latex");

	sgtitle("$L=4,N=$ " + N(i), "interpreter", "latex");
end

%% Part (b)

% Defining given variables
N = 20;
w0 = (3*pi)/10;
n = 1:N;

% Finding DFT using FFT technique
x2 = sin(w0*n);
y2 = fft(x2, 20);

% Plotting the given graphs
figure;

xaxis = (2*pi/N)*(0:N-1);

subplot(3, 1, 1);
stem(1:N, x2, 'LineWidth', 1);
grid on;
xlim([1 N]);
title("Samples");
ylabel("$x[n]$", "interpreter", "latex");
xlabel("$n$", "interpreter", "latex");

subplot(3, 1, 2);
stem(xaxis, abs(y2), 'LineWidth', 1);
grid on;
xlim([0 2*pi]);
title("Magnitude");
ylabel("$|X[k]|$", "interpreter", "latex");
xlabel("Frequency $\omega$", "interpreter", "latex");

subplot(3, 1, 3);
stem(xaxis, angle(y2), 'LineWidth', 1);
grid on;
xlim([0 2*pi]);
title("Phase");
ylabel("$\angle{X[k]}$", "interpreter", "latex");
xlabel("Frequency $\omega$", "interpreter", "latex");

sgtitle("$sin(\omega_0 \cdot n)$", "interpreter", "latex");

%% Part (c)

% Defining given variables
N = 20;
w0 = (3*pi)/10;
n = 1:N;

% Finding DFT using FFT technique
x3 = cos(w0*n);
y3 = fft(x3, 20);

% Plotting the given graphs
figure;

xaxis = (2*pi/N)*(0:N-1);

subplot(3, 1, 1);
stem(1:N, x3, 'LineWidth', 1);
grid on;
xlim([1 N]);
title("Samples");
ylabel("$x[n]$", "interpreter", "latex");
xlabel("$n$", "interpreter", "latex");

subplot(3, 1, 2);
stem(xaxis, abs(y3), 'LineWidth', 1);
grid on;
xlim([0 2*pi]);
title("Magnitude");
ylabel("$|X[k]|$", "interpreter", "latex");
xlabel("Frequency $\omega$", "interpreter", "latex");

subplot(3, 1, 3);
stem(xaxis, angle(y3), 'LineWidth', 1);
grid on;
xlim([0 2*pi]);
title("Phase");
ylabel("$\angle{X[k]}$", "interpreter", "latex");
xlabel("Frequency $\omega$", "interpreter", "latex");

sgtitle("$cos(\omega_0 \cdot n)$", "interpreter", "latex");

%% Part (d)

% Defining given variables
N = 20;
w0 = (3*pi)/10;
n = 1:N;

% Finding DFT using FFT technique
x4 = sin(w0*(n-1));
y4 = fft(x4, 20);

% Plotting the given graphs
figure;

xaxis = (2*pi/N)*(0:N-1);

subplot(3, 1, 1);
stem(1:N, x4, 'LineWidth', 1);
grid on;
xlim([1 N]);
title("Samples");
ylabel("$x[n]$", "interpreter", "latex");
xlabel("$n$", "interpreter", "latex");

subplot(3, 1, 2);
stem(xaxis, abs(y4), 'LineWidth', 1);
grid on;
xlim([0 2*pi]);
title("Magnitude");
ylabel("$|X[k]|$", "interpreter", "latex");
xlabel("Frequency $\omega$", "interpreter", "latex");

subplot(3, 1, 3);
stem(xaxis, angle(y4), 'LineWidth', 1);
grid on;
xlim([0 2*pi]);
title("Phase");
ylabel("$\angle{X[k]}$", "interpreter", "latex");
xlabel("Frequency $\omega$", "interpreter", "latex");

sgtitle("$sin(\omega_0 \cdot (n-1))$", "interpreter", "latex");

%% Part (e)

% Defining given variables
N = 20;
n = 1:N;

% Finding DFT using FFT technique
x5 = (0.8).^(n);
y5 = fft(x5, 20);

% Plotting the given graphs
figure;

xaxis = (2*pi/N)*(0:N-1);

subplot(3, 1, 1);
stem(1:N, x5, 'LineWidth', 1);
grid on;
xlim([1 N]);
title("Samples");
ylabel("$x[n]$", "interpreter", "latex");
xlabel("$n$", "interpreter", "latex");

subplot(3, 1, 2);
stem(xaxis, abs(y5), 'LineWidth', 1);
grid on;
xlim([0 2*pi]);
title("Magnitude");
ylabel("$|X[k]|$", "interpreter", "latex");
xlabel("Frequency $\omega$", "interpreter", "latex");

subplot(3, 1, 3);
stem(xaxis, angle(y5), 'LineWidth', 1);
grid on;
xlim([0 2*pi]);
title("Phase");
ylabel("$\angle{X[k]}$", "interpreter", "latex");
xlabel("Frequency $\omega$", "interpreter", "latex");

sgtitle("$(0.8)^n$", "interpreter", "latex");

%% Part (f)

% Defining given variables
N = 20;
n = 1:N;

% Finding DFT using FFT technique
x6 = (-0.8).^(n);
y6 = fft(x6, 20);

% Plotting the given graphs
figure;

xaxis = (2*pi/N)*(0:N-1);

subplot(3, 1, 1);
stem(1:N, x6, 'LineWidth', 1);
grid on;
xlim([1 N]);
title("Samples");
ylabel("$x[n]$", "interpreter", "latex");
xlabel("$n$", "interpreter", "latex");

subplot(3, 1, 2);
stem(xaxis, abs(y6), 'LineWidth', 1);
grid on;
xlim([0 2*pi]);
title("Magnitude");
ylabel("$|X[k]|$", "interpreter", "latex");
xlabel("Frequency $\omega$", "interpreter", "latex");

subplot(3, 1, 3);
stem(xaxis, angle(y6), 'LineWidth', 1);
grid on;
xlim([0 2*pi]);
title("Phase");
ylabel("$\angle{X[k]}$", "interpreter", "latex");
xlabel("Frequency $\omega$", "interpreter", "latex");

sgtitle("$(-0.8)^n$", "interpreter", "latex");

%% Observations

%{

    Yes we can identify high frequencies and low frequencies by checking the magnitude near 0 and pi 
    if we scale --> 0:N-1 to [0,2pi] high frequencies and low frequencies by checking the magnitude near 0 and pi
    
    If the magnitude is high near 0 and low near pi, then it is low frequency, and
    If the magnitude is low near 0 and high near pi, then it is high frequency.

    The frequencies are identified as below-
    
    1) Low
    2) Low
    3) Low
    4) Low
    5) Low
    6) Low
    7) Low
    8) High

%}
