%This function runs the numerical_diff to print out
%the erorr for each h
% Test cases:
% A - Homework 1 problem 2
% B - Homework 1 problem 3 
% C - Homework 1 problem 4
% D - Homework 1 problem 5
%initial value of h
h0 = 0.1;
x0 = 1;  %(1/3)*pi;
%number of refinements of h
n = 17;
hvals=zeros(n,1);
for i=1:n
    hvals(i) = h0*(1/10^(i-1));
end


disp('   h           Approx Deriv      Error');
[approx_deriv,error]=numerical_diff('D',x0,hvals);
disp_vec = [hvals,approx_deriv,error];
format short e
disp(disp_vec);