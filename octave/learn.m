clear ; close all; clc;

addpath("/Users/U0057799/Documents/development/machine-learning-excercises/mlclass-ex1-006/mlclass-ex1");
addpath("/Users/U0057799/Documents/development/machine-learning-excercises/mlclass-ex2-006/mlclass-ex2");
addpath("/Users/U0057799/Documents/development/machine-learning-excercises/mlclass-ex3-006/mlclass-ex3");

function theta = runAndShowModelCosts(X_train, y_train, X_val, y_val, description)
#	[J_train, J_val, J_mean_val, theta] = executeModel(X_train, y_train, 
#			X_val, y_val, @normalEqn, @featureNormalize, @computeCost);

#	fprintf("\n%s using normalEqn.  Costs:\n", description);
#	J_mean_val
#	J_val
#	J_train

	[J_train, J_val, J_mean_val, theta] = executeModel(X_train, y_train, 
		X_val, y_val, @(X, y)gradientDescentMulti(X, y, zeros(size(X, 2), 1), .01, 1000), @featureNormalize, @computePipelineCost);
		
	fprintf("\n%s using gradientDescent.  Costs:\n", description);

	mean_costs = bsxfun(@minus, y_val, mean(y_val));
	J_mean_val = sum(abs(mean_costs), 1) / length(y_val);

	J_mean_val
	J_val
	J_train
	
endfunction

function [filtered_X, filtered_y]  = filterMatrices(X, y)
	display("filtering out 0 values for totreprtabled");
	keeper_indices = find(y > 0);
	fprintf("number of rows kept: %d\n", length(keeper_indices));
	
	filtered_y = y(keeper_indices, :);
	filtered_X = X(keeper_indices, :);
endfunction

function validateMatrix(M)
	NAN = isnan(M);
	if (any(any(NAN)))
		error(sprintf("Matrix contains NaN!"));
	endif
endfunction

# "grsrcptspublicuse" "rcvdpdtngcd" "grsincfndrsng" "legalfees"
# these don't seem to help -> "grsrcptspublicuse" "grsincfndrsng" 
#columnNames = {"totrevenue" "totfuncexpns" "totassetsend" "totliabend" "legalfees" "officexpns" "travel" "grsrntsreal" "totnooforgscnt" "subseccd" "pubsupplesub509" "totreprtabled"};
# this one is NaN - filedlieuf1041cd, filedf8886tcd, distribtodonorcd -> I think they are very sparsely valued

columnNames = readColNames("/Users/U0057799/Documents/development/trta-machine-learning/data/2014/col-names.txt");

D_train = extractColsAsMatrix("/Users/U0057799/Documents/development/trta-machine-learning/data/2014/extracted-cols-990-training-set.txt", 
	columnNames, ",");

D_val = extractColsAsMatrix("/Users/U0057799/Documents/development/trta-machine-learning/data/2014/extracted-cols-990-validation-set.txt", 
	columnNames, ",");

n = size(D_train, 2) - 1;
X_train = D_train(:, 1:n);
y_train = D_train(:,n+1);
X_val = D_val(:, 1:n);
y_val = D_val(:,n+1);

#[X_train, y_train] = filterMatrices(X_train, y_train);
#[X_val, y_val] = filterMatrices(X_val, y_val);

#y_train(1, :)
#X_train(1, :)

#runAndShowModelCosts(X_train, y_train, X_val, y_val, "4 features");

#;@(X)(sin(X));@(X)(cos(X));@(X)(tan(X))
#;@(X)(abs(X));@(X)(bsxfun(@power, abs(X), .5))
#@(X)(bsxfun(@power, X, 2));@(X)(bsxfun(@power, X, 3))
# ;@(X)(bsxfun(@power, abs(X), .5))
#@(X)(abs(X))
# @(X)(log(abs(X))) -> issues with NaN in results when using this one

functions = {@(X)(bsxfun(@power, abs(X), .5))
				};
X_train = expandFeatures(X_train, functions);
X_val = expandFeatures(X_val, functions);

####################
display("moving on to logistic regression...");
X_train_log = [ones(size(X_train, 1),1) featureNormalize(X_train)];
#X_train_log(1:3)

y_train_log = y_train;
zero_indices = find(y_train_log == 0);
y_train_log(:) = 1;
y_train_log(zero_indices) = 0;

initial_theta = zeros(size(X_train_log, 2), 1);
lambda = 0;
options = optimset('GradObj', 'on', 'MaxIter', 400);

validateMatrix(X_train_log);
display("initial cost is");
[J, grad] = costFunctionReg(initial_theta, X_train_log, y_train_log, lambda);
J

p = sigmoid(X_train_log * initial_theta) > 0.5;
fprintf('Pre Train Accuracy: %f\n', mean(double(p == y_train_log)) * 100);

global global_theta_log
[global_theta_log, J, exit_flag] = fminunc(@(t)(costFunctionReg(t, X_train_log, y_train_log, lambda)), initial_theta, options);
#theta
J
exit_flag

% Compute accuracy on our training set
#X_train_log(1:3, :)
p = sigmoid(X_train_log * global_theta_log) > 0.5;

fprintf('Train Accuracy: %f\n', mean(double(p == y_train_log)) * 100);

#######
X_val_log = [ones(size(X_val, 1),1) featureNormalize(X_val)];
validateMatrix(X_val_log);

p = sigmoid(X_val_log * global_theta_log) > 0.5;

y_val_log = y_val;
zero_indices = find(y_val_log == 0);
y_val_log(:) = 1;
y_val_log(zero_indices) = 0;


[p(1:10, :) y_val_log(1:10, :)]

fprintf("validation accuracy: %f\n", mean(double(p == y_val_log)) * 100);

######################
fprintf("moving on to linear regression, with customized cost fn that includes logistic regression");

validateMatrix(X_train);
validateMatrix(X_val);

#plot(log(abs(X_train(:, 2))));

theta = runAndShowModelCosts(X_train, y_train, X_val, y_val, "Sqrt features added");

display("10 predictions from validation set - prediction | target/real value");

[X_norm, mu, sigma] = featureNormalize(X_val);
#predictions = [ones(size(X_norm, 1), 1) X_norm] * theta;
#[predictions(1:10) y_val(1:10)]

X_norm = [ones(size(X_norm, 1), 1) X_norm];
regressionPredictions = X_norm * theta;
logisticPredictions = sigmoid(X_norm * global_theta_log) > 0.5;
falseIndices = find(logisticPredictions == 0);
regressionPredictions(falseIndices) = 0;

fprintf("10 predictions from validation set - prediction | target/real value\n");
[regressionPredictions(1:100) y_val(1:100)]



