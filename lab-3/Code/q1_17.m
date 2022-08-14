%% Continuous-Time Function

To = 0.001;
t_fine = 0:To:2;
xt = cos(5*pi*t_fine) + sin(10*pi*t_fine);

%% Discrete-Time Function

Ts = 0.1;
t_samples = 0:Ts:2;

% Generating the discrete-time function based on given sampling interval
n = length(t_samples);
xn = zeros(n, 1);
for k = 1:n
	xn(k) = xt((k-1)*(Ts/To) + 1);
end

%% Plotting both the original and sampled graphs

plot(t_fine, xt, "blue");
hold on;
stem(t_samples, xn, "red");
hold off;
grid on;
axis([0 2 -2.75 2.75]);

% Labelling the graph
title("Original vs Sampled", "interpreter", "latex");
xlabel("$t$", "interpreter", "latex");
ylabel("$x(t)$", "interpreter", "latex");
legend("$x(t)$", "$x[n]$", "interpreter", "latex");