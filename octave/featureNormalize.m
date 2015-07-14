function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 

[X_norm, mu, sigma] = zscore(X);

endfunction
