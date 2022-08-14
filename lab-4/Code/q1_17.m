%% Question 1

%% Reading Files
% 1st arg is sample data
% 2nd arg is sampling frequency

[y1, Fs1] = audioread('file_example_WAV_1MG.wav');
[y2, Fs2] = audioread('file_example_WAV_2MG.wav');
[y3, Fs3] = audioread('file_example_WAV_5MG.wav');
[y4, Fs4] = audioread('file_example_WAV_10MG.wav');

%% Sampling Frequencies

fprintf("Sampling Frequencies\n\n");
fprintf("file_example_WAV_1MG.wav  -> %ld Hz\n", Fs1);
fprintf("file_example_WAV_2MG.wav  -> %ld Hz\n", Fs2);
fprintf("file_example_WAV_5MG.wav  -> %ld Hz\n", Fs3);
fprintf("file_example_WAV_10MG.wav -> %ld Hz\n\n", Fs4);

%% Bitrates
% Taken from file properties

fprintf("Bitrates\n\n");
fprintf("file_example_WAV_1MG.wav  -> 256 kbps\n");
fprintf("file_example_WAV_2MG.wav  -> 512 kbps\n");
fprintf("file_example_WAV_5MG.wav  -> 1411 kbps\n");
fprintf("file_example_WAV_10MG.wav -> 1411 kpbs\n\n");

%% Bit Depths
% Bitrate = Number of Channels * Bitdepth * Sampling Rate

bitdepth1 = (256 * 1000) / (2 * Fs1);
bitdepth2 = (512 * 1000) / (2 * Fs2);
bitdepth3 = (1411 * 1000) / (2 * Fs3);
bitdepth4 = (1411 * 1000) / (2 * Fs4);

fprintf("Bit Depths\n\n");
fprintf("file_example_WAV_1MG.wav  -> %f bits\n", bitdepth1);
fprintf("file_example_WAV_2MG.wav  -> %f bits\n", bitdepth2);
fprintf("file_example_WAV_5MG.wav  -> %f bits\n", bitdepth3);
fprintf("file_example_WAV_10MG.wav -> %f bits\n\n", bitdepth4);

%% Length of Audio Files
%    Duration = Total samples / Number of samples per second
% => Duration = Total samples / Sampling Frequency

dur1 = length(y1) / Fs1;
dur2 = length(y2) / Fs2;
dur3 = length(y3) / Fs3;
dur4 = length(y4) / Fs4;

fprintf("Length of Audio Files\n\n");
fprintf("file_example_WAV_1MG.wav  -> %f sec\n", dur1);
fprintf("file_example_WAV_2MG.wav  -> %f sec\n", dur2);
fprintf("file_example_WAV_5MG.wav  -> %f sec\n", dur3);
fprintf("file_example_WAV_10MG.wav -> %f sec\n\n", dur4);

%% NOTE: To run the audio files below whichever version you need to play and run

%% Playing the audio files

% sound(y1, Fs1);
% sound(y2, Fs2);
% sound(y3, Fs3);
% sound(y4, Fs4);

%% Lower sampling frequency

% sound(y4, 0.9 * Fs4);
% sound(y4, 0.8 * Fs4);
% sound(y4, 0.7 * Fs4);

%% Higher sampling freqency

% sound(y4, 1.2 * Fs4);
% sound(y4, 1.4 * Fs4);
% sound(y4, 1.6 * Fs4);

%{
	Observations

	Since all the audio files have a bit-depth of 16 bits, therefore we can say that the the ADC
	can perform quantizations with 2^(bit-depth) = 2^16 = 65536 levels.

	1) As sampling frequency increases,
	   - The signal gets compressed/squeezed in the time and expands in the frequency domain.
	   - This makes it seem as though the audio track is playing in fast-forward and has a higher frequency
	     than the original.

	2) As sampling freqeuncy decreases,
		- The signal gets streched in the time domain and is compressed in the frequency domain.
		- This makes it seem as though the audio track is being played at a slower speed and has a lower frequency
		  than the original.

	The Fourier Transform property that is being used here is the time-scaling property.
%}
