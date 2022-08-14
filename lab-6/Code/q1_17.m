% Defining the variables used throughout the question

fs = 10000;
A = [0.5, 0.5];
P = [0, 0];
%% Q1(a)

% Summing up 2 sinusoids of given frequencies
F1 = [350, 440];
x1n = SineSum(A, F1, P, 5, fs);

% Playing the output signal
% sound(x1n, fs);
% pause(5);

%% Q1(b)

% Summing up 2 sinusoids of given frequencies
F2 = [480, 620];
b1 = SineSum(A, F2, P, 0.5, fs);
z1 = SineSum(0, 0, 0, 0.5, fs);

% Concatenating the given signals according to question
x2n = [b1, z1, b1, z1, b1, z1, b1, z1];

% Playing the output signal
% sound(x2n);
% pause(5);

%% Q1(c)

% Summing up 2 sinusoids of given frequencies
F3 = [440, 480];
b2 = SineSum(A, F3, P, 2, fs);
z2 = SineSum(0, 0, 0, 2, fs);

% Concatenating the given signals according to question
x3n = [b2, z2, b2, z2, b2, z2, b2, z2];

% Playing the output signal
% sound(x3n);
% pause(9);

%% Q1(e)

% Starting a figure and plotting the below graphs
figure;

% Plotting the first graph
subplot(3,1,1);
plot(x1n(1:500));
title("350Hz + 440Hz");
ylabel("$x_1[n]$", "interpreter", "latex");
xlabel("$n$", "interpreter", "latex");
grid on;

% Plotting the second graph
subplot(3,1,2);
plot(x2n(1:500));
title("480 Hz + 620 Hz + 0-signal");
ylabel("$x_2[n]$", "interpreter", "latex");
xlabel("$n$", "interpreter", "latex");
grid on;

% Plotting the third graph
subplot(3,1,3);
plot(x3n(1:500));
title("440 Hz + 480 Hz + 0-signal");
ylabel("$x_3[n]$", "interpreter", "latex");
xlabel("$n$", "interpreter", "latex");
grid on;

%% Q1(d)

%{
    Yes these signals sound familiar. Part A gives us the dial tone, Part B
    gives us the engaged tone, and Part C gives us the call tone of a
    telephone.
%}