function testCostFunctionLogReg
	assert(false, 'This function should only be called in test mode!');

%!function testShouldReturnEmptyMatricesForEmptyMatrices
%! [J, gradients] = costFunctionLogReg([], [], [], 0);
%! assert(J, 0);
%! assert(length(gradients), 0);
%!endfunction

%!function testCostValues
%! [J, grad] = costFunctionLogReg([1 2], [1], [0; 0], 0);
%! assert(J, -1 * log(.5))
%! [J, grad] = costFunctionLogReg([1 0; 1 1], [0; 1], [0; 1], 0);
%! assert(J, (1/2) * (-log(1 - .5) + (-1 * (log(1 / (1 + e^-1))))));
%!endfunction

%!function testGradientValues
%! [J, grad] = costFunctionLogReg([1 2], [1], [0; 0], 0);
%! assert(grad, [-.5; -1])
%! [J, grad] = costFunctionLogReg([1 0; 1 1], [0; 1], [0; 1], 0);
%! assert(grad, [0.11553; -0.13447], 0.001);
%!endfunction

%!function testCostValuesWhenLamdaIsOne
%! [J, grad] = costFunctionLogReg([1 2], [1], [0; 0], 1);
%! assert(J, (-1 * log(.5)))
%! theta = [0; 1];
%! X = [1 0; 1 1];
%! n = length(theta);
%! additionalCost = 1 / (2 * 2) * sum(theta(2 : n) .^ 2);
%! [J, grad] = costFunctionLogReg(X, [0; 1], theta, 1);
%! assert(J, ((1/2) * (-log(1 - .5) + (-1 * (log(1 / (1 + e^-1)))))) + additionalCost);
%! %theta(1) below should not be 0 as is in the previous test -- does not work well because it does not test the removal of theta(0) from regularization
%! [J, grad] = costFunctionLogReg(X, [0; 1], [1; 1], 1);
%! assert(J, 0.97009, 0.0001);
%!endfunction

%!function testGradientValuesWhenLamdaIsOne
%! [J, grad] = costFunctionLogReg([1 2], [1], [0; 0], 1);
%! assert(grad, [-.5; -1]);
%! theta = [0; 1];
%! X = [1 0; 1 1];
%! n = length(theta);
%! additionalCost = 1 / (2 * 2) * sum(theta(2 : n) .^ 2);
%! [J, grad] = costFunctionLogReg(X, [0; 1], theta, 1);
%! assert(grad, [0.11553; -0.13447] + [0; 1/2 * 1], 0.001);
%! [J, grad] = costFunctionLogReg(X, [0; 1], [1; 1], 1);
%! assert(grad, [0.30593; 0.44040], 0.001);
%!endfunction

%!test
%! testCostValues();
%! testShouldReturnEmptyMatricesForEmptyMatrices();
%! testGradientValues();
%! testCostValuesWhenLamdaIsOne();
%! testGradientValuesWhenLamdaIsOne();
endfunction
