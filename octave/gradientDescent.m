function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta

m = length(y); % number of training examples

if (num_iters < 0)
	error ('num_iters cannot be negative');
endif

if (alpha <= 0.0)
	error ('alpha must be positive');
endif

if (size(X,1) != m)
	error ('number of rows in X is != length of y');
endif

if (size(theta, 1) != size(X, 2))
	error ('number of rows in theta != num cols in X')
endif

if (sum(X(:, 1) != ones(m, 1)) != 0)
	error ('not all values in first column of X are set to 1')
endif

if (m == 0)
	return;
endif

J_history = zeros(num_iters, 1);

for iter = 1:num_iters
	
	costs = ((X * theta) - y);
	presum = bsxfun(@times, costs, X);
  delta = ((1 / m) * sum(presum, 1));
  theta = theta - (alpha * (delta'));
    
  J_history(iter) = computeCostGrad(X, y, theta);
end

endfunction
