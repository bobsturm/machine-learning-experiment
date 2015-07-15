function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 

X_norm = [];
mu = [];
sigma = [];

if (size(X, 1) == 0)
  return;
endif

[X_norm, mu, sigma] = zscore(X);

endfunction
