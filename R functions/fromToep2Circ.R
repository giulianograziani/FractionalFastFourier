fromToep2Circ=function(N,M,Q){
  #create the first column of the circular matrix 
 v_Circ=vector('double',2^M) 
 for(n in 1:N){
   v_Circ[n]=n-1; 
 }
  #element between N and N+Q already zero by zeros function
 a=N+Q+2
 b=2^M
  for(n in a:b){
    v_Circ[n]= -(2*N+Q)+n-1
  }
 return(v_Circ)
}


