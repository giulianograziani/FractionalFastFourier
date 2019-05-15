function C = Cmatrixmultip(c,vec,varargin)
warning('c must be the first column  of the Circular Matrix')
if length(c)~= length(vec)
     error('length c  (%i) is different  from  length vec (%i), please insert correct values',length(c),length(vec))
end
defaultMultiplication = 'reg';
expectedMultiplication = {'reg','inv'};

p=inputParser;
p.CaseSensitive = false;
validScalarPosNum = @(x)  isnumeric(x);
addRequired(p,'c',validScalarPosNum);
addRequired(p,'vec',validScalarPosNum);
addParameter(p,'Ways',defaultMultiplication, @(x) any(validatestring(x,expectedMultiplication)));
parse(p,c,vec,varargin{:});

if strcmp(p.Results.Ways, 'reg')
  C = ifft(fft(c).*fft(vec));
end

if strcmp(p.Results.Ways, 'inv')
  C = ifft( fft(vec)./fft(c));
end

end

