function f = frft(pn,e)
%%check epsilon 
if (e  > 1) || (e < 0)
error( 'epsilon has to be a value between 0 and 1')
end
N=length(pn);
eta= e/N;         
f=zeros(N,1);%output
% find Q and M
[Q,M]=findQ_M(N);
%define  the vector q(2^M)
q=zeros(2^M,1);                   %from  n: N+1 to 2^M -> q(n)=0
for n= 1:N                        %negative frequencies and then  positive 
    q(n)= pn(n)* exp(-1i*pi*eta*(n-1-N/2)^2);
end
%define the col vector that specifies  the circ. Matrix
circMat=fromToep2Circ(N,M,Q);
c=zeros(2^M,1);
for n=1:2^M
    c(n)=exp(1i*pi*eta*(circMat(n)^2));
end
%fft on c and q
q_hat=fft(q);
lambda=fft(c);
%matrix vector multiplication
f_hat=q_hat.*lambda;
f_2n=ifft(f_hat); 
%select only first N element + shift
for n =1: N                       
    f(n)=real(f_2n(n)*exp(-1i*pi*eta*((n-1)-N/2)^2));
end
end