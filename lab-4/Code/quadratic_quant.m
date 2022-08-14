function y = quadratic_quant(x, B, a)
len = length(x);
y = zeros(len, 1);

% We generate the divisions of the interval [-1, 1]
% Part above [0, 1); is divided into 2^(B-1) parts
% Part above [-1, 0); is divided into 2^(B-1) parts
div = -1:1/2^(B-1):1;

% To get the range here we square the same x[n] and 
% to preserve size
range = - a * sign(div).*div.*div;
lvl = length(div);

for m = 1:len
	% Special case when sample is in [1, +inf]
	if x(m) >= range(1)
		y(m) = range(1);

	% Special case when sample is in [-inf, 0]
	elseif x(m) < range(lvl)
		y(m) = range(lvl);

	% Else we find the range in which the sample lies
	% And assign it the average value of that range
	else
		for n = 2:lvl
			if x(m) >= range(n)
				y(m) = (range(n-1) + range(n)) / 2;
				break;
			end
		end
	end
end