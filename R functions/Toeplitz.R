Toeplitz=function(row,col){
  ##check first row and first column have equal length
  if (length(row)!= length(col)){
    stop(' length r is different  from  length c, please insert correct values')
  }
  ##check first element is equal
  if (row[1] != col[1]){
  stop('the first row element is different  from the first column one, please insert correct values')
  }
  
  N=length(row);
  ##embedding the Toeplitz matrix into the circular 
  A=findQ_M(N);
  Q=A[1]
  M=A[2]
  ##create the first column of the circular matrix 
  ##following the equation() defined in the pdf
  v_Circ=vector('double',2^M)
  for (n in 1:N){
  v_Circ[n]=col[n]
  }
  lowb=N+Q+2
  uppb=2^M
  c=(lowb:uppb)
  ##element between N and N+Q already zero by vector function
  for (n in c) {
  a=abs(-(2*N+Q)+n-2)
  v_Circ[n]= row[a]
  }
  return(v_Circ)
}
}