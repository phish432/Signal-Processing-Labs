%% Q1

%% Part A

N = 51;
nc = (N-1)/2;
n = 0:N-1;

hd = (1/6)*sinc((1/6)*(n-nc));

w_rect = ones(1,N);  % Rectangular window
h_rect = hd.*w_rect; % Get the windowed signal

%% Part B

% Get frequency response
[H, w] = freqz(h_rect, 1, 1001);

% Plot the filter coefficients and frequency response
figure;
sgtitle("Q1(B) Using Rectangular Window");

subplot(3,1,1);
stem(0:length(h_rect)-1, h_rect, "filled", "MarkerSize", 4);
grid on;
xlim([0 length(h_rect)-1]);
title("\bf{Filter Coefficients}", "interpreter", "latex");
xlabel("$n$", "interpreter", "latex");
ylabel("$h[n]$", "interpreter", "latex");

subplot(3,1,2);
plot(w, 20*log10(abs(H)/max(abs(H))));
grid on;
xlim([0 w(length(w))]);
ylim([-170 10]);
title("\bf{Magnitude}", "interpreter", "latex");
xlabel("$n$", "interpreter", "latex");
ylabel("$|H(e^{j\omega})|$ in dB", "interpreter", "latex");

subplot(3,1,3);
plot(w, angle(H));
grid on;
xlim([0 w(length(w))]);
title("\bf{Phase}", "interpreter", "latex");
xlabel("$n$", "interpreter", "latex");
ylabel("$\angle{H(e^{j\omega})}$", "interpreter", "latex");

%% Part C

N = 51;
nc = (N-1)/2;
n = 0:N-1;

hd = (1/6)*sinc((1/6)*(n-nc));

w_blkm = blackman(N).'; % Blackman window
h_blkm = hd.*w_blkm;    % Get the windowed signal

% Get frequency response
[H, w] = freqz(h_blkm, 1, 1001);

% Plot the filter coefficients and frequency response
figure;
sgtitle("Q1(C) Using Blackman Window");

subplot(3,1,1);
stem(0:length(h_blkm)-1, h_blkm, "filled", "MarkerSize", 4);
grid on;
xlim([0 length(h_blkm)-1]);
title("\bf{Filter Coefficients}", "interpreter", "latex");
xlabel("$n$", "interpreter", "latex");
ylabel("$h[n]$", "interpreter", "latex");

subplot(3,1,2);
plot(w, 20*log10(abs(H)/max(abs(H))));
grid on;
xlim([0 w(length(w))]);
ylim([-170 10]);
title("\bf{Magnitude}", "interpreter", "latex");
xlabel("$n$", "interpreter", "latex");
ylabel("$|H(e^{j\omega})|$ in dB", "interpreter", "latex");

subplot(3,1,3);
plot(w, angle(H));
grid on;
xlim([0 w(length(w))]);
title("\bf{Phase}", "interpreter", "latex");
xlabel("$n$", "interpreter", "latex");
ylabel("$\angle{H(e^{j\omega})}$", "interpreter", "latex");

%% Part E

n = 0:200;

% Pass x1 through the two filters
x1 = cos(pi*n/16) + 0.25*sin(pi*n/2);
y1_rect = conv(x1, h_rect);
y1_blkm = conv(x1, h_blkm);

% Pass x2 through the two filters
x2 = cos(pi*n/16) + 0.25*randn(1,201);
y2_rect = conv(x2, h_rect);
y2_blkm = conv(x2, h_blkm);

% Plotting filtered x1
figure;
sgtitle("$x[n]=\cos(\frac{\pi n}{16})+0.25\sin(\frac{\pi n}{2})$", "interpreter", "latex");

subplot(2,1,1);
stem(n, x1, "filled", "MarkerSize", 4);
hold on;
stem(0:length(y1_rect)-1, y1_rect, "filled", "MarkerSize", 4);
hold off;
grid on;
xlim([0 length(y1_rect)-1]);
title("\bf{Filter - Rectangular Window}", "interpreter", "latex");
xlabel("$n$", "interpreter", "latex");
ylabel("Signal value", "interpreter", "latex");
legend("Original Signal", "Filtered Signal");

subplot(2,1,2);
stem(n, x1, "filled", "MarkerSize", 4);
hold on;
stem(0:length(y1_blkm)-1, y1_blkm, "filled", "MarkerSize", 4);
hold off;
grid on;
xlim([0 length(y1_blkm)-1]);
title("\bf{Filter - Blackman Window}", "interpreter", "latex");
xlabel("$n$", "interpreter", "latex");
ylabel("Signal value", "interpreter", "latex");
legend("Original Signal", "Filtered Signal");

% Plotting filtered x2
figure;
sgtitle("$x[n]=\cos(\frac{\pi n}{16})+0.25\cdot\textmd{randn}(1,201)$", "interpreter", "latex");

subplot(2,1,1);
stem(n, x2, "filled", "MarkerSize", 4);
hold on;
stem(0:length(y2_rect)-1, y2_rect, "filled", "MarkerSize", 4);
hold off;
grid on;
xlim([0 length(y2_rect)-1]);
title("\bf{Filter - Rectangular Window}", "interpreter", "latex");
xlabel("$n$", "interpreter", "latex");
ylabel("Signal value", "interpreter", "latex");
legend("Original Signal", "Filtered Signal");

subplot(2,1,2);
stem(n, x2, "filled", "MarkerSize", 4);
hold on;
stem(0:length(y2_blkm)-1, y2_blkm, "filled", "MarkerSize", 4);
hold off;
grid on;
xlim([0 length(y2_blkm)-1]);
title("\bf{Filter - Blackman Window}", "interpreter", "latex");
xlabel("$n$", "interpreter", "latex");
ylabel("Signal value", "interpreter", "latex");
legend("Original Signal", "Filtered Signal");

%% Part F

n = 0:50;
h1_rect = ((-1).^n).*h_rect; % Defining the new filter

% Get frequency response
[H, w] = freqz(h1_rect, 1, 1001);

% Plot the filter coefficients and frequency response
figure;
sgtitle("Using Rectangular Window");

subplot(3,1,1);
stem(0:length(h1_rect)-1, h1_rect, "filled", "MarkerSize", 4);
grid on;
xlim([0 length(h1_rect)-1]);
title("\bf{Filter Coefficients}", "interpreter", "latex");
xlabel("$n$", "interpreter", "latex");
ylabel("$h[n]$", "interpreter", "latex");

subplot(3,1,2);
plot(w, 20*log10(abs(H)/max(abs(H))));
grid on;
xlim([0 w(length(w))]);
ylim([-100 10]);
title("\bf{Magnitude}", "interpreter", "latex");
xlabel("$n$", "interpreter", "latex");
ylabel("$|H(e^{j\omega})|$ in dB", "interpreter", "latex");

subplot(3,1,3);
plot(w, angle(H));
grid on;
xlim([0 w(length(w))]);
title("\bf{Phase}", "interpreter", "latex");
xlabel("$n$", "interpreter", "latex");
ylabel("$\angle{H(e^{j\omega})}$", "interpreter", "latex");

%% Observation

%{
	Part (B)

	Yes, phase is linear.
%}

%{
	Part (D)

	Transition bands in blackman window is larger than in rectangular window.
	Side-lobe levels in blackman window is lower than in rectangular window.
%}

%{
	Part (F)

	The filter with h1[n] = (-1)^n*h[n] behaves like a high-pass filter.
	This is because,
	h1[n] = (e^(-jnπ))*h[n] has frequency response,
		H1(e^(jω)) = H(e^(j(ω-π)))
	which is just the low-pass filter shifted by π and thus acts like a
	high-pass filter.
%}
