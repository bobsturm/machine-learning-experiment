function testExecuteModel
	assert(false, 'This function should only be called in test mode!');

%!function testInvalidInputs
%! fail('executeModel([2 2; 3 3], [3 2;3 2], [2 2], [3], [0; 0], @gradientDescent, @computeCostGrad)', 
%!	"expected row vector for y_train");
%!
%! fail('executeModel([2 2; 3 3], [3;2], [2 2], [3 2], [0; 0], @gradientDescent, @computeCostGrad)', 
%!	"expected row vector for y_val");
%!
%! fail('executeModel([2;3], [3;3], [2 2], [3], [0; 0], @gradientDescent, @computeCostGrad)', 
%!	"number of features in training set != number of features in validation set");
%!
%! fail('executeModel([2 2; 3 3], [3], [2 2], [3], [0; 0], @gradientDescent, @computeCostGrad)', 
%!	"number of y_train entries != training entries");
%!
%! fail('executeModel([2 2; 3 3], [3;2], [2 2], [3;1], [0; 0], @gradientDescent, @computeCostGrad)', 
%!	"number of y_val entries != validation entries");
%!
%! fail('executeModel([2 2; 3 3], [3;2], [2 2], [3], [0; 0], @gradientDescent, @computeCostGrad)', 
%!	"theta row vector does not match to the training set feature #s or the validation set feature #s");
%!endfunction

%!function testBasicCall
%! X = [1 1 1; 2 2 2; 3 3 3];
%! y = [10; 8; 6];
%! X_with_bias = [ones(size(X, 1), 1) X];
%! theta = [0; 0; 0; 0];
%! [theta_grad_desc, J_hist] = gradientDescent(X_with_bias, y, theta, .1, 50);
%! [J_train, J_val, theta_r] = executeModel(X, y, X, y, theta,
%!		@(X, y, theta)gradientDescent(X, y, theta, .1, 50), @computeCostGrad);
%! assert(theta_r, theta_grad_desc);
%! assert(J_train, computeCostGrad(X_with_bias, y, theta_r));
%! assert(J_val, computeCostGrad(X_with_bias, y, theta_r));
%!endfunction

%!test
%! testInvalidInputs();
%! testBasicCall();
endfunction