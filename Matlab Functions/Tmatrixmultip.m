function T = Tmatrixmultip(Trow,Tcol,vec,varargin)

defaultMultiplication = 'reg';
expectedMultiplication = {'reg','inv'};

p=inputParser;
p.CaseSensitive = false;
validNum = @(x)  isnumeric(x);
addRequired(p,'Trow',validNum);
addRequired(p,'Tcol',validNum);
addRequired(p,'vec',validNum);
addParameter(p,'Ways',defaultMultiplication, @(x) any(validatestring(x,expectedMultiplication)));
parse(p,Trow,Tcol,vec,varargin{:});
%% check first row and first column have equal length 
if length(Trow) ~= length(Tcol)
error(' length Trow (%i) is different  from  length Tcol (%i), please insert correct values',length(Trow),length(Tcol))
end
%%check first element is equal
if Trow(1) ~= Tcol(1)
error(' the first row element (%i) is different  from the first column one (%i), please insert correct values',Trow(1),Tcol(1))
end
%% only the n original values  are the ones that we need to evaluate the product
len=length(vec);
T=zeros(len,1);
%%obtain the embedding for the Toepltizt matrix
lambda=Toeplitz(Trow,Tcol);
%%padding with 0 the vector in order to mantain the cardinality
vec2=zeros(length(lambda),1);
for j = 1: len
    vec2(j)=vec(j);
end
%%%%% given the expression T*v= b %%%%%%%
%%find b %%%%
if strcmp(p.Results.Ways, 'reg')
  C= ifft(fft(lambda).*fft(vec2));
  %select only first N element 
    for n =1: len
    T(n)=C(n);
    end
end
%%find v %%%%
if strcmp(p.Results.Ways, 'inv')
  C= ifft( fft(vec2)./fft(lambda));
    %select only first N element 
     for n =1: len
     T(n)=C(n);
     end
end

end
