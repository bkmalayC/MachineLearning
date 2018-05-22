function[J_theta0 , J_theta1] = calcderiv(X, y, theta , alpha , m)
k = X*theta ;
J_theta0 = sum(k - y)*(alpha/m) ;
J_theta1 = sum((k - y).*X(:,2))*(alpha/m) ;
end 