figure;
sgtitle("$x(t)=\cos(5\pi t)+\sin(10\pi t)$", "interpreter", "latex");

%% Continuous-Time Function

To = 0.001;
t_fine = 0:To:2;
xt = cos(5*pi*t_fine) + sin(10*pi*t_fine);

%% Discrete-Time Funciton

Ts = 0.1;
t_samples = 0:Ts:2;

% Generating the discrete-time function based on sampling interval
len = length(t_samples);
xn = zeros(len, 1);
for k = 1:len
	xn(k) = xt((k-1)*(Ts/To) + 1); % Scaling the range appropriately to get the correct sample
end

%% Plotting

subplot(2,2,1);
plot(t_fine, xt, "blue");   % Plotting x(t)
hold on;
stem(t_samples, xn, "red"); % Plotting x[n]
hold off;
grid on;
axis([0 2 -2.75 2.75]);

title("Original and Sampled Signal", "interpreter", "latex");
xlabel("$t$", "interpreter", "latex");
ylabel("$x(t)$", "interpreter", "latex");
legend("$x(t)$", "$x[n]$", "interpreter", "latex");

%% 3.2(a)

% Reconstruction using zero-order hold interpolation
xt_a = interp1(t_samples, xn, t_fine, 'previous');

subplot(2,2,2);
plot(t_fine, xt, "blue");   % Plotting x(t)
hold on;
stem(t_samples, xn, "red"); % Plotting x[n]
hold off;
grid on;
axis([0 2 -2.75 2.75]);

title("Zero-Order Hold Interpolation", "interpreter", "latex");
xlabel("$t$", "interpreter", "latex");
ylabel("$x(t)$", "interpreter", "latex");
legend("Interpolation", "Samples $x[n]$", "interpreter", "latex");

%% 3.2(b)

% Reconstruction using linear interpolation
xt_b = interp1(t_samples, xn, t_fine, 'linear');

subplot(2,2,3);
plot(t_fine, xt, "blue");   % Plotting x(t)
hold on;
stem(t_samples, xn, "red"); % Plotting x[n]
hold off;
grid on;
axis([0 2 -2.75 2.75]);

title("Linear Interpolation", "interpreter", "latex");
xlabel("$t$", "interpreter", "latex");
ylabel("$x(t)$", "interpreter", "latex");
legend("Interpolation", "Samples $x[n]$", "interpreter", "latex");

%% 3.2(c)

n = 0:2/Ts;

% Reconstruction using sinc interpolation
xt_c = sinc_recon(n, xn, Ts, t_fine);

subplot(2,2,4);
plot(t_fine, xt, "blue");   % Plotting x(t)
hold on;
stem(t_samples, xn, "red"); % Plotting x[n]
hold off;
grid on;
axis([0 2 -2.75 2.75]);

title("Sinc Interpolation", "interpreter", "latex");
xlabel("$t$", "interpreter", "latex");
ylabel("$x(t)$", "interpreter", "latex");
legend("Interpolation", "Samples $x[n]$", "interpreter", "latex");


%% Maximum Absolute Errors

left = 0.25/To;
right = 1.75/To;

% We traverse over the interval [left, right]
% if the kth absolute error is greater than the current max
% we make the current one the max 

mae_a = 0;
for k = left:right
	error = abs(xt(k)-xt_a(k));
	if error > mae_a
		mae_a = error;
	end
end
disp("MAE in Zero-Order Hold Interpolation");
disp(mae_a);

mae_b = 0;
for k = left:right
	error = abs(xt(k)-xt_b(k));
	if error > mae_b
		mae_b = error;
	end
end
disp("MAE in Linear Interpolation");
disp(mae_b);

mae_c = 0;
for k = left:right
	error = abs(xt(k)-xt_c(k));
	if error > mae_c
		mae_c = error;
	end
end
disp("MAE in Sinc Interpolation");
disp(mae_c);

%% Optional

% Reconstrcution using 'nearest' method
xt_op = interp1(t_samples, xn, t_fine, 'nearest');

figure;

plot(t_fine, xt_op, "blue"); % Plotting x(t)
hold on;
stem(t_samples, xn, "red");  % Plotting x[n]
hold off;
grid on;
axis([0 2 -2.75 2.75]);

title("$x(t)=\cos(5\pi t)+\sin(10\pi t)$","Nearest-Method Interpolation", "interpreter", "latex");
xlabel("$t$", "interpreter", "latex");
ylabel("$x(t)$", "interpreter", "latex");
legend("Nearest-Method Interpolation", "Samples", "interpreter", "latex");

% Maximum Absolute Error Calculation
mae_op = 0;
for k = left:right
	error = abs(xt(k)-xt_op(k));
	if error > mae_op
		mae_op = error;
	end
end
disp("-----Optional-----")
disp("MAE in Nearest-Method Interpolation");
disp(mae_op);

%% Observations
%{
	- Sinc-interpolation gives a reconstruction closest to the original signal while Zero-Order Hold gives the least similar.
	- Zero-Order Hold assumes the value of the signal to be the same sample until another sample arrives.
	- Linear Interpolation just connects the sampled values to each other through a straight line and thus is not very accurate with sinusoidal signals.
	- Sinc-Interpolation acts like as an ideal Low-Pass Filter and thus gives almost perfect reconstruction of the original signal.

	- Maximum Absolute Errors in interal [0.25, 1.75]
		1. Zero-Order Hold (a)      = 1.7061
		2. Linear Interpolation (b) = 1.2076
		3. Sinc Interpolation (c)   = 1.0334
	- We see that, a > b > c
	- So as expected, zero order hold has the highest error with sinc interpolation having the least and linear interpolation lying in between.
%}