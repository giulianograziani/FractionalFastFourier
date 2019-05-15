Tmatrixmultip=function(Trow,Tcol,vec,Ways){
## check first row and first column have equal length 
if (length(Trow) != length(Tcol)){
stop(' length Trow (%i) is different  from  length Tcol (%i), please insert correct values')}

##check first element is equal
if (Trow[1] != Tcol[1]){
  stop('the first row element is different  from the first column one, please insert correct values')
}
## only the n original values  are the ones that we need to evaluate the product
len=length(vec);
##obtain the embedding for the Toepltizt matrix
lambda=Toeplitz(Trow,Tcol);
##padding with 0 the vector in order to mantain the cardinality
vec2=vector('double',length(lambda));
for (j in  1: len){
vec2[j]=vec[j]
}
lambda_hat=fft(lambda,inverse = FALSE)
vec2_hat=fft(vec2,inverse = FALSE)
T=vector('double',length(vec2_hat))
C=vector('double',len)
#### given the expression T*v= b ####
##find b ##
  switch(Ways,
    reg={
    T=lambda_hat*vec2_hat
    T=fft(T,inverse=TRUE)*(1/length(lambda_hat))
    ##select only first N-element
    for (i in 1: len){
      C[i]=T[i]
    }
    return(C)
  },
   inv={
     
     T=vec2_hat/lambda_hat
     T=fft(T,inverse=TRUE)*(1/length(lambda_hat))
     ##select only first N-element
     for (i in 1: len){
       C[i]=T[i]
     }
    return(C)
  } ,
  stop('Ways can be either reg or inv'))
}
