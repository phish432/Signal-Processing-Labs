%% Q2

%% Defining the sequences as given

N = 10;

x1 = randn(N,1);

x2 = zeros(N,1); 
x2(4)=1;

%% Direct Method

% Linear Convolution
% y[n] = x1[n] * x2[n] = \sum_{m=0}^{N-1} x1[m]x2[n-m]

lc_dir = conv(x1, x2);

% Circular Convolution
% y[n] = x1[n] (*) x2[n] = \sum_{m=0}^{N-1} x1[m]x2[<n-m>_{N}] (Circular shift)

cc_dir = cconv(x1, x2, N);

%% DFT Method

% Linear Convolution
% x1' and x2' are zero padded to the expected length of the linear convolution; i.e. 2N-1
% x1'[n] ---DFT---> X1[k]
% x2'[n] ---DFT---> X2[k]
% x1[n] * x2[n] <---DFT/IDFT---> X1[k] . X2[k]

lc_dft = ifft(fft(x1,2*N-1).*fft(x2,2*N-1));

% Circular Convolution
% x1[n] ---DFT---> X1[k]
% x2[n] ---DFT---> X2[k]
% x1[n] (*) x2[n] <---DFT/IDFT---> X1[k] . X2[k]

cc_dft = ifft(fft(x1).*fft(x2));

%% Plotting

figure;
sgtitle("Linear and Circular Convolutions using different methods");

subplot(2,2,1);
stem(0:2*N-2,lc_dir,"LineWidth",1);
grid on;
title("Linear Convolution (Direct Method)");
xlabel("$n$", "interpreter", "latex");
ylabel("$x_1[n]\ast x_2[n]$", "interpreter", "latex");

subplot(2,2,2);
stem(0:N-1,cc_dir,"LineWidth",1);
grid on;
title("Circular Convolution (Direct Method)");
xlabel("$n$", "interpreter", "latex");
ylabel("$x_1[n]\textcircled{$\ast$}x_2[n]$", "interpreter", "latex");

subplot(2,2,3);
stem(0:2*N-2,lc_dft,"LineWidth",1);
grid on;
title("Linear Convolution (DFT Method)");
xlabel("$n$", "interpreter", "latex");
ylabel("$x_1[n]\ast x_2[n]$", "interpreter", "latex");

subplot(2,2,4);
stem(0:N-1,cc_dft,"LineWidth",1);
grid on;
title("DFT Circular Convolution (DFT Method)");
xlabel("$n$", "interpreter", "latex");
ylabel("$x_1[n]\textcircled{$\ast$}x_2[n]$", "interpreter", "latex");