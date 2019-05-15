function v_Circ = Toeplitz ( row,col )
%default values
if (nargin <2), col=(0:5); end          % it has to be an even value
if (nargin <1), row=(0:-1:-5);end   
%% check first row and first column have equal length 
if length(row) ~= length(col)
error(' length r  (%i) is different  from  length c (%i), please insert correct values',length(row),length(col))
end
%%check first element is equal
if row(1) ~= col(1)
error(' the first row element (%i) is different  from the first column one (%i), please insert correct values',row(1),col(1))
end

N=length(row);
%%embedding the Toeplitz matrix into the circular 
[Q,M]=findQ_M(N);
 %create the first column of the circular matrix 
 %following the equation() defined in the pdf
 v_Circ=zeros(2^M,1);
 for n=1:N
     v_Circ(n)=col(n);
 end
 %element between N and N+Q already zero by zeros function
 for n= N+Q+2: 2^M
 a=abs(-(2*N+Q)+n-2);
 v_Circ(n)= row(a);
 end
 
end



