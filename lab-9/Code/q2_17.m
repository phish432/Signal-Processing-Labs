%% Q2

%% Part A

w0 = pi/4;

% Numerator Coefficients
b0 = ((1-exp(1j*w0))*(1-exp(-1j*w0)))^(-1);
b1 = [1,-exp(1j*w0)];
b2 = [1,-exp(-1j*w0)];

% Filter Coefficients
bA = b0*conv(b1,b2);
aA = 1;

% Plotting Frequency Response
figure;
sgtitle("Q2(A) FIR Filter");
freqz(bA,aA,2001);

%% Part B

r0 = 0.9;
w0 = pi/4;

% Numerator Coefficients
b0 = ((((1-exp(1j*w0))*(1-exp(-1j*w0))))/((1-r0*exp(1j*w0))*(1-r0*exp(-1j*w0))))^(-1);
b1 = [1,-exp(1j*w0)];
b2 = [1,-exp(-1j*w0)];
% Denomator Coefficients
a1 = [1,-r0*exp(1j*w0)];
a2 = [1,-r0*exp(-1j*w0)];

% Filter Coefficients
bB = b0*conv(b1,b2);
aB = conv(a1,a2);

% Plotting Frequency Response
figure;
sgtitle("Q2(B) IIR Filter");
freqz(bB,aB,2001);

%% Part D

%% Filter (a) FIR
w0 = pi/4;

% Numerator Coefficients
b0 = ((1-exp(1j*w0))*(1-exp(-1j*w0)))^(-1);
b1 = [1,-exp(1j*w0)];
b2 = [1,-exp(-1j*w0)];

% Filter Coefficients
bA = b0*conv(b1,b2);
aA = 1;

fvtool(bA,aA);

%% Filter (b) IIR : r0 = 0.9, 0.5, 0.99 change accordingly
r0 = 0.9;
w0 = pi/4;

% Numerator Coefficients
b0 = ((((1-exp(1j*w0))*(1-exp(-1j*w0))))/((1-r0*exp(1j*w0))*(1-r0*exp(-1j*w0))))^(-1);
b1 = [1,-exp(1j*w0)];
b2 = [1,-exp(-1j*w0)];
% Denorator Coefficients
a1 = [1,-r0*exp(1j*w0)];
a2 = [1,-r0*exp(-1j*w0)];

% Filter Coefficients
bB = b0*conv(b1,b2);
aB = conv(a1,a2);

fvtool(bB,aB);

%% Part E

load handel.mat

% Original Audio
sound(y,Fs);
pause(length(y)/Fs+1);

% Distorted Audio
f0 = 1024;
t = (0:1/Fs:(length(y)-1)/Fs).';
y1 = y + sin(2*pi*f0*t);
sound(y1,Fs);
pause(length(y1)/Fs+1);

% Pass through Filter (a) (FIR Filter)
y1_filA = filter(bA, aA, y1);
sound(y1_filA,Fs);
pause(length(y1_filA)/Fs+1);

% Pass through Filter (b) (IIR Filter)
y1_filB = filter(bB, aB, y1);
sound(y1_filB,Fs);
pause(length(y1_filB)/Fs+1);

%% Part F

% Plotting first 100 samples of the original audio, Distorted Audio,
% Filter (a) (FIR Filter), Filter (b) (IIR Filter)

figure;
sgtitle("Q2(F) Effect of FIR and IIR Notch Filters on Signals");

subplot(2,2,1);
stem(y(1:100),"filled","MarkerSize", 4);
grid on;
xlim([1 100]);
title("\bf{Original Signal}","interpreter","latex");
xlabel("$n$","interpreter","latex");
ylabel("$y[n]$","interpreter","latex");

subplot(2,2,2);
stem(y1(1:100),"filled","MarkerSize", 4);
grid on;
xlim([1 100]);
title("\bf{Distorted Signal}","interpreter","latex");
xlabel("$n$","interpreter","latex");
ylabel("$y_1[n]$","interpreter","latex");

subplot(2,2,3);
stem(y1_filA(1:100),"filled","MarkerSize", 4);
grid on;
xlim([1 100]);
title("\bf{Passed through (a) FIR Filter}","interpreter","latex");
xlabel("$n$","interpreter","latex");
ylabel("Filtered $y_1[n]$","interpreter","latex");

subplot(2,2,4);
stem(y1_filB(1:100),"filled","MarkerSize", 4);
grid on;
xlim([1 100]);
title("\bf{Passed through (b) IIR Filter}","interpreter","latex");
xlabel("$n$","interpreter","latex");
ylabel("Filtered $y_1[n]$","interpreter","latex");

%% Observations

%{
	Part (C)

	For system in Part (A) (FIR Filter)
		Zeros : { e^(jω0), e^(-jω0) }
		Poles : { 0 }
		The only possible ROC = C - {0}

		So, the system will always be causal and stable.

	For system in Part (B) (IIR Filter)
		Zeros : { e^(jω0), e^(-jω0) }
		Poles : { r0*e^(jω0), r0*e^(-jω0) }
		The possible ROCs = |z| < r0, |z| > r0

		We are given, r0 = 0.9 < 1
		When ROC = |z| < r0 ==> System anti-causal and unstable
		When ROC = |z| > r0 ==> System causal and stable
%}

%{
	Part (D)

	FIR Filter
		The magnitude of ω0 = π/4 as expected of a notch filter.
		But, the the other frequencies are scaled incorrectly.
		So, we obtain a non-ideal notch filter.

	IIR Filter
		As r0 approaches 1, the poles and zeros get closer, and thus
		the system will approach :
		- impulse response   - δ[n]
		- magnitude response - 1
		- phase response     - 0
		- pole-zero plot     - no poles, no zeros

		The effect of increasing r0 from 0.5, 0.9, 0.99 on the
		following results of IIR Filter

		(1) Magnitude Response
		The transition band becomes smaller as r0 increases and it
		approaches a system where all frequencies pass through the
		filter except for ω0 = π/4.

		(2) Phase Response
		It approaches 0, but at frequency ω0 = π/4, the phase becomes ±π/2.

		(3) Impulse Response
		The impulse response changes from being a sinc-like wave to a function
		having 1 at n = 0 and gets closer to 0 at all other values of n.
		(i.e. it approaches δ[n])

		(4) Pole-Zero Plot
		The poles and zeros get closer as r0 increases to 1.

		So, IIR Filter is a better choice for the notch filter as it resembles
		an ideal notch filter as r0 increases to 1.
%}

%{
	Part (F)

	The sampling frequency of 'handel.wav' is fs = 8192 Hz.
	The introduced frequency is f0 = 1024 Hz.

	The notch filters in Part (A) and (B) are designed to remove
	the angular frequency w0 = π/4 = 2π/8.
	So, in frequency domain, f0 = (fs/2π)*(2π/8) = fs/8 = 8192/8 = 1024 Hz.

	So, after filtering we are left with an estimate of the original signal
	since both filters will remove the introduced frequency.

	In FIR Filter, the noise frequency added is removed but the improper
	scaling of the other frequencies slightly distorts the original signal.

	In IIR Filter, the noise frequency added is removed and since, IIR Filter
	acts as a more ideal notch filter the output signal is more accurate.
%}