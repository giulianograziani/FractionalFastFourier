function psi = Normalchar(xc,wc,N)
if (nargin<3), N=2^12; end %it has to be a 2^n power
if (nargin<2), wc= 0;  end
if (nargin<1), xc=6;end

dk=1/(2*xc);
psi=zeros(length(N),1);
  
for x=1:N/2                                           %add eps to avoid log(0)
psi(x)= exp(-2*(pi*(x-1-N/2)*dk)^2)*exp(-1i*2*pi*wc*(x-1-N/2)*dk);
end

for x=(N/2)+1:N
psi(x)= exp(-2*(pi*(x-1-N/2)*dk)^2)*exp(-1i*2*pi*wc*(x-1-N/2)*dk);
end

psi=psi*dk;
end