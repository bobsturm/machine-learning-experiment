function J = computeCost(X, y, theta)

% Uses squared error cost function as described in Stanford CS 229

m = length(y); % number of training examples
J = 0;

if (size(X,1) != m)
	error ('number of rows in X is != length of y');
endif

if (size(theta, 1) != size(X, 2))
	error ('number of rows in theta != num cols in X')
endif

if (m == 0)
	return;
endif

if (sum(X(:, 1) != ones(m, 1)) != 0)
	error ('not all values in first column of X are set to 1')
endif

costs = ((X * theta) - y);
squares = costs .^2;
J = sum(squares, 1) / (2 * m);

endfunction
