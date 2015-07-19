
function [J, grad] = costFunctionLinReg(X, y, theta, lambda)

  if (lambda != 0)
    error("regularization not yet implemented");
  endif

  J = 0;
  grad = [];
  
  [m, n] = computeCostInputValidation(X, y, theta, lambda);
  
  difs = (predictLinear(theta, X) - y);

  squares = difs .^2;
  J = sum(squares, 1) / (2 * m); % Use 1/2 squared error by convention -- will work either way

	presum = bsxfun(@times, difs, X);

  grad = sum(presum, 1) ./ m; % do not multiply by 2 because of the 1/2 on the J above, which cancels the 2 here.    

endfunction