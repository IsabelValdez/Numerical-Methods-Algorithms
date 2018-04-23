%% Homework 15
% LU Decomposition with partial pivoting
function [L, U, P] = luFactor(A)
% This function is desgined to use partial pivoting and LU decomposition to
% solve a single variable for a system of equations. 
% Inputs
% A - coefficient matrix
% Outputs
% L - lower triangular matrix
% U - upper triangular matrix
% P - pivot matrix

%Housekeeping 
clear
clc
%Check number of function inputs and outputs
if nargain < 1 %If not enough inputs, show error
    error('Please input coefficient matrix')
end
% set up variables
[m, n] = size(A);
L=eye(n);
P=eye(n);
U=A;
for k=1:m-1
    pivot=max(abs(U(k:m,k))); % find largest abs value
    for j=k:m
        if(abs(U(j,k))==pivot) %pivot largest abs value to top
            ind=j;
        end
    end
    U([k,ind],k:m)=U([ind,k],k:m); %interchange rows j and k in U
    L([k,ind],1:k-1)=L([ind,k],1:k-1); %interchange rows j and k in L
    P([k,ind],:)=P([ind,k],:); %interchange rows j and k in P
    %creating upper and lower matrix and pivoting. Repete untill all values
    %are eliminated if not in upper or lower matrix
    for j=k+1:m %placeholder
        L(j,k)=U(j,k)/U(k,k); 
        U(j,k:m)=U(j,k:m)-L(j,k)*U(k,k:m);
    end
end
