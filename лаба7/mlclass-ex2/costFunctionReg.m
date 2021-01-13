function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
% Countiong h from theta
h_theta = sigmoid(X * theta);

% Create theta with first zero -> no sum on begining
theta_z = theta;
theta_z(1,1) = 0;

% Counting addition
regularization = lambda * theta_z'*theta_z/(2*m);

% Counting cost func
J = sum(-y .* log(h_theta) - (1 - y) .* log(1 - h_theta)) / m + regularization;

% And gradient
grad = X'*(h_theta - y)/m + lambda*theta_z/m;




% =============================================================

end
