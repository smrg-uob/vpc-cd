function [B] = OutDel(A,d,t)

% A is the matrix
%d is the medfilt spacing
%t is the chosen threshold


B = A;

A2 = medfilt2(A,[d d]);
B(abs(A-A2)>t)=nan;
