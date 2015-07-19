function [m, n] = computeCostInputValidation(X, y, theta, lambda)

% Uses squared error cost function as described in Stanford CS 229

m = length(y); % number of training examples
n = size(X, 2); % number of features

J = 0;
grad = zeros(n, 1);

if (size(X,1) != m)
	error ('number of rows in X is != length of y');
endif

if (size(theta, 1) != n)
	error ('number of rows in theta != num cols in X')
endif

if (m == 0)
	return;
endif

if (sum(X(:, 1) != ones(m, 1)) != 0)
	error ('not all values in first column of X are set to 1')
endif

endfunction
