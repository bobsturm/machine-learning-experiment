function [J_train, J_val, theta] = executeModel(X_train, y_train, X_val, y_val, theta, learn_func, cost_func)

m_train = size(X_train, 1);
n_train = size(X_train, 2);
m_val = size(X_val, 1);
n_val = size(X_val, 2);
theta_length = length(theta);

if (size(y_train, 2) != 1)
	error("expected row vector for y_train");
endif

if (size(y_val, 2) != 1)
	error("expected row vector for y_val");
endif

if (n_train != n_val)
	error("number of features in training set != number of features in validation set");
endif

if (m_train != length(y_train))
	error("number of y_train entries != training entries");
endif

if (m_val != length(y_val))
	error("number of y_val entries != validation entries");
endif

if (n_val != (theta_length - 1) || n_train != (theta_length - 1))
  error("theta row vector does not match to the training set feature #s or the validation set feature #s");
endif

X_train_norm = [ones(m_train, 1) X_train];

X_val_norm = [ones(m_val, 1) X_val];

J_val = cost_func(X_val_norm, y_val, theta);

fprintf("Pre-training cost is %d against validation set with theta = \n", J_val);
fprintf("%d\n", theta);

theta = learn_func(X_train_norm, y_train, theta);

J_train = cost_func(X_train_norm, y_train, theta);

fprintf("Post-training cost is %d against training set with theta = \n", J_train);
fprintf("%d\n", theta);

J_val = cost_func(X_val_norm, y_val, theta);

fprintf("Post-training cost is %d against validation set (theta same as above)\n", J_val);
endfunction