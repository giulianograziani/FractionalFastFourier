
  findQ_M=function(N){
  #determine Q such that 2*N+Q=2^M 
  #where M is the smallest integer  2^M >_ 2*N
  M=0
  while (2^M < 2*N)
  {
  M=M+1
  }
  Q=2^M-2*N
  Q_M=c(Q,M)
  return(Q_M)
  }
  