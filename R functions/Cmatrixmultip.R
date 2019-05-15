Cmatrixmultip=function(c,vec,Ways){
  if (length(c)!= length(vec)){
    stop('length c is different  from  length vec, please insert correct values')
  }
  c_hat=fft(c, inverse = FALSE)
  vec_hat=fft(vec,inverse = FALSE)
  switch(Ways,
         reg={
  prod=vector('double',length(c))
  prod=vec_hat*c_hat
  C=vector('double',length(c))
  C=fft(prod,inverse = TRUE)*(1/length(c))
  return(C)
  },
  inv={
  div=vector('double',length(c))
  div=vec_hat/c_hat
  C=vector('double',length(c))
  C=fft(div,inverse = TRUE)*(1/length(c))
  return(C)
  },
  stop('Ways can be either reg or inv'))
}
