function [ signal ] = Generate1kfr( )
%Generate1kfr Generate a signal of 1 kHz frequency over 0.1 seconds

Fs = 48000;                         % sampling frequency
T = 1/Fs;                           % sample time
f = 1000;                           % signal frequency
L = 4800;                           % length of signal
t = (0:L-1)*T;                      % time interval
signal = sin(2*pi*f*t);

end

