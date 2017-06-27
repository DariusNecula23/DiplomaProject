function [ signal ] = GenerateHeader( )
%GenerateHeader Generates a signal of 500 Hz frequency over 20 miliseconds

Fs = 48000;                         % sampling frequency
T = 1/Fs;                           % sample time
f = 500;                            % signal frequency
L = 960;                            % length of signal (number of sample)
t = (0:L-1)*T;                      % time interval
signal = sin(2*pi*f*t);

end
