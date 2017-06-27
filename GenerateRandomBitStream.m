function [ bit_stream ] = GenerateRandomBitStream( length )
%GenerateRandomBitStream Generates a random bit stream of given length
%   @length - the length of the bitstream (must be strictly positive)

bit_stream = [];
rand_vector = rand(1, length);

for i = 1 : length
    if (rand_vector(i) >= 0.5)
        bit_stream = strcat(bit_stream, '1');
    else
        bit_stream = strcat(bit_stream, '0');
    end
end

end

