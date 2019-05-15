frft=function(pn,e){
if( any(e < 0 | e > 1) ) stop('epsilon has to be a value between 0 and 1')
N=length(pn)
eta= e/N;         
f=vector('double',N);         #output
#find Q and M
A=findQ_M(N);
Q=A[1]
M=A[2]
#define  the vector q(2^M)
q=vector('double',2^M);       #from  n: N+1 to 2^M -> q(n)=0
for (n in 1:N ){              #negative frequencies and then  positive 
q[n]= pn[n]* exp(-1i*pi*eta*(n-1-N/2)^2);
}
#define the col vector that specifies  the circ. Matrix
circMat=fromToep2Circ(N,M,Q);
c=vector('double',2^M);
for (n in 1:(2^M)){
c[n]=exp(1i*pi*eta*(circMat[n]^2));
}
#fft on c and q
q_hat=fft(q,inverse = FALSE);
lambda=fft(c,inverse = FALSE);
#matrix vector multiplication
f_hat=vector('double',2^M);
f_hat=q_hat*lambda;
f_2n=fft(f_hat,inverse= TRUE)*(1/(2^M));             
for (n in 1: N  ){                 #select only first N element + shift
f[n]=Re(f_2n[n]*exp(-1i*pi*eta*((n-1)-N/2)^2));
}
return(f)
}
  
