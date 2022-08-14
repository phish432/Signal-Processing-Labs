%% Defining the required variables
fs = 10000;
N = 5;
f0 = 50;
A = [1:N].^(-2);
P = zeros(1,N);

% Assigning the attack, decay, sustain level, sustain duration, and release
% values
a = 0.2;
d = 0.2;
s = 0.7;
sd = 0.4;
r = 0.2;

% Assigning the time duration as sume of the above values
td = a + d + sd + r;

% Assigning the corresponding piece of time vector and envelope
[t_env, env] = envelope(a, d, s, sd, r, fs);
xn = harmonics(A, f0, P, td, fs);
xne = xn.*env;

soundsc(xn, fs);
pause(td + 1);

soundsc(xne, fs);
pause(td + 1);

%% Plotting the given graphs
figure;

subplot(3,1,1);
plot(xn);
xlim([0 td*fs]);
title("Original Signal $x[n]$", "interpreter", "latex");
xlabel("$n$", "interpreter", "latex");
ylabel("$x[n]$", "interpreter", "latex");
grid on;

subplot(3,1,2);
plot(env);
xlim([0 td*fs]);
title("Envelope ADSR", "interpreter", "latex");
xlabel("$n$", "interpreter", "latex");
ylabel("env$[n]$", "interpreter", "latex");
grid on;

subplot(3,1,3);
plot(xne);
xlim([0 td*fs]);
title("Signal multiplied with envelope", "interpreter", "latex");
xlabel("$n$", "interpreter", "latex");
ylabel("$x[n]\cdot$ env$[n]$", "interpreter", "latex");
grid on;