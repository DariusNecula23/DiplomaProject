function [ signal ] = Encode( bitsArray )
%Encode generates a signal corresponding to the input bits stream 
%   @bitsArray - an array of bits to be modulated as a signal

% silence = GenerateSilence(50, 10);
header = GenerateHeader();
bit02 = ZeroCoder(2);
bit03 = ZeroCoder(3);
bit11 = OneCoder(1);
bit12 = OneCoder(2);

last1code = 0;
last0code = 0;

% signal = [silence, header];
signal = header;
fin = length(bitsArray);
for i = 1:fin
   if (bitsArray(i) == '0') && (i == 1)
       signal = [signal, bit02];
       last0code = 2;
   elseif (bitsArray(i) == '0') && (bitsArray(i-1) == '0') && (last0code == 2)
       signal = [signal, bit03];
       last0code = 3;
   elseif (bitsArray(i) == '0') && (bitsArray(i-1) == '0') && (last0code == 3)
       signal = [signal, bit02];
       last0code = 2;
   elseif (bitsArray(i) == '0') && (bitsArray(i-1) == '1')
       signal = [signal, bit02];
       last0code = 2;
   elseif (bitsArray(i) == '1') && (i == 1)
       signal = [signal, bit11];
       last1code = 1;
   elseif (bitsArray(i) == '1') && (bitsArray(i-1) == '1') && (last1code == 1)
       signal = [signal, bit12];
       last1code = 2;
   elseif (bitsArray(i) == '1') && (bitsArray(i-1) == '1') && (last1code == 2)
       signal = [signal, bit11];
       last1code = 1;
   elseif (bitsArray(i) == '1') && (bitsArray(i-1) == '0')
       signal = [signal, bit11];
       last1code = 1;
   end
end

signal = [signal, header];
end