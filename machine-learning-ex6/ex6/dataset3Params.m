function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
% model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 

%C_vals = [0.01 0.03 0.1 0.3 1, 3, 10 30];
%sigma_vals = [0.01 0.03 0.1 0.3 1, 3, 10 30];

ress = zeros(64,3); % to store c,sigma and corresponding prediction errors
i = 0;
for C_vals = [0.01 0.03 0.1 0.3 1, 3, 10 30]
	for sigma_vals = [0.01 0.03 0.1 0.3 1, 3, 10 30]
		i=i+1;
		model= svmTrain(X, y, C_vals, @(x1, x2) gaussianKernel(x1, x2, sigma_vals)); 
		predictions = svmPredict(model, Xval);
		pred_error = mean(double(predictions ~= yval));
		ress(i,:) = [C_vals,sigma_vals,pred_error];
	end
end

C = sortrows(ress,3)(1,1);
sigma = sortrows(ress,3)(1,2);

% =========================================================================

end
