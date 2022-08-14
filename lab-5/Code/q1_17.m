%% Q1

w = -10:0.01:10;

%% Q1 (b)

% Part 1

x1 = zeros(size(-5:5));
N01 = 6;
x1(N01) = 1;

X1 = DT_Fourier(x1, N01, w);

figure;
sgtitle("$\delta[n]$", "interpreter", "latex");

subplot(2,2,1);
plot(w, abs(X1));
title("Magnitude", "Interpreter","latex");
ylabel("$|X(\omega)|$", "Interpreter","latex");
xlabel("$\omega$", "Interpreter","latex");
grid on;

subplot(2,2,2);
plot(w, angle(X1));
title("Phase", "Interpreter","latex");
ylabel("$\angle{X(\omega)}$", "Interpreter","latex");
xlabel("$\omega$", "Interpreter","latex");
grid on;

subplot(2,2,3);
plot(w, real(X1));
title("Real part", "Interpreter","latex");
ylabel("$\Re ({X(\omega)})$", "Interpreter","latex");
xlabel("$\omega$", "Interpreter","latex");
grid on;

subplot(2,2,4);
plot(w, imag(X1));
title("Imaginary part", "Interpreter","latex");
ylabel("$\Im ({X(\omega)})$", "Interpreter","latex");
xlabel("$\omega$", "Interpreter","latex");
grid on;

% Part 2

x2 = zeros(size(-5:5));
N02 = 6;
x2(N02 - 3) = 1;

X2 = DT_Fourier(x2, N02, w);

figure;
sgtitle("$\delta[n+3]$", "interpreter", "latex");

subplot(2,2,1);
plot(w, abs(X2));
title("Magnitude", "Interpreter","latex");
ylabel("$|X(\omega)|$", "Interpreter","latex");
xlabel("$\omega$", "Interpreter","latex");
grid on;

subplot(2,2,2);
plot(w, angle(X2));
title("Phase", "Interpreter","latex");
ylabel("$\angle{X(\omega)}$", "Interpreter","latex");
xlabel("$\omega$", "Interpreter","latex");
grid on;

subplot(2,2,3);
plot(w, real(X2));
title("Real part", "Interpreter","latex");
ylabel("$\Re ({X(\omega)})$", "Interpreter","latex");
xlabel("$\omega$", "Interpreter","latex");
grid on;

subplot(2,2,4);
plot(w, imag(X2));
title("Imaginary part", "Interpreter","latex");
ylabel("$\Im ({X(\omega)})$", "Interpreter","latex");
xlabel("$\omega$", "Interpreter","latex");
grid on;

% Part 3

x3 = zeros(length(-3:3), 1);
x3 = x3 + 1;
N03 = 4;

X3 = DT_Fourier(x3, N03, w);

figure;
sgtitle("Rectangular pulse from -3 to 3");

subplot(2,2,1);
plot(w, abs(X3));
title("Magnitude", "Interpreter","latex");
ylabel("$|X(\omega)|$", "Interpreter","latex");
xlabel("$\omega$", "Interpreter","latex");
grid on;

subplot(2,2,2);
plot(w,atan2(floor(abs(imag(X3))),((real(X3)))));
title("Phase", "Interpreter","latex");
ylabel("$\angle{X(\omega)}$", "Interpreter","latex");
xlabel("$\omega$", "Interpreter","latex");
grid on;

subplot(2,2,3);
plot(w, real(X3));
title("Real part", "Interpreter","latex");
ylabel("$\Re ({X(\omega)})$", "Interpreter","latex");
xlabel("$\omega$", "Interpreter","latex");
grid on;

subplot(2,2,4);
plot(w, imag(X3));
ylim([-4 4]);
title("Imaginary part", "Interpreter","latex");
ylabel("$\Im ({X(\omega)})$", "Interpreter","latex");
xlabel("$\omega$", "Interpreter","latex");
grid on;

% Part 4

n4 = -200:200;
N04 = 201;
x4 = sin(pi * n4/4);

X4 = DT_Fourier(x4, N04, w);

figure;
sgtitle("$sin(\omega_0 \cdot n)$", "interpreter", "latex");

subplot(2,2,1);
plot(w, abs(X4));
title("Magnitude", "Interpreter","latex");
ylabel("$|X(\omega)|$", "Interpreter","latex");
xlabel("$\omega$", "Interpreter","latex");
grid on;

subplot(2,2,2);
plot(w, atan2(((imag(X4))),floor(abs(real(X4)))));
title("Phase", "Interpreter","latex");
ylabel("$\angle{X(\omega)}$", "Interpreter","latex");
xlabel("$\omega$", "Interpreter","latex");
grid on;

subplot(2,2,3);
plot(w, real(X4));
ylim([-200 200]);
title("Real part", "Interpreter","latex");
ylabel("$\Re ({X(\omega)})$", "Interpreter","latex");
xlabel("$\omega$", "Interpreter","latex");
grid on;

subplot(2,2,4);
plot(w, imag(X4));
title("Imaginary part", "Interpreter","latex");
ylabel("$\Im ({X(\omega)})$", "Interpreter","latex");
xlabel("$\omega$", "Interpreter","latex");
grid on;

%% Q1 (c)

n = 0:100;

% When b = 0.01
a = 0.01;
x_a = a.^n;
x_b = (-a).^n;

N0 = 1;

X_a = DT_Fourier(x_a, N0, w);
X_b = DT_Fourier(x_b, N0, w);

figure;
sgtitle("$b=0.01$", "interpreter", "latex");

subplot(2,2,1);
stem(n, x_a);
title("$a^n\cdot u[n]\ vs\ t$", "interpreter", "latex");
ylabel("$a^n\cdot u[n]$", "interpreter", "latex");
xlabel("$t$", "interpreter", "latex");
grid on;

subplot(2,2,2);
stem(n, x_b);
title("$(-a)^n\cdot u[n]\ vs\ t$", "interpreter", "latex");
ylabel("$(-a)^n\cdot u[n]$", "interpreter", "latex");
xlabel("$t$", "interpreter", "latex");
grid on;

subplot(2,2,3);
plot(w, abs(X_a));
title("DTFT Magnitude Spectrum for $a=0.01$ ", "interpreter", "latex");
ylabel("$|X(\omega)|$", "interpreter", "latex");
xlabel("$\omega$", "interpreter", "latex");
grid on;

subplot(2,2,4);
plot(w, abs(X_b));
title("DTFT Magnitude Spectrum for $a=-0.01$", "interpreter", "latex");
ylabel("$|X(\omega)|$", "interpreter", "latex");
xlabel("$\omega$", "interpreter", "latex");
grid on;

% When b = 0.5
a2 = 0.5;
x_a2 = a2.^n;
x_b2 = (-a2).^n;

N0 = 1;

X_a2 = DT_Fourier(x_a2, N0, w);
X_b2 = DT_Fourier(x_b2, N0, w);

figure;
sgtitle("$b=0.5$", "interpreter", "latex");

subplot(2,2,1);
stem(n, x_a2);
title("$a^n\cdot u[n]\ vs\ t$", "interpreter", "latex");
ylabel("$a^n\cdot u[n]$", "interpreter", "latex");
xlabel("$t$", "interpreter", "latex");
grid on;

subplot(2,2,2);
stem(n, x_b2);
title("$(-a)^n\cdot u[n]\ vs\ t$", "interpreter", "latex");
ylabel("$(-a)^n\cdot u[n]$", "interpreter", "latex");
xlabel("$t$", "interpreter", "latex");
grid on;

subplot(2,2,3);
plot(w, abs(X_a2));
title("DTFT Magnitude Spectrum for $a=0.5$ ", "interpreter", "latex");
ylabel("$|X(\omega)|$", "interpreter", "latex");
xlabel("$\omega$", "interpreter", "latex");
grid on;

subplot(2,2,4);
plot(w, abs(X_b2));
title("DTFT Magnitude Spectrum for $a=-0.5$ ", "interpreter", "latex");
ylabel("$|X(\omega)|$", "interpreter", "latex");
xlabel("$\omega$", "interpreter", "latex");
grid on;

% When b = 0.99
a3 = 0.99;
x_a3 = a3.^n;
x_b3 = (-a3).^n;

N0 = 1;

X_a3 = DT_Fourier(x_a3, N0, w);
X_b3 = DT_Fourier(x_b3, N0, w);

figure;
sgtitle("$b=0.99$", "interpreter", "latex");

subplot(2,2,1);
stem(n, x_a3);
title("$a^n\cdot u[n]\ vs\ t$", "interpreter", "latex");
ylabel("$a^n\cdot u[n]$", "interpreter", "latex");
xlabel("$t$", "interpreter", "latex");
grid on;

subplot(2,2,2);
stem(n, x_b3);
title("$(-a)^n\cdot u[n]\ vs\ t$", "interpreter", "latex");
ylabel("$(-a)^n\cdot u[n]$", "interpreter", "latex");
xlabel("$t$", "interpreter", "latex");
grid on;

subplot(2,2,3);
plot(w, abs(X_a3));
title("DTFT Magnitude Spectrum for $a=0.99$ ", "interpreter", "latex");
ylabel("$|X(\omega)|$", "interpreter", "latex");
xlabel("$\omega$", "interpreter", "latex");
grid on;

subplot(2,2,4);
plot(w, abs(X_b3));
title("DTFT Magnitude Spectrum for $a=-0.99$ ", "interpreter", "latex");
ylabel("$|X(\omega)|$", "interpreter", "latex");
xlabel("$\omega$", "interpreter", "latex");
grid on;

%% Observations

%{
5.1(b)-
  For unit impulse:
    The DTFT is a constant value which is 1, and hence it is a real valued signal. It's magnitude and phase (which is 0) is constant throughout.
    
  For shifted unit impulse:
    The DTFT is X(e^(jw)) = e^(-j*w*n0) for function x[n - n0]. Thus we can clearly see it's complex valued
    but it's magnitude is constant (which is 1). It's phase oscillates between the values -pi and pi (jumps linearly from
    -pi to pi, but drops from pi to -pi for negative n0), and is periodic with period 2pi/|n0|.
    
  For rectangular pulse from -3 to 3:
    The DTFT is X(e^jw) = sin(w(N1 + 0.5))/sin(w/2). Here, N1 = 3 hence X(e^(jw)) = sin(3.5w)/sin(w/2). It is a purely real
    signal and has a max value of 7 (which is 2N1) and has a DTFT of period 2pi.
    
  For sinusoid:
    The DTFT is impusle train with impulses at w = 2*pi*k - w0. It is purely imaginary and is equal to 
    X(e^(jw)) = \sum_{k=-inf}^{inf}(pi/j)(delta(w-w0-2pi*k) - delta(w+w0-2pi*k)). Here as well, it has a period of 2pi.
%}

%{
5.1(c)-
  As b increases, we can observe that:The one-sided exponential decays slower. x[0] = 1 in all cases, but x[100] is almost
  zero for b = 0.01 (1e-20) and b = 0.5 (7.88*1e-31). For b = 0.99, x[100] is approximately 0.366.The range of values of the 
  magnitude of DTFT of x[n] increases. In all cases, as n increases, the maximum value tends to 1/(1-b) and the minimum value 
  tends to 1/(1+b).

%}
    
    
