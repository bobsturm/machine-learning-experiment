function testcomputeCostGrad
	assert(false, 'This function should only be called in test mode!');

%!function testShouldRaiseErrorWhenNumRowsInXDoesNotMatchY
%! fail ('computeCostGrad([], [1], [])');
%! fail ('computeCostGrad([1], [1;2], [])');
%! fail ('computeCostGrad([1], [], [])');
%!endfunction

%!function testShouldRaiseErrorWhenFirstColInXNotSetToOnes
%! fail ('computeCostGrad([0], [1], [1])');
%! fail ('computeCostGrad([1 2; 2 3], [3; 7], [0.5; 1])');
%!endfunction

%!function testShouldRaiseErrorWhenNumRowsInThetaDoNotMatchNumColsInX
%! fail ('computeCostGrad([0], [1], [1; 2])');
%! fail ('computeCostGrad([1 2; 2 3], [3; 7], [0.5])');
%! fail ('computeCostGrad([1 2], [3], [])');
%!endfunction

%!function testShouldReturnZeroForEmptyMatrices
%! assert(computeCostGrad([], [], []), 0)
%!endfunction

%!function testShouldReturnZeroWithThetaAsZerosAndYsAsZeros
%! assert(computeCostGrad([1 3; 1 4; 1 5], [0; 0; 0], [0; 0]), 0);
%! assert(computeCostGrad([1 300], [0], [0; 0]), 0);
%!endfunction

%!function testShouldReturnZero
%! assert(computeCostGrad([1 2], [2], [0; 1]), 0);
%! assert(computeCostGrad([1 1; 1 2; 1 3], [1; 2; 3], [0; 1]), 0);
%!endfunction

%!function testShouldReturnCorrectValues
%! assert(computeCostGrad([1 2], [2], [0; 0]), 2);
%! assert(computeCostGrad([1 4], [2], [0; 1]), 2);
%! assert(computeCostGrad([1 .5; 1 1; 1 1.5; 1 2], [7; 7; 7; 7], [1; 2]), 6.75);
%!endfunction

%!function testShouldReturnCorrectValuesForMultipleFeatures
%! assert(computeCostGrad([1 .5 1; 1 1 2; 1 1.5 1; 1 2 2], [7; 7; 7; 7], [.5; 2; 3]), 2.625);
%!endfunction

%!test
%! testShouldRaiseErrorWhenNumRowsInXDoesNotMatchY();
%! testShouldRaiseErrorWhenFirstColInXNotSetToOnes();
%! testShouldRaiseErrorWhenNumRowsInThetaDoNotMatchNumColsInX();
%! testShouldReturnZeroForEmptyMatrices();
%! testShouldReturnZeroWithThetaAsZerosAndYsAsZeros();
%! testShouldReturnZero();
%! testShouldReturnCorrectValues();
%! testShouldReturnCorrectValuesForMultipleFeatures();
endfunction
