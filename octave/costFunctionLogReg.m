function [J, grad] = costFunctionLogReg(X, y, theta, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization

  J = 0;
  grad = [];
  
  [m, n] = computeCostInputValidation(X, y, theta, lambda);

  if (m == 0)
    return;
  endif
  
  logisticRegressionResults = sigmoid(X * theta);

  J = sum((-y .* log(logisticRegressionResults)) - ((1 - y) .* log(1 - logisticRegressionResults))) / m;

  # Add regularized cost term
  J = J + (lambda / (2 * m) * sum(theta(2 : n) .^ 2));

  #grad = sum((logisticRegressionResults - y) .* X, 1)'  / m;
  grad = sum(bsxfun(@times, logisticRegressionResults - y, X), 1)' / m;

  ## Now add regularization to gradient
  regularizedGradientVector = zeros(n, 1);

  regularizedGradientVector(2 : n) = (lambda / m) * theta(2 : n);

  grad = grad + regularizedGradientVector;

end
