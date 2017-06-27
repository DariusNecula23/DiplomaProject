correct_result = 0;
incorrect_result = 0;
bit_stream_length = 10;

for i = 1 : 100
    input_bit_stream = GenerateRandomBitStream(bit_stream_length);
    coded_signal = Encode(input_bit_stream);
    output_bit_stream = Decode(coded_signal, 1000);
    
    if (strcmp(input_bit_stream, output_bit_stream) == 1)
        correct_result = correct_result + 1;
    else
        incorrect_result = incorrect_result + 1;
    end
end

Correctness_percent = 100 * (correct_result / correct_result + incorrect_result)