function testGradientDescent
	assert(false, 'This function should only be called in test mode!');

%!function shouldRaiseErrorWhenNumItersNegative
%! fail ('gradientDescent([], [], [], 0.0, -1)');
%!endfunction

%!function shouldRaiseErrorWhenAlphaNegative
%! fail ('gradientDescent([1 3], [7], [1; 2], -0.01, 1)');
%!endfunction

%!function shouldRaiseErrorWhenNumRowsInXDoesNotMatchY
%! fail ('gradientDescent([], [1], [], 0.01, 10)');
%! fail ('gradientDescent([1], [1;2], [], 0.01, 10)');
%! fail ('gradientDescent([1], [], [], 0.01, 10)');
%!endfunction

%!function shouldRaiseErrorWhenFirstColInXNotSetToZeros
%! fail ('gradientDescent([0], [1], [1], 0.01, 10)');
%! fail ('gradientDescent([2], [3], [], 0.01, 10)');
%!endfunction

%!function shouldReturnSameThetaWhenNumItersIsZero
%! [theta, J_history] = gradientDescent([1 0], [1], [1; 2], 0.01, 0);
%! assert(theta, [1; 2]);
%! [theta, J_history] = gradientDescent([1 0 2], [1], [0.5; 3.1; 7.76], 0.01, 0);
%! assert(theta, [0.5; 3.1; 7.76]);
%!endfunction

%!function shouldReturnCorrectValuesForThetaVector
%! %theta = gradientDescent([1 0 1; 1 2 3], [2; 4], [0; 1; 2], 2, 1);
%! %assert(theta, [-4; -7; -10]);
%! %theta = gradientDescent([1 0], [1], [0; 1], 1, 1);
%! %assert(theta, [1; 1]);
%! %theta = gradientDescent([1 1 1 1; 1 2 2 2; 1 3 3 3], [10; 8; 6], [1; 1; 1; 1], 1, 1);
%! %assert(theta, [2; -(1/3); -(1/3); -(1/3)], 0.00001);
%! theta = gradientDescent([1 1 1 1; 1 2 2 2; 1 3 3 3], [10; 8; 6], [1; 1; 1; 1], 1, 2);
%! assert(theta, [10; 15; 15; 15], 0.00001);
%! theta = gradientDescent([1 1 1 1; 1 2 2 2; 1 3 3 3], [10; 8; 6], [1; 1; 1; 1], 1, 3);
%! assert(theta, [-82; -200.33; -200.33; -200.33], 0.01);
%!endfunction

%!test
%! shouldRaiseErrorWhenNumItersNegative();
%! shouldRaiseErrorWhenAlphaNegative();
%! shouldRaiseErrorWhenNumRowsInXDoesNotMatchY();
%! shouldRaiseErrorWhenFirstColInXNotSetToZeros();
%! shouldReturnSameThetaWhenNumItersIsZero();
%! shouldReturnCorrectValuesForThetaVector();
endfunction
