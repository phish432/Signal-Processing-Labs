%% Question 3

[y0, Fs] = audioread('file_example_WAV_1MG.wav');
% Fs is sampling rate

% Duration of the signal
dur = length(y0) / Fs;

% Audio channels in the signal
ch1 = y0(1:length(y0),1);
ch2 = y0(1:length(y0),2);

a = 1;
B = 3;

% Quantized audio channels
cq1 = quadratic_quant(ch1, B, a);
cq2 = quadratic_quant(ch2, B, a);

% Combined quantized signal
y1 = [cq1, cq2];

%% 1

sound(y0, Fs);
pause(dur + 2);
sound(y1, Fs);
pause(dur + 2);

%% 2

a = 1;
for B = 1:8
	% Quantized audio channels
	cq1 = quadratic_quant(ch1, B, a);
	cq2 = quadratic_quant(ch2, B, a);

	% Combined quantized signal
	y1 = [cq1, cq2];
	sound(y1, Fs);
	pause(dur + 2);
end


%{
	Observations

	### Part 1

	The audio which is quantized with B = 3 sounds a bit distorted in comparison
	the original signal.

	### Part 2

	We observe that as we keep increasing the number of bits, the sampling becomes
	more and more clearer, as the replication of the original sample becomes better,
	leading to a reduction in the distortion in sound, and an error in the signal.

	### Part 3 Effect of quantization on frequency. Role of B.

	Due to quantization, some error occurs in the signal which comes as
	unwanted frequencies / noise.

	As B increases, quantizations levels become finer and so the errors and
	subsequently the noise become less and less.

	As the values in an interval get mapped to a single value, there
	is a loss of frequencies with small magnitudes ans they get mapped to the same value.

}%
