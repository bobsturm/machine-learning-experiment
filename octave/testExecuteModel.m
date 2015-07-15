function testExecuteModel
	assert(false, 'This function should only be called in test mode!');

%!function testInvalidInputs
%! fail('executeModel([2 2; 3 3], [3 2;3 2], [2 2], [3], @gradientDescent, @featureNormalize, @computeCostGrad)', 
%!	"expected row vector for y_train");
%!
%! fail('executeModel([2 2; 3 3], [3;2], [2 2], [3 2], @gradientDescent, @featureNormalize, @computeCostGrad)', 
%!	"expected row vector for y_val");
%!
%! fail('executeModel([2;3], [3;3], [2 2], [3], @gradientDescent, @featureNormalize, @computeCostGrad)', 
%!	"number of features in training set != number of features in validation set");
%!
%! fail('executeModel([2 2; 3 3], [3], [2 2], [3], @gradientDescent, @featureNormalize, @computeCostGrad)', 
%!	"number of y_train entries != training entries");
%!
%! fail('executeModel([2 2; 3 3], [3;2], [2 2], [3;1], @gradientDescent, @featureNormalize, @computeCostGrad)', 
%!	"number of y_val entries != validation entries");
%!endfunction

%!function testBasicCall
%! X = [1 1 1; 2 2 2; 3 3 3];
%! y = [10; 8; 6];
%! [J_train, J_val, J_mean_val, theta_r] = executeModel(X, y, X, y,
%!		@(X, y)gradientDescent(X, y, [0;0;0;0], 1, 3), @featureNormalize, @computeCostGrad);
%! theta = [8; -1.3333; -1.3333; -1.3333];
%! assert(theta_r, theta, 0.001);
%! X_with_bias = [ones(size(X, 1), 1) featureNormalize(X)];
%! assert(J_train, computeCostGrad(X_with_bias, y, theta), 1);
%! assert(J_val, computeCostGrad(X_with_bias, y, theta), 1);
%!endfunction

%!test
%! testInvalidInputs();
%! testBasicCall();
endfunction