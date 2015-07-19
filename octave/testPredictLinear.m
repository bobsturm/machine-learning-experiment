function testPredictLogistic
	assert(false, 'This function should only be called in test mode!');

%!function testShouldReturnEmptyVector
%! p = predictLinear([], []);
%! assert(size(p), [0 0]);
%!endfunction

%!function testShouldReturnSingle1By1VectorWith0
%! assert(predictLinear([1; 1], [0 0]), [0]);
%!endfunction

%!function testShouldReturnSingle1By1VectorWith200
%! assert(predictLinear([1; 1], [100 100]), [200]);
%!endfunction

%!function testShouldReturnCorrectVector
%! assert(predictLinear([1; 2; 3], [0 0 0; 1 1 1; 1 2 3]), [0; 6; 14]);
%!endfunction

%!test
%! testShouldReturnEmptyVector();
%! testShouldReturnSingle1By1VectorWith0();
%! testShouldReturnSingle1By1VectorWith200();
%! testShouldReturnCorrectVector();
endfunction
