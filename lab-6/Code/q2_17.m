td = 1;
fs = 10000;

%% Q2(a)
% N=5, f0=50, phase=0

N = 5;
f0 = 50;
A = [1:N].^(-1); % a_k = 1/k
P = zeros(1,N);

% calculate the N-harmonics of f0 and play them
x1n = harmonics(A, f0, P, td, fs);
soundsc(x1n);
pause(2.25);

%% Q2(b)
% N=5, f0=50, phase=0

N = 5;
f0 = 50;
A = [1:N].^(-2); % a_k = 1/k^2
P = zeros(1,N);

% calculate the N-harmonics of f0 and play them
x2n = harmonics(A, f0, P, td, fs);
soundsc(x2n);
pause(2.25);

%% Q2(c)

% for-loop to choose N
for N = [10, 15]
	% for-loop to choose f0
	for f0 = [100, 150, 200]
		% for-loop to choose a_k between 1/k and 1/k^2
		for pow = [-1, -2]
			A = [1:N].^(pow);
			P = zeros(N, 1);

			% calculate the N-harmonics of f0 and play them
			x3n = harmonics(A, f0, P, td, fs);
			soundsc(x3n);
			pause(2.25);
		end
	end
end

%% Q2(d)
% N=5, f0=50, phase=0
N = 5;
f0 = 50;
P = zeros(1,N);

A1 = sin((pi/N).*[1:N]); % a_k = sin((pi/N)*k)
A2 = cos((pi/N).*[1:N]); % a_k = cos((pi/N)*k)
A3 = [1:N];              % a_k = k

% calculate the N-harmonics of f0 using A1 and play them
x4n = harmonics(A1, f0, P, td, fs);
soundsc(x4n);
pause(2.25);
% calculate the N-harmonics of f0 using A2 and play them
x4n = harmonics(A2, f0, P, td, fs);
soundsc(x4n);
pause(2.25);
% calculate the N-harmonics of f0 using A3 and play them
x4n = harmonics(A3, f0, P, td, fs);
soundsc(x4n);
pause(2.25);

%% Q2(e)
% N=10, f0=50, phase=0

N = 10;
f0 = 50;
P = zeros(1,N);

A1 = [1:N].^(-1);        % a_k = 1/k
A2 = [1:N].^(-2);        % a_k = 1/k^2
A3 = sin((pi/N).*[1:N]); % a_k = sin((pi/N)*k)
A4 = cos((pi/N).*[1:N]); % a_k = cos((pi/N)*k)
A5 = [1:N];              % a_k = k

figure;
sgtitle("$N=10$, $f_0=50$ Hz, Phase = $0$", "interpreter", "latex");

subplot(5,1,1);
% calculate the N-harmonics of f0 using A1
x5n = harmonics(A1, f0, P, td, fs);
plot(x5n(1:500));
xlabel("$n$", "interpreter", "latex");
ylabel("$x[n]$", "interpreter", "latex");
title("$a_k=\frac{1}{k}$", "interpreter", "latex");
grid on;

subplot(5,1,2);
% calculate the N-harmonics of f0 using A2
x5n = harmonics(A2, f0, P, td, fs);
plot(x5n(1:500));
xlabel("$n$", "interpreter", "latex");
ylabel("$x[n]$", "interpreter", "latex");
title("$a_k=\frac{1}{k^2}$", "interpreter", "latex");
grid on;

subplot(5,1,3);
% calculate the N-harmonics of f0 using A3
x5n = harmonics(A3, f0, P, td, fs);
plot(x5n(1:500));
xlabel("$n$", "interpreter", "latex");
ylabel("$x[n]$", "interpreter", "latex");
title("$a_k=\sin(\frac{k\pi}{N})$", "interpreter", "latex");
grid on;

subplot(5,1,4);
% calculate the N-harmonics of f0 using A4
x5n = harmonics(A4, f0, P, td, fs);
plot(x5n(1:500));
xlabel("$n$", "interpreter", "latex");
ylabel("$x[n]$", "interpreter", "latex");
title("$a_k=\cos(\frac{k\pi}{N})$", "interpreter", "latex");
grid on;

subplot(5,1,5);
% calculate the N-harmonics of f0 using A5
x5n = harmonics(A5, f0, P, td, fs);
plot(x5n(1:500));
xlabel("$n$", "interpreter", "latex");
ylabel("$x[n]$", "interpreter", "latex");
title("$a_k=k$", "interpreter", "latex");
grid on;

%% Observations

%{
	Q2(d)
	- All signals have the same period since they have the same undamental
	period.
	- Their shapes differ becasue their amplitudes differ in harmonics.
	- For a_k = 1/k^2 and a_k = 1/k, amplitude of higher
	harmonics become less and hence lower harmonics dominate. This is
	opposite in case of a_k = k.
%}