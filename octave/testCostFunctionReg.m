function testCostFunctionReg
	assert(false, 'This function should only be called in test mode!');

%!function testShouldRaiseErrorWhenNumRowsInXDoesNotMatchY
%! fail ('costFunctionReg([], [], [1], 0)');
%! fail ('costFunctionReg([], [1], [1;2], 0)');
%! fail ('costFunctionReg([], [1], [], 0)');
%!endfunction

%!function testShouldRaiseErrorWhenFirstColInXNotSetToOnes
%! fail ('costFunctionReg([1], [0], [1], 0)');
%! fail ('costFunctionReg([0.5; 1], [1 2; 2 3], [3; 7], 0)');
%!endfunction

%!function testShouldRaiseErrorWhenNumRowsInThetaDoNotMatchNumColsInX
%! fail ('costFunctionReg([1; 2], [0], [1], 0)');
%! fail ('costFunctionReg([0.5], [1 2; 2 3], [3; 7], 0)');
%! fail ('costFunctionReg([], [1 2], [3], 0)');
%!endfunction

%!function testShouldReturnEmptyMatricesForEmptyMatrices
%! [jVal, gradients] = costFunctionReg([], [], [], 0);
%! assert(jVal, []);
%! assert(gradients, []);
%!endfunction

%!function testCostValuesWhenLamdaIsZero
%! [jVal, grad] = costFunctionReg([0; 0], [1 2], [1], 0);
%! assert(jVal, -1 * log(.5))
%! [jVal, grad] = costFunctionReg([0; 1], [1 0; 1 1], [0; 1], 0);
%! assert(jVal, (1/2) * (-log(1 - .5) + (-1 * (log(1 / (1 + e^-1))))));
%!endfunction

%!function testGradientValuesWhenLamdaIsZero
%! [jVal, grad] = costFunctionReg([0; 0], [1 2], [1], 0);
%! assert(grad, [-.5; -1])
%! [jVal, grad] = costFunctionReg([0; 1], [1 0; 1 1], [0; 1], 0);
%! assert(grad, [0.11553; -0.13447], 0.001);
%!endfunction

%!function testCostValuesWhenLamdaIsOne
%! [jVal, grad] = costFunctionReg([0; 0], [1 2], [1], 1);
%! assert(jVal, (-1 * log(.5)))
%! theta = [0; 1];
%! X = [1 0; 1 1];
%! n = length(theta);
%! additionalCost = 1 / (2 * 2) * sum(theta(2 : n) .^ 2);
%! [jVal, grad] = costFunctionReg(theta, X, [0; 1], 1);
%! assert(jVal, ((1/2) * (-log(1 - .5) + (-1 * (log(1 / (1 + e^-1)))))) + additionalCost);
%! %theta(1) below should not be 0 as is in the previous test -- does not work well because it does not test the removal of theta(0) from regularization
%! [jVal, grad] = costFunctionReg([1; 1], X, [0; 1], 1);
%! assert(jVal, 0.97009, 0.0001);
%!endfunction

%!function testGradientValuesWhenLamdaIsOne
%! [jVal, grad] = costFunctionReg([0; 0], [1 2], [1], 1);
%! assert(grad, [-.5; -1])
%! theta = [0; 1];
%! X = [1 0; 1 1];
%! n = length(theta);
%! additionalCost = 1 / (2 * 2) * sum(theta(2 : n) .^ 2);
%! [jVal, grad] = costFunctionReg(theta, X, [0; 1], 1);
%! assert(grad, [0.11553; -0.13447] + [0; 1/2 * 1], 0.001);
%! [jVal, grad] = costFunctionReg([1; 1], X, [0; 1], 1);
%! assert(grad, [0.30593; 0.44040], 0.001);
%!endfunction

%!test
%! testShouldRaiseErrorWhenNumRowsInXDoesNotMatchY();
%! testShouldRaiseErrorWhenFirstColInXNotSetToOnes();
%! testShouldRaiseErrorWhenNumRowsInThetaDoNotMatchNumColsInX();
%! testShouldReturnEmptyMatricesForEmptyMatrices();
%! testCostValuesWhenLamdaIsZero();
%! testGradientValuesWhenLamdaIsZero();
%! testCostValuesWhenLamdaIsOne();
%! testGradientValuesWhenLamdaIsOne();

endfunction
