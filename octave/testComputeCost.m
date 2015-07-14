function testComputeCost
	assert(false, 'This function should only be called in test mode!');

%!function testShouldRaiseErrorWhenNumRowsInXDoesNotMatchY
%! fail ('computeCost([], [1], [])');
%! fail ('computeCost([1], [1;2], [])');
%! fail ('computeCost([1], [], [])');
%!endfunction

%!function testShouldRaiseErrorWhenFirstColInXNotSetToOnes
%! fail ('computeCost([0], [1], [1])');
%! fail ('computeCost([1 2; 2 3], [3; 7], [0.5; 1])');
%!endfunction

%!function testShouldRaiseErrorWhenNumRowsInThetaDoNotMatchNumColsInX
%! fail ('computeCost([0], [1], [1; 2])');
%! fail ('computeCost([1 2; 2 3], [3; 7], [0.5])');
%! fail ('computeCost([1 2], [3], [])');
%!endfunction

%!function testShouldReturnZeroForEmptyMatrices
%! assert(computeCost([], [], []), 0)
%!endfunction

%!function testShouldReturnZeroWithThetaAsZerosAndYsAsZeros
%! assert(computeCost([1 3; 1 4; 1 5], [0; 0; 0], [0; 0]), 0);
%! assert(computeCost([1 300], [0], [0; 0]), 0);
%!endfunction

%!function testShouldReturnZero
%! assert(computeCost([1 2], [2], [0; 1]), 0);
%! assert(computeCost([1 1; 1 2; 1 3], [1; 2; 3], [0; 1]), 0);
%!endfunction

%!function testShouldReturnCorrectValues
%! assert(computeCost([1 2], [2], [0; 0]), 2);
%! assert(computeCost([1 4], [2], [0; 1]), 2);
%! assert(computeCost([1 .5; 1 1; 1 1.5; 1 2], [7; 7; 7; 7], [1; 2]), 6.75);
%!endfunction

%!function testShouldReturnCorrectValuesForMultipleFeatures
%! assert(computeCost([1 .5 1; 1 1 2; 1 1.5 1; 1 2 2], [7; 7; 7; 7], [.5; 2; 3]), 2.625);
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
