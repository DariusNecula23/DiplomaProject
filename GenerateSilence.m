function [ silence_sig ] = GenerateSilence( length, freq )
%GenerateSilence Generates a signal to simulate silence
%   @length - the length of the signal represented in number of samples
%   @freq - the frequency of the signal

fs = 48000;
T = 1/fs;
ts = (0:length-1)*T;
silence_sig = sin(2*pi*freq*ts);

end

