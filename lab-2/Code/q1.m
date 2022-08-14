syms t;
w = -5:0.1:5;

%% 2.1 (b)
T = 2;
xt = 1;

%% 2.1 (c)(i)
T = 1;
xt = 1;

%% 2.1 (c)(ii)
T = 4;
xt = 1;

%% 2.1 (d)(i)
T = pi;
xt = exp(1j * t);

%% 2.1 (d)(ii)
T = pi;
xt = cos(t);

%% 2.1 (e)
T = 1;
x_4t = 1 - abs(t);

a = -T;
b = T;

X = continuousFT(xt, t, a, b, w);

figure;

subplot(2, 2, 1);
plot(w, real(X));
title("Real Part");
xlabel("$\omega$", "Interpreter","latex");
ylabel("$\Re(X(\omega))$", "Interpreter","latex");
grid on;

subplot(2, 2, 2);
plot(w, imag(X));
title("Imaginary Part");
xlabel("$\omega$", "Interpreter","latex");
ylabel("$\Im(X(\omega))$", "Interpreter","latex");
grid on;

subplot(2, 2, 3);
plot(w, abs(X));
title("Absolute value");
xlabel("$\omega$", "Interpreter","latex");
ylabel("$|(X(\omega)|$", "Interpreter","latex");
grid on;

subplot(2, 2, 4);
plot(w, angle(X));
title("Angle");
xlabel("$\omega$", "Interpreter","latex");
ylabel("$\theta\ of\ (X(\omega))$", "Interpreter","latex");
grid on;

% Observations

%{

2.1 
    (b) - Fourier Transformation of a rectangular pulse gives us a sinc wave
          which has no imaginary part. Since the real part is fluctuating continuously
          the angle also keeps fluctuating continuously between 0 and pi, but doesn't
          take any value in between.

    (c) - If we have a function X(at), then time scaling gives us
                            [(1 / |a|) * x(w / a)]
          Thus, if we shrink X(t) then x(w) will expand and will be scaled down.
          If we expand X(t) then x(w) will shrink and will be scaled up.
    
    (d) - The expected FT of exp(1j * t) and cos(t) is [2sin((w-1)pi)]/(w-1) and 
          2w*sin(pi * w)/(1 - w^2). The shapes that we observe are sinc function shifted
          to the right by 1 and an interference of 2 sinc functions shifted by 1 & -1
          respectively. We can relate the two graphs as we know that cos(t) = [(e^(jt)+
          e^(-jt))/2]

    (e) - We expect the fourier transform of triangular pulse to be sinc squared function,
          as convulation in time is multiplication in frequency, hence squared. Geometrica-
          lly we can write it as [1 - abs(t)]. 


%}
