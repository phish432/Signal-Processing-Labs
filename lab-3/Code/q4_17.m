figure;
sgtitle("Sinc Interpolation of $\cos(5\pi t)$ at Different Sampling Intervals", "interpreter", "latex");

%% Continuous-Time Function

To = 0.001;
t_fine = 0:To:2;
xt = cos(5*pi*t_fine);

%% 3.4(a) Ts = 0.1

Ts = 0.1;
t_samples = 0:Ts:2;

% Generating the discrete-time function based on sampling interval
n = length(t_samples);
xn = zeros(n, 1);
for k = 1:n
	xn(k) = xt((k-1)*(Ts/To) + 1);
end

% Reconstruction using Sinc Interpolation
n = 0:2/Ts;
xt_1 = sinc_recon(n, xn, Ts, t_fine);

% Plotting
subplot(2,2,1);
plot(t_fine, xt_1, "blue"); % Plotting x(t) reconstruction
hold on;
stem(t_samples, xn, "red"); % Plotting x[n]
hold off;
grid on;
axis([0 2 -2 2]);

title("$T_s=0.1$", "interpreter", "latex");
xlabel("$t$", "interpreter", "latex");
ylabel("$x(t)$", "interpreter", "latex");
legend("Interpolation", "Samples $x[n]$", "interpreter", "latex");

%% 3.4(b) Ts = 0.2

Ts = 0.2;
t_samples = 0:Ts:2;

% Generating the discrete-time function based on sampling interval
n = length(t_samples);
xn = zeros(n, 1);
for k = 1:n
	xn(k) = xt((k-1)*(Ts/To) + 1);
end

% Reconstruction using Sinc Interpolation
n = 0:2/Ts;
xt_1 = sinc_recon(n, xn, Ts, t_fine);

% Plotting
subplot(2,2,2);
plot(t_fine, xt_1, "blue"); % Plotting x(t) reconstruction
hold on;
stem(t_samples, xn, "red"); % Plotting x[n]
hold off;
grid on;
axis([0 2 -2 2]);

title("$T_s=0.2$", "interpreter", "latex");
xlabel("$t$", "interpreter", "latex");
ylabel("$x(t)$", "interpreter", "latex");
legend("Interpolation", "Samples $x[n]$", "interpreter", "latex");

%% 3.4(c) Ts = 0.3

Ts = 0.3;
t_samples = 0:Ts:2;

% Generating the discrete-time function based on sampling interval
n = length(t_samples);
xn = zeros(n, 1);
for k = 1:n
	xn(k) = xt((k-1)*(Ts/To) + 1);
end

% Reconstruction using Sinc Interpolation
n = 0:2/Ts;
xt_1 = sinc_recon(n, xn, Ts, t_fine);

% Plotting
subplot(2,2,3);
plot(t_fine, xt_1, "blue"); % Plotting x(t) reconstruction
hold on;
stem(t_samples, xn, "red"); % Plotting x[n]
hold off;
grid on;
axis([0 2 -2 2]);

title("$T_s=0.3$", "interpreter", "latex");
xlabel("$t$", "interpreter", "latex");
ylabel("$x(t)$", "interpreter", "latex");
legend("Interpolation", "Samples $x[n]$", "interpreter", "latex");

%% 3.4(d) Ts = 0.4

Ts = 0.4;
t_samples = 0:Ts:2;

% Generating the discrete-time function based on sampling interval
n = length(t_samples);
xn = zeros(n, 1);
for k = 1:n
	xn(k) = xt((k-1)*(Ts/To) + 1);
end

% Reconstruction using Sinc Interpolation
n = 0:2/Ts;
xt_1 = sinc_recon(n, xn, Ts, t_fine);

% Plotting
subplot(2,2,4);
plot(t_fine, xt_1, "blue"); % Plotting x(t) reconstruction
hold on;
stem(t_samples, xn, "red"); % Plotting x[n]
hold off;
grid on;
axis([0 2 -2 2]);

title("$T_s=0.4$", "interpreter", "latex");
xlabel("$t$", "interpreter", "latex");
ylabel("$x(t)$", "interpreter", "latex");
legend("Interpolation", "Samples $x[n]$", "interpreter", "latex");

%% Observation
%{
	Nyquist rate of a band-limited signal is defined as twice the maximum frequency of the original signal.

	Since cos(w0 * t) <---FT---> pi * [del(w - w0) + del(w + w0)]
	Therefore cos(w0 * t) has a Nyquist rate of 2 * w0.

	For a prefect reconstruction it is required that w_s > 2*w_max <===> Sampling rate should be more than the Nyquist rate.
	In terms of sampling interval T_s, 2*pi/T_s > w_nyquist => T_s < 2*pi/(nyquist_rate).

	In our case, we have cos(5 * pi * t) which will have a Nyquist rate of 10*pi.

	So, for T_s < (2 * pi) / (10 * pi) ==> T_s < 0.2.

	We expect reconstructions with sampling intervals below 0.2 to be close to original signal but anything aboove 0.3 should give us bad reconstructions.

	As we can see,
	- T_s is 0.1 and 0.2 ---> we get good approximations since we are taking more samples.
	- T_s is 0.3 and 0.4 ---> we start taking samples at the peaks which results in a sinusoidal wave with very low amplitude passing through the peaks.
%}