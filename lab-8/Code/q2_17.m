%% Q2

%% Part A

parr = [0.9, 1+1j]; % Values of p

m = -1.5:0.01:1.5;
[x, y] = meshgrid(m); % Creates matrix for x and y axes
z = x + 1j*y;         % Creates matrix of complex grid

for p = parr
	Xz = z./(z-p);       % Z-Transform
	Fabs = log(abs(Xz)); % Logarithm of absolute value of Z-Transform
	Fang = angle(Xz);    % Angle of Z-Transform

	% Plotting the Mesh Plots
	figure;
	sgtitle("$X(z)=\frac{z}{z-p}$ with $p=$ "+p, "interpreter", "latex");

	subplot(1, 2, 1);
	mesh(x, y, Fabs);
	title("\textbf{Magnitude}", "interpreter", "latex");
	xlabel("Real", "interpreter", "latex");
	ylabel("Imaginary", "interpreter", "latex");
	zlabel("$\log{|X(z)|}$", "interpreter", "latex");

	subplot(1, 2, 2);
	mesh(x, y, Fang);
	title("\textbf{Angle}", "interpreter", "latex");
	xlabel("Real", "interpreter", "latex");
	ylabel("Imaginary", "interpreter", "latex");
	zlabel("$\angle{X(z)}$", "interpreter", "latex");
end

%% Part B

parr = [0.9, 1+1j]; % Values of p

for p = parr
	b = 1;       % Numerator coefficients
	a = [1, -p]; % Denominator coefficients

	% Plotting Pole-Zero Plots
	figure;
	zplane(b, a);
	grid on;
	title(["Pole-Zero Plot", "$X(z)=\frac{z}{z-p}$ with $p=$ "+p], "interpreter", "latex");
end

%% Part C

parr = [0.9, 1+1j];

for p = parr
	b = 1;       % Numerator coefficients
	a = [1, -p]; % Denominator coefficients

	n = 1001;
	[h, w] = freqz(b, a, n, "whole");

	% Plotting DTFT Plots
	figure;
	sgtitle("DTFT of $X(z)=\frac{z}{z-p}$ with $p=$ "+p, "interpreter", "latex");

	subplot(2, 1, 1);
	plot(w, abs(h), 'LineWidth', 1);
	xlim([0 w(n)]);
	grid on;
	title("\textbf{Magnitude}", "interpreter", "latex");
	xlabel("$\omega$", "interpreter", "latex");
	ylabel("$|X(\omega)|$", "interpreter", "latex");

	subplot(2, 1, 2);
	plot(w, angle(h), 'LineWidth', 1);
	xlim([0 w(n)]);
	grid on;
	title("\textbf{Phase}", "interpreter", "latex");
	xlabel("$\omega$", "interpreter", "latex");
	ylabel("$\angle{X(\omega)}$", "interpreter", "latex");
end

%% Part D

parr = [0.9, 1+1j];

for p = parr
	b = 1;       % Numerator coefficients
	a = [1, -p]; % Denominator coefficients

	n = 51;
	[impResp, t] = impz(b, a, n);

	% Plotting Time-Domain Signal Plots
	figure;
	sgtitle(["Time-domain Signal", "$p=$ "+p], "interpreter", "latex");

	subplot(2, 1, 1);
	stem(t, real(impResp), 'filled', 'LineWidth', 1);
	grid on;
	title("\textbf{Real Part}", "interpreter", "latex");
	ylabel("$\Re(x(t))$", "interpreter", "latex");
	xlabel("$t$", "interpreter", "latex");

	subplot(2, 1, 2);
	stem(t, imag(impResp), 'filled', 'LineWidth', 1);
	grid on;
	title("\textbf{Imaginary Part}", "interpreter", "latex");
	ylabel("$\Im(x(t))$", "interpreter", "latex");
	xlabel("$t$", "interpreter", "latex");
end

%% Part E

%% Subpart E-A

parr = [0.9, 1+1j]; % Values of p

m = -1.5:0.01:1.5;
[x, y] = meshgrid(m); % Creates matrix for x and y axes
z = x + 1j*y;         % Creates matrix of complex grid

r = 0.95;
th = pi/3;

Xz = (z.^2 - (2*cos(th)).*z + 1)./(z.^2 - (2*r*cos(th)).*z + r^2);
Fabs = log(abs(Xz)); % Logarithm of absolute value of Z-Transform
Fang = angle(Xz);    % Angle of Z-Transform

% Plotting the Mesh Plots
figure;
sgtitle("$X(z)=\frac{z^2-(2\cos{\theta})z+1}{z^2-(2r\cos{\theta}z+r^2)}$ with $r=0.95,\theta=\frac{\pi}{3}$", "interpreter", "latex");

subplot(1, 2, 1);
mesh(x, y, Fabs);
title("\textbf{Magnitude}", "interpreter", "latex");
xlabel("Real", "interpreter", "latex");
ylabel("Imaginary", "interpreter", "latex");
zlabel("$\log{|X(z)|}$", "interpreter", "latex");

subplot(1, 2, 2);
mesh(x, y, Fang);
title("\textbf{Angle}", "interpreter", "latex");
xlabel("Real", "interpreter", "latex");
ylabel("Imaginary", "interpreter", "latex");
zlabel("$\angle{X(z)}$", "interpreter", "latex");

%% Subpart E-B

r = 0.95;
th = pi/3;

b = [1, -2*cos(th), 1];     % Numerator coefficients
a = [1, -2*r*cos(th), r^2]; % Denominator coefficients

% Plotting Pole-Zero Plots
figure;
zplane(b, a);
grid on;
title(["Pole-Zero Plot", "$X(z)=\frac{z^2-(2\cos{\theta})z+1}{z^2-(2r\cos{\theta}z+r^2)}$ with $r=0.95,\theta=\frac{\pi}{3}$"], "interpreter", "latex");

%% Subpart E-C

r = 0.95;
th = pi/3;

b = [1, -2*cos(th), 1];     % Numerator coefficients
a = [1, -2*r*cos(th), r^2]; % Denominator coefficients

n = 1001;
[h, w] = freqz(b, a, n, "whole");

% Plotting DTFT Plots
figure;
sgtitle("DTFT of $X(z)=\frac{z^2-(2\cos{\theta})z+1}{z^2-(2r\cos{\theta}z+r^2)}$ with $r=0.95,\theta=\frac{\pi}{3}$", "interpreter", "latex");

subplot(2, 1, 1);
plot(w, abs(h), 'LineWidth', 1);
xlim([0 w(n)]);
grid on;
title("\textbf{Magnitude}", "interpreter", "latex");
xlabel("$\omega$", "interpreter", "latex");
ylabel("$|X(\omega)|$", "interpreter", "latex");

subplot(2, 1, 2);
plot(w, angle(h), 'LineWidth', 1);
xlim([0 w(n)]);
grid on;
title("\textbf{Phase}", "interpreter", "latex");
xlabel("$\omega$", "interpreter", "latex");
ylabel("$\angle{X(\omega)}$", "interpreter", "latex");


%% Subpart E-D

r = 0.95;
th = pi/3;

b = [1, -2*cos(th), 1];     % Numerator coefficients
a = [1, -2*r*cos(th), r^2]; % Denominator coefficients

n = 51;
[impResp, t] = impz(b, a, n);

% Plotting Time-Domain Signal Plots
figure;
sgtitle("Time-domain Signal", "interpreter", "latex");

subplot(2, 1, 1);
stem(t, real(impResp), 'filled', 'LineWidth', 1);
grid on;
title("Real Part", "interpreter", "latex");
ylabel("$\Re(x(t))$", "interpreter", "latex");
xlabel("$t$", "interpreter", "latex");

subplot(2, 1, 2);
stem(t, imag(impResp), 'filled', 'LineWidth', 1);
grid on;
title("Imaginary Part", "interpreter", "latex");
ylabel("$\Im(x(t))$", "interpreter", "latex");
xlabel("$t$", "interpreter", "latex");

%% Observations

%{
	Part A

	For zeros, X(z) will approach 0 ==> log(|X(z)|) = -∞
	For poles, X(z) will approach ∞ ==> log(|X(z)|) = +∞

	-> p = 0.9
	   zeros = { 0 }
	   poles = { 0.9 }

	-> p = 1+j
	   zeros = { 0 }
	   poles = { 1+j }
%}

%{
	Part D

	-> p = 0.9
	   The time-domain signal given by impz is u[n]*(0.9)^n
	   Causal.
	-> p = 1+j
	   The time-domain signal given by impz is u[n]*(1+j)^n
	   Causal.

	- Since, both Z-transforms have only one pole p.
	  Therefore, they have 2 ROCs possible : |z| < |p| and |z| > |p|.

	- impz returns the time-domain signal which is causal.
	  i.e. |z| > |p| for the pole p.
%}

%{
	Part F

	The X(z) expression simplifies to ( use 2cos(ϴ) = e^{jϴ} + e^{-jϴ} )
	    X(z) = [(z - e^{jϴ}) (z - e^{-jϴ})] / [(z - r.e^{jϴ}) (z - r.e^{-jϴ})]

	Zeros = { e^{jϴ}, e^{-jϴ} }
	- The zeroes are conjugates of each-other and lie on the unit circle.
	- If r changes, the position of the zeros remain unaffected.
	- If ϴ changes, the zeros are set to angles +ϴ and -ϴ (conjugates).

	Plots = { r.e^{jϴ}, r.e^{-jϴ} }
	- The poles are conjugates of each-other and lie on a circle of radius r.
	- If r changes, the radius of the circle the poles lie on changes.
	- If ϴ changes, the poles are set to angles +ϴ and -ϴ (conjugates).
%}