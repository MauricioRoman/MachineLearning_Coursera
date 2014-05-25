function [C, sigma] = dataset3Params(X, y, Xval, yval)
%dataset3Params returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = dataset3Params(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.

C = 1.0;
sigma = 1.0;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        
%

% To run training, we set this to 1
train = 0;

Cval = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigmaval = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

Cost = zeros(size(C,2), size(sigma,2));

if train==1,
	i = 1;
	for c = Cval,
		j = 1;
    	for s = sigmaval,
			model= svmTrain(X, y, c, @(x1, x2) gaussianKernel(x1, x2, s)); 
			fprintf('s = %f, c = %f\n', s,c);
			predictions = svmPredict(model, Xval);
			Cost(i,j) = mean(double(predictions ~= yval));
			fprintf('Cost is %f\n', Cost(i,j))
			pause;
			j += 1;
		end
		i += 1;
	end
end

% Found optimum values
C = 1.0;
sigma = 0.1;

% =========================================================================

end
