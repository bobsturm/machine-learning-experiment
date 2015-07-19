function testComputeCostInputValidation
	assert(false, 'This function should only be called in test mode!');

%!function testShouldRaiseErrorWhenNumRowsInXDoesNotMatchY
%! fail('computeCostInputValidation([], [1], [], 0)', "number of rows in X is != length of y");
%! fail('computeCostInputValidation([1 2; 1 3], [], [], 0)', "number of rows in X is != length of y");
%! fail('computeCostInputValidation([1 2], [1; 2], [], 0)', "number of rows in X is != length of y");
%!endfunction

%!function testShouldRaiseErrorWhenFirstColInXNotSetToOnes
%! fail ('computeCostInputValidation([0], [1], [1], 0)', "not all values in first column of X are set to 1");
%! fail ('computeCostInputValidation([1 2; 2 3], [3; 7], [0.5; 1], 0)', "not all values in first column of X are set to 1");
%!endfunction

%!function testShouldRaiseErrorWhenNumRowsInThetaDoNotMatchNumColsInX
%! fail ('computeCostInputValidation([0], [1], [1; 2], 0)', "number of rows in theta != num cols in X");
%! fail ('computeCostInputValidation([1 2; 2 3], [3; 7], [0.5], 0)', "number of rows in theta != num cols in X");
%! fail ('computeCostInputValidation([1 2], [3], [], 0)', "number of rows in theta != num cols in X");
%!endfunction

%!function testShouldReturnZeroForEmptyMatrices
%! assert(computeCostInputValidation([], [], [], 0, @(X)(X)), 0);
%!endfunction

%!test
%! testShouldRaiseErrorWhenNumRowsInXDoesNotMatchY();
%! testShouldRaiseErrorWhenFirstColInXNotSetToOnes();
%! testShouldRaiseErrorWhenNumRowsInThetaDoNotMatchNumColsInX();
%! testShouldReturnZeroForEmptyMatrices();
endfunction
