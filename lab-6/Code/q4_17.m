fs = 10000;
N = 5;
A = [1:N].^(-2); % a_k = 1/k^2
P = zeros(1,N);

%% Q4(a)

F_notes = 50:5:100;
td_notes = ones(size(F_notes));
adsr = [0.2, 0.2, 0.7, 0.4, 0.2];

% Calculating the N-harmonics of each note in F_notes and playing it for
% corresponding time durations
y = my_synthesizer(A, F_notes, P, adsr, td_notes, fs);
soundsc(y, fs);
pause(sum(td_notes)+1);

%% Q4(b)

F_notes = 100:-10:40;
td_notes = ones(size(F_notes));
adsr = [0.2, 0.2, 0.7, 0.4, 0.2];

% Calculating the N-harmonics of each note in F_notes and playing it for
% corresponding time durations
y = my_synthesizer(A, F_notes, P, adsr, td_notes, fs);
soundsc(y, fs);
pause(sum(td_notes)+1);

%% Q4(c)
% Random notes generator
M = 5;
F_notes = 50 + 50*rand(1,M);
td_notes = 0.5 + rand(1,M);
adsr = [0.2, 0.2, 0.7, 0.4, 0.2];

% Calculating the N-harmonics of each note in F_notes and playing it for
% corresponding time durations
y = my_synthesizer(A, F_notes, P, adsr, td_notes, fs);
soundsc(y, fs);
pause(sum(td_notes)+1);

%% Q4(d)

% G-major scale for D4 to F#5
d = 294; e = 330; fS = 370; G = 392; A = 440; B = 494; CS = 554; D = 587; E = 659; FS = 740;

% Fast forward factor
ffwd = 1;

% Notes in the song
F_notes = [
	G, G, G, B, ...
	E, E, E, D, ...
	B, B, B, B ...
	fS, fS, fS, e, ...
	0, G, G, e, G, e, G, A, ...
	B, G, G, d, B, 0, G, G, G, ...
	fS, fS, fS, e, G, ...
	0, G, G, e, G, e, G, A, ...
	B, G, G, D, B, ...
	0, G, G, A, 0, B, B, B, ...
	G, G, G, B, ...
	E, E, E, D, ...
	B, B, B, B ...
	fS, fS, fS, B, B, B, ...
	G, G, G, B, ...
	E, E, E, D, ...
	B, B, B, B ...
	fS, fS, fS, B, B, B, B];

% Time durations of notes of the song
% Song Tempo ~ 86 bpm
% quarter note = 0.70 sec
% eigth note   = 0.35 sec

td_notes = (1/ffwd) * [0.7, 0.7, 0.7, 0.7, ...
	0.7, 0.7, 0.7, 0.7, ...
	0.7, 0.7, 0.7, 0.7, ...
	0.7, 0.7, 0.7, 0.7, ...
	0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35, ...
	0.7, 0.35, 0.35, 0.35, 2.45, 0.35, 0.35, 0.35, 0.35, ...
	1.05, 0.35, 0.35, 0.35, 0.7, ...
	0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35, ...
	0.7, 0.35, 0.35, 0.35, 2.45, ...
	0.35, 0.35, 0.35, 1.4, 0.35, 0.35, 0.35, 0.35, ...,
	0.7, 0.7, 0.7, 0.7, ...
	0.7, 0.7, 0.7, 0.7, ...
	0.7, 0.7, 0.7, 0.7, ...
	0.7, 0.7, 0.35, 0.35, 0.35, 0.35, ...
	0.7, 0.7, 0.7, 0.7, ...
	0.7, 0.7, 0.7, 0.7, ...
	0.7, 0.7, 0.7, 0.7, ...
	0.7, 0.7, 1.75, 0.35, 0.35, 0.35, 2.1];

adsr = [0.35, 0.35, 0.2, 0.1, 0.2];

% Calculating the N-harmonics of each note in F_notes and playing it for
% corresponding time durations
y = my_synthesizer(A, F_notes, P, adsr, td_notes, fs);

% Normalizing the final signal to avoid audio clipping
y = y/max(abs(y));
soundsc(y, fs);

%% Q4(e)

% Writing the audio file for the first 5 seconds
audiowrite('faded.wav', y(1:50000), fs);
disp(audioinfo('faded.wav'));