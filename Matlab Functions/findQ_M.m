function [Q,M] = findQ_M(N)
%determine Q such that 2*N+Q=2^M 
%where M is the smallest integer  2^M >_ 2*N
if (nargin <1)  N=5; end
M=0;
 while 2^M < 2*N
   M=M+1;
 end
   Q=2^M-2*N;
   M= M;
end