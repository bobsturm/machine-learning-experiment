function testFeatureNormalization
	assert(false, 'This function should only be called in test mode!');

%!function shouldReturnZeroLengthVectorsWhenXHasZeroRows
%! [X_norm, mu, sigma] = featureNormalize([]);
%! assert(size(X_norm, 1) == 0);
%! assert(size(X_norm, 2) == 0);
%! assert(length(mu) == 0);
%! assert(length(sigma) == 0);
%!endfunction

%!function shouldReturnZero
%! [X_norm, mu, sigma] = featureNormalize([1]);
%! assert(mu, [1]);
%! assert(sigma, [0]);
%! assert(X_norm, [0]);
%!endfunction

%!function shouldReturnZero2
%! [X_norm, mu, sigma] = featureNormalize([0]);
%! assert(mu, [0]);
%! assert(sigma, [0]);
%! assert(X_norm, [0]);
%!endfunction

%!function shouldReturnZeros
%! [X_norm, mu, sigma] = featureNormalize([1 2; 1 2]);
%! assert(mu, [1 2]);
%! assert(sigma, [0 0]);
%! assert(X_norm, [0 0; 0 0]);
%!endfunction

%!function shouldCalculateCorrectValues
%! [X_norm, mu, sigma] = featureNormalize([0 1; 1 2; 2 3]);
%! assert(mu, [1 2]);
%! assert(sigma, [1 1]);
%! assert(X_norm, [-1 -1;0 0;1 1]);
%!endfunction

%!test
%! shouldReturnZeroLengthVectorsWhenXHasZeroRows();
%! shouldReturnZero();
%! shouldReturnZero2();
%! shouldReturnZeros();
%! shouldCalculateCorrectValues();
endfunction
