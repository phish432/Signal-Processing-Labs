%% 4.2(a)

%% Continuous signal x(t)
To = 0.0001;
t = 0:To:1;
f0 = 10;
xt = sin(2*pi*f0*t);

%% Sampling the signal x[n]
% Sampling frequency 5kHz
fs = 5000;
Ts = 1/fs;
tsamples = 0:Ts:1;

len = length(tsamples);
n = 1:len;

% Generating the discrete-time function based on given sampling interval
xn = zeros(len, 1);
for k = 1:len
	xn(k) = xt(((k-1)*(Ts/To)) + 1);
end

%% Quantization of x[n] -> x_q[n]
% Range = [-1, 1) and Bitdepth = 4
a = 1;
B = 4;

% Quantization using quadratic quant
xqn = quadratic_quant(xn, B, a);

% Quantization error
eqn = xn - xqn;

%% 4.2(b)

% Plotting
figure;
sgtitle("Sampled Signal vs Quantized Signal vs Maximum Absolute Quantization Error", "interpreter", "latex");

subplot(3,1,1);
plot(tsamples, xn);
grid on;
xlabel("$nT_s$", "interpreter", "latex");
ylabel("$x[n]$", "interpreter", "latex");
title("Sampled Signal $x[n]$", "interpreter", "latex");

subplot(3,1,2);
plot(tsamples, xqn);
grid on;
xlabel("$nT_s$", "interpreter", "latex");
ylabel("$x_q[n]$", "interpreter", "latex");
title("Quantised Siganl $x_q[n]$", "interpreter", "latex");

%% 4.2(c)

% Plotting
subplot(3,1,3);
plot(tsamples, eqn);
grid on;
xlabel("$nT_s$", "interpreter", "latex");
ylabel("$e_q[n]$", "interpreter", "latex");
title("Quantization Error $e_q[n]$", "interpreter", "latex");

%% 4.2(d)

% Histogram with 15 bins will divide the
% range of the quantization error into
% 15 equal parts and plot the number of
% samples with error in those ranges

%% Case 1: B = 4
figure;
histogram(eqn, 15);
title("Samples in Error Ranges using Histogram", "B = 4", "interpreter", "latex");

%% Case 2: B = 3
B = 3;
xqn = quadratic_quant(xn, B, a);
eqn = xn - xqn;

figure;
histogram(eqn, 15);
title("Samples in Error Ranges using Histogram", "B = 3", "interpreter", "latex");

%% 4.2(e)

EQN = zeros(8, 1); % Initialize the EQN array with size 8

% For a = 1 and B in range of [1, 8]
a = 1;
for B = 1:8
	% Calculate the quadratic quantization of the sampled signal
	xqn = quadratic_quant(xn, B, a);

	% Quantization errors
	eqn = xn - xqn;

	% Maximum absolute quantization error
	EQN(B) = max(abs(eqn));
end

figure;
plot(1:8, EQN, "-o");
grid on;
xlabel("$B$", "interpreter", "latex");
ylabel("Maximum $|e_q[n]|$", "interpreter", "latex");
title("Maximum Absolute Quantization Error vs Bit-Depth", "interpreter", "latex");

%% 4.2(f)

SQNR = zeros(8, 1);
a = 1;
for B = 1:8
	sum_xn = 0;
	sum_eqn = 0;

	% Calculate the quadratic quantization of the sampled signal
	xqn = quadratic_quant(xn, B, a);

	% Quantization errors
	eqn = xn - xqn;
	for k = 1:len
		sum_xn = sum_xn + abs(xn(k))^2;
		sum_eqn = sum_eqn + abs(eqn(k))^2;
	end

	% By given formula SQNR
	SQNR(B) = sum_xn / sum_eqn;
end

figure;
plot(1:8, SQNR, "-o");
grid on;
xlabel("$B$", "interpreter", "latex");
ylabel("SQNR", "interpreter", "latex");
title("Signal-To-Quantization Noise Ratio vs Bit-Depth", "interpreter", "latex");

%{
	Observations

	### 4.2(d)
	- On comparing the histogram for B = 3 and B = 4, we see that the
	  number of samples in the center near 0 are more in B = 4 and the
	  number of samples in the edges of the histogram are more in B = 3.

	- This is because higher bitdepth gives more accurate quantization
	  and thus we have lower error in B = 4 than in B = 3.

	- Also, the range of the histogram is larger in B = 3 than in B = 4,
	  implying that we have larger errors in the former.

	### 4.2(e)
	- We observe that, as the value of bit-depth B increases the
	  maximum absolute quantization error decreases.

	- This is because as B increases, the levels of quantizations
	increase and we get finer and
	finer quantization values.

	- This reduces the change in the values of the samples and
	hence, reduces the absolute quantization error in the signal.

	### 4.2(f)
	- The graph for SQNR vs. B seems to grow exponentially, with
	  each value being approximately 4 times the previous one.

	- This is because as the bitdepth B increases, the quantization
	  error decreases due to finer and finer quantization values in
	  the range.

	- Since, the numerator (i.e. power of the sampled singal) is a
	  constant and the denominator (i.e. the power of the quantization
	  error / noise) is decreasing with increasing B (as seen in 4.2(e)).
	  Therefore, we can say that the SQNR should increase as the
	  bitdepth increases.

	### 4.2(g)
	- In a non-uniform quantizer, the intervals are not equal and
	  the values of the samples get mapped to a value far from their
	  original value. This causes inaccuracies in samples in the
	  larger intervals.

	- For example, in the quadratic quantizer, the intervals for B = 2
	  are [-1, -0.25) ; [-0.25, 0) ; [0, 0.25) ; [0.25, 1)

	  The interval [0.25, 1) is larger than the [0, 0.25) interval.
	  Since the samples in [0.25, 1) get mapped to 0.625 and samples
	  in [0, 0.25) get mapped to 0.125, we can cleary see the maximum
	  possible error in the larger interval (0.375) is more than in
	  the smaller interval (0.125).

	- In a linear quantizer of the form [a*r_{i}, a*r_{i+1}) the
	  intervals are all of uniform length and hence the maximum
	  possible error in all of them is the same. Thus, we can get more
	  accurate quantization with this than with a non-uniform quantizer
	  like the quadratic one.
%}