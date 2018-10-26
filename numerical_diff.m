function [approx_deriv,error] = numerical_diff(test_case,x,hvals)
%function error = numerical_diff(test_case,x,hvals)
%demostrates errors and convergence rates for approximating derivatives of
%a function f(specified below) at x for 
%a sequence of values of hvals
%PC MA428

xvals = x*ones(size(hvals));
xvalsplush = xvals + hvals;
xvalsminush = xvals - hvals;
xvalsminus2h = xvals - 2*hvals;
xvalsplus2h = xvals + 2*hvals;

xvalsplush_2 = xvals + 0.5*hvals;
xvalsminush_2 = xvals - 0.5*hvals;


%f=inline('exp(sin(x))');
%f=inline('sin(x)');
f = inline('log(x)');
%derivf=inline('cos(x)');
derivf = inline('1./x');
deriv2f = inline('-1./(x.^2)');

%derivf=inline('exp(sin(x)).*cos(x)');
fx= f(xvals);
fxplush = f(xvalsplush);
fxminush = f(xvalsminush);
fxminus2h = f(xvalsminus2h);
fxplush_2 = f(xvalsplush_2);
fxminush_2 = f(xvalsminush_2);

fxplus2h = f(xvalsplus2h);

true_deriv = derivf(xvals);
true_deriv2 = deriv2f(xvals);
switch(test_case)
    case'A' %Homework 1 Problem 2
            approx_deriv = ((-3*fx)+(4*fxplush)-fxplus2h)./(2*hvals);
            error = abs(approx_deriv - true_deriv);
    case 'B' %Homework 1 Problem 3
            approx_deriv = (fxplus2h-fxminush)./(3*hvals);
            error = abs(approx_deriv - true_deriv);            
    case 'C'%Homework 1 Problem 4
            approx_deriv = (fxminus2h-(2*fxminush)+fx)./(hvals.^2);
            error = abs(approx_deriv - true_deriv2);
    case 'D' %Homework 1 Problem 5
            approx_deriv = ((1*fx) -(2*fxplush)+(1*fxplus2h))./(hvals.^2);
            error = abs(approx_deriv - true_deriv2);
end        

end
        
        
        
        