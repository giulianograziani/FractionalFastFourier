function v_Circ = fromToep2Circ(N,M,Q)
 %create the first column of the circular matrix 
 %following the equation() defined in the pdf
 v_Circ=zeros(2^M,1);
 for n=1:N
     v_Circ(n)=n-1;
 end
 %element between N and N+Q already zero by zeros function
 for n= N+Q+2: 2^M
 v_Circ(n)= -(2*N+Q)+n-1;
 end
 
end



