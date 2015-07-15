function testPredict
	assert(false, 'This function should only be called in test mode!');

%!function testShouldReturnEmptyVector
%! p = predict([], []);
%! assert(size(p), [0 0]);
%!endfunction

%!function testShouldReturnSingle1By1VectorWith0
%! assert(predict([1; 1], [0 0]), [false]);
%!endfunction

%!function testShouldReturnSingle1By1VectorWith1
%! assert(predict([1; 1], [100 100]), [true]);
%!endfunction

%!function testShouldReturnCorrectVector
%! assert(predict([1; 1], [100 100; 0 0; 90 90]), [true; false; true]);
%!endfunction

%!test
%! testShouldReturnEmptyVector();
%! testShouldReturnSingle1By1VectorWith0();
%! testShouldReturnSingle1By1VectorWith1();
%! testShouldReturnCorrectVector();
endfunction
