function [J_train, J_val, J_mean_val, theta] = executeModel(X_train, y_train, X_val, y_val, learn_func, normalize_func, cost_func)

m_train = size(X_train, 1);
n_train = size(X_train, 2);
m_val = size(X_val, 1);
n_val = size(X_val, 2);

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

X_train_norm = [ones(m_train, 1) normalize_func(X_train)];

theta = learn_func(X_train_norm, y_train);

J_train = cost_func(X_train_norm, y_train, theta);

X_val_norm = [ones(m_val, 1) normalize_func(X_val)];

J_val = cost_func(X_val_norm, y_val, theta);

y_mean = [y_val; y_train];
mean_costs = bsxfun(@minus, y_mean, mean(y_mean));
squares = mean_costs .^2;
J_mean_val = sum(squares) / (2 * m_val);

endfunction