function p = predict(theta, X)
%PREDICT Predict whether the label is 0 or 1 using learned logistic 
%regression parameters theta

p = sigmoid(X * theta) > 0.5;

end
