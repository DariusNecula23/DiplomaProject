function [ output_signal ] = OneCoder( start_frequency )
%OneCoder Generate a signal 0.2 seconds based on the start frequency
% If start_frequency is 1 
%   the first part of the signal is the 1k frequency signal
%   the second part of the signal is the 2k frequncy signal
% If start_frequency is 2 
%   the first part of the signal is the 2k frequency signal
%   the second part of the signal is the 3k frequncy signal

if start_frequency == 1
    first_part = Generate1kfr();
    second_part = Generate2kfr();
    output_signal = [first_part,second_part];
elseif start_frequency == 2
    first_part = Generate2kfr();
    second_part = Generate3kfr();
    output_signal = [first_part,second_part];
end

end

