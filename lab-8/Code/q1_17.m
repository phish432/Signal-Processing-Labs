%% 8.1 (b)

%% Inputs (uncomment as per need)

% p = 0.2;
% p = 0;
% p = [0, 0.75];
% p = [1, -0.75];
% p = [0.75, -0.75];
% p = [3, 3, 3];
% p = [0, 1, 2];
% p = [-0.5, 1j];
% p = [0, 1j, -1j];
% p = [1, -1, 2-1j, 2+1j];
% p = [1-1j, 1-2j, 1-3j, 2-1j];
% p = [1, -1, 1j, -1j];

%% Script calling the function

[N, ROC, ROC_zero] = region_of_convergence(p);

% Printing out the obtained function
fprintf("Below is the information computed : \n\n");

fprintf("N = %d\n", N);
fprintf("ROC = \n");
disp(ROC);
fprintf("ROC_zero = %d\n\n", ROC_zero);