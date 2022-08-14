%% Q1

%% Part E

f0 = 12;
fs = 64;
L = 16;

figure;
sgtitle(["\textbf{DFT for fixed }$L$\textbf{ and varying }$N$", "$p(t)=\cos(2\pi f_0t),f_0=12$ Hz"], "interpreter", "latex");

m = [1,2,4,8];
for k = 1:4
	N = m(k)*L;
	ts = 0:1/fs:(N-1)/fs;

	pn = cos(2*pi*f0*ts);           % Given sampled sequence
	wn = [ones(1,L), zeros(1,N-L)]; % Window function
	xn = pn.*wn;

	yn = fft(xn, N); % DFT of x[n]

	subplot(2,2,k);
	xaxis = (2*pi/N)*(0:N-1);
	if k<=2
		stem(xaxis,abs(yn));
	else
		plot(xaxis,abs(yn));
	end
	xlim([0 2*pi]);
	grid on;
	title("$L=$ "+L, "$N=$ "+N, "interpreter", "latex");
	xlabel("Frequency $w$", "interpreter", "latex");
	ylabel("$|X[k]|$", "interpreter", "latex");
end

%% Part F

f0 = 12;
fs = 64;

figure;
sgtitle(["\textbf{DFT for varying }$L$\textbf{ and }$N=8L$", "$p(t)=\cos(2\pi f_0t),f_0=12$ Hz"], "interpreter", "latex");

L = [16,32,64,128];
for k = 1:4
	N = 8*L(k);
	ts = 0:1/fs:(N-1)/fs;

	pn = cos(2*pi*f0*ts);           % Given sampled sequence
	wn = [ones(1,L(k)), zeros(1,N-L(k))]; % Window function
	xn = pn.*wn;

	yn = fft(xn, N); % DFT of x[n]

	subplot(2,2,k);
	xaxis = (2*pi/N)*(0:N-1);
	plot(xaxis,abs(yn));
	xlim([0 2*pi]);
	grid on;
	title("$L=$ "+L(k), "$N=$ "+N, "interpreter", "latex");
	xlabel("Frequency $w$", "interpreter", "latex");
	ylabel("$|X[k]|$", "interpreter", "latex");
end

%% Part G

f0 = 11;
fs = 64;
L = 16;

figure;
sgtitle(["\textbf{DFT for constant }$L$\textbf{ and varying }$N$", "$p(t)=\cos(2\pi f_0t),f_0=11$ Hz"], "interpreter", "latex");

m = [1,2,4,8];
for k = 1:4
	N = m(k)*L;
	ts = 0:1/fs:(N-1)/fs;

	pn = cos(2*pi*f0*ts);           % Given sampled sequence
	wn = [ones(1,L), zeros(1,N-L)]; % Window function
	xn = pn.*wn;

	yn = fft(xn, N); % DFT of x[n]

	subplot(2,2,k);
	xaxis = (2*pi/N)*(0:N-1);
	if k<=2
		stem(xaxis,abs(yn));
	else
		plot(xaxis,abs(yn));
	end
	xlim([0 2*pi]);
	grid on;
	title("$L=$ "+L, "$N=$ "+N, "interpreter", "latex");
	xlabel("Frequency $w$", "interpreter", "latex");
	ylabel("$|X[k]|$", "interpreter", "latex");
end

%% Part H

f0 = 12;
fs = 64;
L = 16;

figure;
sgtitle(["\textbf{DFT for fixed }$L$\textbf{ and varying }$N$", "$p(t)=\cos(2\pi f_0t),f_0=12$ Hz", "$w[n]= $ Hanning Window"], "interpreter", "latex");

m = [2,2,4,8];
for k = 1:4
	N = m(k)*L;
	ts = 0:1/fs:(N-1)/fs;

	pn = cos(2*pi*f0*ts);          % Given sampled sequence
	wn = [hann(L).',zeros(1,N-L)]; % Hanning Window function
	xn = pn.*wn;

	yn = fft(xn, N); % DFT of x[n]

	subplot(2,2,k);
	xaxis = (2*pi/N)*(0:N-1);
	if k<=2
		stem(xaxis,abs(yn));
	else
		plot(xaxis,abs(yn));
	end
	xlim([0 2*pi]);
	grid on;
	title("$L=$ "+L, "$N=$ "+N, "interpreter", "latex");
	xlabel("Frequency $w$", "interpreter", "latex");
	ylabel("$|X[k]|$", "interpreter", "latex");
end

%% Part J

pn = audioread("../audio files/05.wav");

fs = 44100;
N = length(pn);
L = 44100;

wn = [hann(L).',zeros(1,N-L)]; % Hanning Window function
xn = pn.*(wn.');

yn = fft(xn); % DFT of audio

figure;
sgtitle("\textbf{DFT of audio file} 05.wav", "interpreter", "latex");

xaxis = (2*pi/N)*(0:N-1);

subplot(1,2,1);
plot(xaxis,abs(yn(1:N,1)));
xlim([0 2*pi]);
grid on;
title("Channel 1");
xlabel("Frequency $w$", "interpreter", "latex");
ylabel("$|X[k]|$", "interpreter", "latex");

subplot(1,2,2);
plot(xaxis,abs(yn(1:N,2)));
xlim([0 2*pi]);
grid on;
title("Channel 2");
xlabel("Frequency $w$", "interpreter", "latex");
ylabel("$|X[k]|$", "interpreter", "latex");

soundsc(xn, fs);

%% Observations
% δ π ω
%{
	Part A :

	p(t) = cos(w0.t)
	P(w) =  π [δ(w - w0) + δ(w + wo)]
%}

%{
	Part B :

	p[n] = cos(w0.nTs)
	P(e^jw) = π Σ{k=-∞,∞} [δ(w - w0.Ts - 2πk) + δ(w + w0.Ts - 2πk)]
%}

%{
	Part C :

	- In part A,
		impulses of CTFT are present at -w0 and w0.
	- In part B,
		impulses in DTFT are present at -w0.Ts and w0.Ts in [-π, π]
		and it is periodic with period 2π.
%}

%{
	Part D :

	x[n] = p[n]w[n] <---DTFT/IDTFT---> X[e^jw] = P(e^jw) * W(e^jw)

	X(e^jw) = π Σ{k=-∞,∞} [W(w - w0.Ts - 2πk) + W(w + w0.Ts - 2πk)]

	where,
	W(e^jw) = e^{-jk(π/N)(L-1)}[sin(πkL/N) / sin(πk/N)]

	Main Lobe Width = 2π/L

	- Due to window, spectral leakage occurs.

	- This is because the power that is at the two impulses, gets
	redistributed due to the presence of the sidelobes in the
	frequency spectrum of window.

	- The final position of the peaks in the frequency domain of
	X(e^jw) does not change and will remain at the same place
	where they occured in P[k].
%}

%{
	Part E :

	Yes, the plots are consistent with the results of Part D.

	Since, L is constant, therefore, the main lobe width 2π/L doesn't
	change and thus the resolution remains the same. The spectral
	leakage also doesn't change.

	Since, N is increasing, therefore, the numebr of sampels increases
	and we see that the DFT becomes more smooth and more similar to
	the DTFT curve.
%}

%{
	Part F :

	- As L increases, the window function approaches a constant 1
	  fucntion. And hence, DFT of x[n] = p[n]w[n] <----> X[k]
	  approaches P[k].

	- As L increases, the ratio N/L=8 remains constant, but the signal
	  length N increases.

	- As L increases, the main lobe width 2π/L decreases and thus
	  we can distinguish between closer and closer frequencies;
	  thus the resolution increases.

	- As L increases, spectral leakage decreases.
%}

%{
	Part H :

	- Main lobe width of Hanning window is larger in comparison
	  to the normal rectangular window, so our resolution decreases.

	- Side lobe widths of Hanning window is smaller in comparison
	  to the normal rectangular window, there spectral leakage decreases.
%}

%{
	Part I :

	- Formula
		X[k] = Σ x[nTs]e^{-j(2πTs/N)kn}

		So, the peaks occur at w1 = 2πf0/fs and w2 = 2π - 2πf0/fs
		(Since graph is symmetric about π)

		To find the frequencies in the signal, we can use the following formula -
			f0 = fs.[(w1 - w2)/2π]
		where, w1 < w2.

		If we have w1 < π < w2, we can also use -
			f0 = fs.[w1/2π]

	We will use second formula to find the frequencies.

	- Part E Frequencies (fs = 64 Hz) (f0 = 12 Hz)
		In the subplots : 12.00 Hz, 12.00 Hz, 12.00 Hz, 12.00 Hz
		Average Estimated f0 = 12.00 Hz

	- Part F Frequenies (fs = 64 Hz) (f0 = 12 Hz)
		In the subplots : 12.00 Hz, 12.00 Hz, 12.00 Hz, 12.00 Hz
		Average Estimated f0 = 12.00 Hz

	- Part G Frequenies (fs = 64 Hz) (f0 = 11 Hz)
		In the subplots : 12.00 Hz, 10.00 Hz, 11.00 Hz, 11.00 Hz
		Average Estimated f0 = 11.00 Hz
%}

%{
	Part J :

	Using the same formula as Part I

	In decreasing order of strength,
	- Channel 1 : 527.102 Hz, 1057.45 Hz, 1592.99 Hz
	- Channel 2 : 527.102 Hz, 1056.15 Hz, 1591.69 Hz
%}