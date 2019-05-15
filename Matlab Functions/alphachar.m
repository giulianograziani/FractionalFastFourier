function psi = alphachar(a,b,s,m,xc,wc,N)
if (nargin<7), N=2^12; end %it has to be a 2^n power
if (nargin<6), wc= 0;  end
if (nargin<5), xc=10;end
if (nargin<4), m=0; end  % c (0, infty) — scale parameter 
if (nargin<3), s=1; end  % mu(-infty , +infty) — location parameter
if (nargin<2), b=0.5;end    % b [-1, 1] — skewness parameter 
if (nargin<1), a=1.25;end   %a (0, 2] — stability parameter 
dk=1/(2*xc);
psi=zeros(length(N),1);
if (a==1)
  
for x=1:N/2                                           %add eps to avoid log(0)
psi(x)=exp(-abs(s*(x-1-N/2)*dk*2*pi)*...
(1+1i*b*(2/pi)*sign(2*pi*(x-1-N/2)*dk)*log(abs(s*(x-1-N/2)*2*pi*dk+eps)))+1i*m*(x-1-N/2)*dk*2*pi)*...
exp(-1i*2*pi*wc*(x-1-N/2)*dk);
end
for x=(N/2)+1:N
psi(x)=exp(-abs(s*(x-1-N/2)*dk*2*pi)*...
(1+1i*b*(2/pi)*sign((x-1-N/2)*dk*2*pi)*log(abs(s*(x-1-N/2)*dk*2*pi+eps)))+1i*m*(x-1-N/2)*dk*2*pi)*...
exp(-1i*2*pi*wc*(x-1-N/2)*dk);
end

else  % alpha different from 1
   
for x=1:N/2
psi(x)=exp( -(abs(s*(x-1-N/2)*dk*2*pi))^a *...
   (1+1i*b*tan(0.5*pi*a)*sign((x-1-N/2)*dk*2*pi)*((abs(s*(x-1-N/2)*dk*2*pi))^(1-a)-1))...
   +1i*m* (x-1-N/2)*dk*2*pi) *exp(-1i*2*pi*wc*(x-1-N/2)*dk);
end
%x(N/2+1)=0;
%(abs(s*(x-1-N/2)*dk*2*pi))^(1-a)= inf at 0
for x= (N/2)+1:N
psi(x)=exp( -(abs(s*(x-1-N/2)*dk*2*pi))^a*...
   (1+1i*b*tan(0.5*pi*a)*sign((x-1-N/2)*dk*2*pi)*((abs(s*(x-1-N/2)*dk*2*pi+eps))^(1-a)-1))...
   +1i*m* (x-1-N/2)*dk*2*pi)*exp(-1i*2*pi*wc*(x-1-N/2)*dk);
end
end 
psi=psi*dk;
end
