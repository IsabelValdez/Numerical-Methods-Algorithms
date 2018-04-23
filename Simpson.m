%% Homework 21
% Simpson's 1/3 rule
function [I] = Simpson(x,y)
%This functionn numerically integrates function values y with respect to x
%Inputs
%x: x vector of inputs
%y: y vector of inputs
%Outputs
%I: value of the integral

%Set size of vectors
[~,m]=size(x);
[~,m1]=size(y);
%Error Check
if nargin~=2
    error('Your input values must be two vectors')
elseif m~=m1
  error('The x and y vectors must be the same length')
elseif isvector(x)==0||isvector(y)==0
    error('Inputs must be vectors')
elseif (m<3)||(m1<3)
    error('More data points required')
end
if max(2.^diff(x))-min(2.^diff(x))~=0
    error('x matrix must be equally spaced')
end

%If even number of intervals use Simpson's 1/3 Rule
Traptest=mod(m,2);
%Only using Simpson's 1/3 Rule
if Traptest==1 
%Assigning variables
    fx0=y(1);
    fx1=4*(sum(y(2:2:m1-1)));
    fx2=2*(sum(y(3:2:m1-2)));
    fxn=y(m1);
%Formula for Simpson's 1/3 Rule
    I=(x(m)-x(1))*((fx0+fx1+fx2+fxn)/(3*(m-1)));
else %If odd number of intervals use Trapezoidal Rule for last interval
warning('Number of intervals is odd so Trapezoidal Rule is needed')
%Use Simpson's 1/3 Rule on all but last interval
%Assigning variables
    fx0=y(1);
    fx1=4*(sum(y(2:2:m1-2)));
    fx2=2*(sum(y(3:2:m1-3)));
    fxn=y(m1-1);
%Formula for Simpson's 1/3 Rule
    I=(x(m-1)-x(1))*((fx0+fx1+fx2+fxn)/(3*(m-1)));
%Use Trapezoidal rule for last interval
    t=(x(m)-x(m-1))*((y(m-1)+y(m))/2);
%Add last interval to the rest for your total integral value
    I=I+t;
end
end