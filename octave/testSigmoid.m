function testSigmoid
	assert(false, 'This function should only be called in test mode!');

%!function testShouldReturnPoint5
%! assert(sigmoid(0), 0.5)
%!endfunction

%!function testShouldReturnPoint5_Matrix
%! assert(sigmoid([0; 0; 0]), [0.5; 0.5; 0.5])
%! assert(sigmoid([0 0 0]), [0.5 0.5 0.5])
%! assert(sigmoid([0 0; 0 0]), [0.5 0.5; 0.5 0.5])
%!endfunction

%!function testShouldReturnCloseTo1
%! assert(sigmoid(1000000), 1, .01)
%!endfunction

%!function testShouldReturnCloseTo0
%! assert(sigmoid(-1000000), 0, .01)
%!endfunction

%!function testShouldReturnNumberGreaterThanPoint5
%! assert(sigmoid(.1) > .5)
%!endfunction

%!function testShouldReturnNumberLessThanPoint5
%! assert(sigmoid(-.1) < .5)
%!endfunction

%!test
%! testShouldReturnPoint5();
%! testShouldReturnPoint5_Matrix();
%! testShouldReturnCloseTo1();
%! testShouldReturnCloseTo0();
%! testShouldReturnNumberGreaterThanPoint5();
%! testShouldReturnNumberLessThanPoint5();

endfunction
