%% Homework 9
% False Position Algorithm Development
function [root fx ea iter] = falsePosition(func,x1,xu,es,maxiter)
%This function uses the false position theorum for root estimation which
%uses two guessed points connected by a sloped line and re-evaluating the
%formula.
%Inputs:
%func = the function being evaluated in terms of x
%x1 = lower guess
%xu = upper guess
%es = desired relative error
%maxiter = desired number of iterations
%Outputs:
%root = estimates root loation
%fx = funtion evaluated at root location
%ea = approximate relative error (%)
%iter = number of iterations performed

%Check number of function inputs and outputs
if nargain < 3 %If not enough inputs, show error
    error('Not enough inputs, minumum of 3')
end
if nargain < 4 || isempty(es) %If only 4 or no es, default es (using
    %example code from class for the bisect function)
    es=0.0001;
end
if nargain < 5 || esempty(maxiter)%If only 5 or no maxiter, default maxiter
    %(using example code from class for the bisect function)
    maxiter=200;
end
%Housekeeping (clearing workspace and command window)
clear
clc
%Initalize variables
iter=0; root=0; t=1;
%Check if root can be found
if func(x1)==0||func(xu)==0 %root was guessed correctly
    fprintf('\n Root is equal to one of the brackets')
    t=0;
end
if func(x1)*func(xu)>0 %root is not between brackets
    error('signs of brackets have to be opposite otherwise no root exists between the brackets')
    t=0;
end
%estimating and solving
while t==1
    rtold=root;
    root=double(xu-(((func(xu))*(x1-xu))/(func(x1)-func(xu))));
    if root~=0
        ea=abs((root-rtold)/root)*100;
    end
    fx=func(root);
    iter=iter+1;
    if ea<=es||iter>=maxiter
        t=0;
        fprintf('\n The root estimate is %4.4f',root)
        fprintf('\n The relative error is %4.sf percent',ea)
        fprintf('\n Function evaluated at approximation =%4.4f',fx)
        fprintf('\n Number of iterations: %4.2f',iter)
    elseif func(x1)*func(root)<0
        xu=root;
    elseif func(x1)*func(root)>0
        x1=root;
    end
end 