function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

%Build the cost function for regularized logistic regression
%Calculate h(x) using sigmoid function

k = X*theta ;   %to get X'theta

h = sigmoid(k) ; %To get h(x) for each element in x'theta

J1 = (sum(-y.*log(h) - (1-y).*log(1-h)))/m ; % To claculate main part of the cost function

lg_cost = sum(theta(2:end).^2)*lambda/(2*m) ;

J = (J1 + lg_cost) ; % cost function calculated

%   Calculate gradient 0 (theta 0)

g = sum((h - y).*X(:,1))/m ;
grad(1) = g ;

for i = 2:length(grad)
    g = sum((h-y).*X(:, i))/m + (lambda*theta(i)/m);
    grad(i) = g ;
end 
grad = grad(:);

end