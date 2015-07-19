function J = computeCostGrad(X, y, theta)
% Uses squared error cost function as described in Stanford CS 229

J = 0;

[m, n] = computeCostInputValidation(X, y, theta, 0);

if (m == 0)
	return;
endif

costs = ((X * theta) - y);
squares = costs .^2;
J = sum(squares, 1) / (2 * m);

endfunction
