function g = sigmoid(z)
%SIGMOID Compute sigmoid function for z
%   g = SIGMOID(z) computes the sigmoid of z.

g = 1 ./ (1 .+ (e .^ (-z)));

end
