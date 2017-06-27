function subsignal = SplitSignal( input_signal, length, offset)
%SplitSignal returns the subsignal from input_signal
%   @input_signal - the signal from which subsignal will be selected
%   @length - the length of the subsignal
%   @offset - starting offset

subsignal = input_signal(offset:offset+length-1);

end

