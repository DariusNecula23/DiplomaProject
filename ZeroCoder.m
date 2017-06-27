function [ output_signal ] = ZeroCoder( start_frequency )
%ZeroCoder Generate a signal over 0.2 seconds based on start frequency
%   Detailed explanation goes here

if start_frequency == 2
    first_part = Generate2kfr();
    second_part = Generate1kfr();
    output_signal = [first_part,second_part];
elseif start_frequency == 3
    first_part = Generate3kfr();
    second_part = Generate2kfr();
    output_signal = [first_part,second_part];
end

end

