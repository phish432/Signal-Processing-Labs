function [N, ROC, ROC_zero] = region_of_convergence(p)

p_0 = unique(abs(p));               % Keep the unique elements and in sorted order

if p_0(1) == 0
    ROC_zero = 0;                   % If 0 is one of the poles, it cannot lie inside any ROC
    p_0 = [p_0, Inf];               % Convert p_0 to the form of [0, ..., Inf]
    
else
    ROC_zero = 1;                   % If  0 is not a pole, it lies in one of the possible ROCs
    p_0 = [0, p_0, Inf];            % Convert p_0 to the form of [0, ..., Inf]
    
end

N = length(p_0) - 1;                % The total possible ROCs is (no. of poles + 1) = [(no. of poles + (0, Inf)] - 1)

ROC = zeros(N, 2);                  % Initialize ROC matrix
for i = 1:N
    ROC(i, 1) = p_0(i);
    ROC(i, 2) = p_0(i + 1);
end
