function [n1,n2,n3,d] = PlaneFitCGA(points)
% ** Input **
% points        :   n by 3 matrix cointaing 3D points
%
% ** Output *
% [n1,n2,n3,d]  :   Fitted plane normal n1, n2, n3 and distance from origion d

% Check number of datapoints
n = length(points(:,1));

% Solving using the Lagrange multiplier
% Homogeneous least squares problem
A = zeros(n,4);
for i = 1:n
    A(i,1:4) = [points(i,1),points(i,2),points(i,3),-1];
end

% Solve the eigenvalue problem
[V,D] = eig(A'*A);

% Choose the eigevector corrosponding to the smalest eigenvalue
% Matlab automatically place the smalest one in the first column
s = V(:,1);

% Solve the center plane normal n1, n2, n3 and distance to plane from
% origion
n1 = s(1);
n2 = s(2);
n3 = s(3);
d = s(4);


end