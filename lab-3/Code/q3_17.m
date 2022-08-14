figure;
sgtitle("Sinc Interpolation of Triangular Pulse at Different Sampling Intervals", "interpreter", "latex");

%% Continuous-Time Function

To = 0.001;
t_fine = -10:To:10;
xt = 1-abs(t_fine);

%% 3.3(a) Ts = 0.5

Ts = 0.5;
t_samples = -1:Ts:1;

% Generating the discrete-time function based on sampling interval
len = length(t_samples);
xn = zeros(len, 1);
for k = 1:len
    xn(k) = xt((k-1)*(Ts/To) + 1); % Scaling the range appropriately to get the correct sample
end

% Reconstruction using Sinc Interpolation
n = -1/Ts:1/Ts;
xt_1 = sinc_recon(n, xn, Ts, t_fine);

% Plotting
subplot(2,2,1);
plot(t_fine, xt_1, "blue"); % Plotting x(t) reconstruction
hold on;
stem(t_samples, xn, "red"); % Plotting x[n]
hold off;
grid on;

title("$T_s=0.5$", "interpreter", "latex");
xlabel("$t$", "interpreter", "latex");
ylabel("$x(t)$", "interpreter", "latex");
legend("Sinc Interpolation", "Samples $x[n]$", "interpreter", "latex");

%% 3.3(b) Ts = 0.2

Ts = 0.2;
t_samples = -1:Ts:1;

% Generating the discrete-time function based on sampling interval
len = length(t_samples);
xn = zeros(len, 1);
for k = 1:len
    xn(k) = xt((k-1)*(Ts/To) + 1); % Scaling the range appropriately to get the correct sample
end

% Reconstruction using Sinc Interpolation
n = -1/Ts:1/Ts;
xt_1 = sinc_recon(n, xn, Ts, t_fine);

% Plotting
subplot(2,2,2);
plot(t_fine, xt_1, "blue"); % Plotting x(t) reconstruction
hold on;
stem(t_samples, xn, "red"); % Plotting x[n]
hold off;
grid on;

title("$T_s=0.2$", "interpreter", "latex");
xlabel("$t$", "interpreter", "latex");
ylabel("$x(t)$", "interpreter", "latex");
legend("Sinc Interpolation", "Samples $x[n]$", "interpreter", "latex");

%% 3.3(c) Ts = 0.1

Ts = 0.1;
t_samples = -1:Ts:1;

% Generating the discrete-time function based on sampling interval
len = length(t_samples);
xn = zeros(len, 1);
for k = 1:len
    xn(k) = xt((k-1)*(Ts/To) + 1); % Scaling the range appropriately to get the correct sample
end

% Reconstruction using Sinc Interpolation
n = -1/Ts:1/Ts;
xt_1 = sinc_recon(n, xn, Ts, t_fine);

% Plotting
subplot(2,2,3);
plot(t_fine, xt_1, "blue"); % Plotting x(t) reconstruction
hold on;
stem(t_samples, xn, "red"); % Plotting x[n]
hold off;
grid on;

title("$T_s=0.1$", "interpreter", "latex");
xlabel("$t$", "interpreter", "latex");
ylabel("$x(t)$", "interpreter", "latex");
legend("Sinc Interpolation", "Samples $x[n]$", "interpreter", "latex");

%% 3.3(d) Ts = 0.05

Ts = 0.05;
t_samples = -1:Ts:1;

% Generating the discrete-time function based on sampling interval
len = length(t_samples);
xn = zeros(len, 1);
for k = 1:len
    xn(k) = xt((k-1)*(Ts/To) + 1); % Scaling the range appropriately to get the correct sample
end

% Reconstruction using Sinc Interpolation
n = -1/Ts:1/Ts;
xt_1 = sinc_recon(n, xn, Ts, t_fine);

% Plotting
subplot(2,2,4);
plot(t_fine, xt_1, "blue"); % Plotting x(t) reconstruction
hold on;
stem(t_samples, xn, "red"); % Plotting x[n]
hold off;
grid on;

title("$T_s=0.05$", "interpreter", "latex");
xlabel("$t$", "interpreter", "latex");
ylabel("$x(t)$", "interpreter", "latex");
legend("Sinc Interpolation", "Samples $x[n]$", "interpreter", "latex");

%% Observations
%{ 
    We observe that-
    1.) When the sampling interval is decreased, we see that the error
    between the original and the reconstructed graphs decreases, i.e. the
    reconstructed graph represents the original more closely as we decrease
    the sampling interval to 0. This is because reducing the sample
    interval basically brings us closer to continuous sampling, which is
    the perfect reconstruction.

    2.) We also see that since the highest frequency in a non band-limited
    signal is infinity, the sampling interval closest to 0 gives us the
    best reconstruction of the original.
%}