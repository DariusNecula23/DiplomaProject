function [ bits_string ] = Decode( input_signal, frame_size )
%Decode returns the string of bits corresponding to the input signal
%   @input_signal - the input signal to be analiyed
%   @frame_size - length of a single sinewave (reprezented in number of
%   samples)

% Constants
hsig_length = 960;      % header and footer signal length
sig_length = length(input_signal);  % input signal of finite length

% Variables
offset = 1;             % the offset from which we start splitting the signal
ste_vector = [];        % Short Time Energy vector
ret = 0;                % Return value
header_index = 0;
data_index = 0;         % index in the signal where the data starts
bits_no = 0;            % number of output bits
bits_stream = [];       % the output bits stream

while (ret == 0)
    % Get a frame_size part of the signal to compute STE
    subsignal = SplitSignal(input_signal, frame_size, offset);
    % Compute STE for each pair of 2 elements of the subsignal
    ste_vector = ShortTimeEnergy(subsignal, 2);
    % Analyze the result ste vector and check for large energy differences
    ret = Analyze_STE(ste_vector);
    % Check the return value:
    % if 0 is returned then proceed to the next subsignal
    % if non-zero is returned then calculate the index of the header
    if (ret > 0)
        header_index = ret + offset;
    else
        offset = offset + frame_size - 2;
    end
end

% Calculate data_index and number of bits
data_index = header_index + hsig_length;
bits_no = ((sig_length - header_index + 1) - 2 * hsig_length) / (2 * frame_size);

while (bits_no > 0)
%     data_index
    subsignal1 = SplitSignal(input_signal, frame_size, data_index);
    subsignal2 = SplitSignal(input_signal, frame_size, data_index+frame_size);
    fr_estimate1 = EstimateFreq(subsignal1, frame_size);
    fr_estimate2 = EstimateFreq(subsignal2, frame_size);

    % Add the new found bit to the existing bit stream
    if ((fr_estimate1 - fr_estimate2) < 0)
        bits_stream = strcat(bits_stream, '1');
    else if ((fr_estimate1 - fr_estimate2) > 0)
        bits_stream = strcat(bits_stream, '0');
        end
    end

    data_index = data_index + 2 * frame_size;
    bits_no = bits_no - 1;
%     bits_stream
end

bits_string = bits_stream;

end