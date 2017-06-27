function ste = ShortTimeEnergy( signal, window_length )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

ste = sum(buffer(signal.^2, window_length, 1)) / length(signal);

end

