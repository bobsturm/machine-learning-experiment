function testCostFunctionLinReg
	assert(false, 'This function should only be called in test mode!');

%!function testShouldComputeCorrectValuesNoRegularization
%! [J, grad] = costFunctionLinReg([1], [1], [1], 0);
%! assert(J, 0);
%! assert(grad, [0]);
%! [J, grad] = costFunctionLinReg([1 1], [2], [1; 1], 0);
%! assert(J, 0);
%! assert(grad, [0 0]);
%! [J, grad] = costFunctionLinReg([1 1 1; 1 2 2; 1 3 3], [5; 5; 5], [0; 0; 0], 0);
%! assert(J, 12.5);
%! assert(grad, [-5 -10 -10]);
%!endfunction

%!function testShouldComputeCorrectValuesWithRegularization
%! fail('costFunctionLinReg([1], [1], [1], 1)', "regularization not yet implemented");
%!endfunction

%!test
%! testShouldComputeCorrectValuesNoRegularization();
%! testShouldComputeCorrectValuesWithRegularization();
endfunction
