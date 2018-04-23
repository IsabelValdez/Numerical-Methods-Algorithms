# Numerical-Methods-Algorithms README
This repository contains MATLAB functions created for MECH 105: *Numerical Methods for Engineers* in the spring of 2018
## Reason for creation
These functions were created for MECH 105 in the spring of 2018. As a first year student taking *Numerical Methods for Engineers,* creating these functions taught me how to numerically think through problems and use MATLAB more effectivly.  These algorithms are still a work in progress.
## Function Definitions
In order to run one of these functions you must call it using its name and input the correct information. 
### falsePosition(func,x1,xu,es,maxiter)
This function uses the false position theorem for root estimation by using two guessed points, which have to be input, and then connecting them by a sloped line. It then re-evaluates the formula to adjust the points, in tern adjusting the line, untill it has converged upon the answer.

Inputs:
* func = the function being evaluated in terms of x
* x1 = lower guess
* xu = upper guess
* es = desired relative error
* maxiter = desired number of iterations

Outputs:
* root = estimates root location
* fx = funtion evaluated at root location
* ea = approximate relative error (%)
* iter = number of iterations performed
### luFactor(A)
This function is desgined to find the LU decomposition of an initial coefficient matrix, using partial pivoting, to solve a single variable for a system of equations. 

Inputs
* A - coefficient matrix

Outputs
* L - lower triangular matrix
* U - upper triangular matrix
* P - pivot matrix
### Simpson(x,y)
This functionn numerically integrates function values y with respect to x

Inputs
* x: x vector of inputs
* y: y vector of inputs

Outputs
* I: value of the integral
