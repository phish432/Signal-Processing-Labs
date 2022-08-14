% Function that calculates the DTFT of discrete time signal
% 'x' where N0 is the location of sample x[0] and w is the 
% vector of frequencies at which to calculate the DTFT
% Using the formula
% X(e^(jw)) = \sum_{-\infty}^{\infty} (x[n] e^(-j w n))

function X = DT_Fourier(x, N0, w)

X = zeros(size(w));
lenx = length(x);

for i = 1:lenx
    X = X + x(i)*exp(-1j*w*(i-N0));
end

end
