function [x,y,z,r] = SphereFitCGA(points)
% ** Input **
% points        :   n by 3 matrix cointaing 3D points
%
% ** Output *
% [x,y,z,r]     :   Fitted sphere position x,y,x and radius r

% Check number of datapoints
n = length(points(:,1));

% Solving using the Lagrange multiplier
% Homogeneous least squares problem
A = zeros(n,5);
for i = 1:n
    for j = 1:5
        if sum(eq(j,[1,2,3]))
            A(i,j) = points(i,j);
        elseif j == 4
            A(i,j) = -1;
        else
            A(i,j) = -0.5*(points(i,1)^2+points(i,2)^2+points(i,3)^2);
        end
    end
end

% Solve the eigenvalue problem
[V,D] = eig(A'*A);

% Choose the eigevector corrosponding to the smalest eigenvalue
% Matlab automatically place the smalest one in the first column
s = V(:,1);

% Solve the center sphere radius r and location x,y,z by comparing
% coeficcients
x = s(1)/s(5);
y = s(2)/s(5);
z = s(3)/s(5);
r = sqrt(x^2+y^2+z^2 - 2*s(4)/s(5));
