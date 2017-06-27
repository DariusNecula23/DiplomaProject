bit_stream = GenerateRandomBitStream(2)
s = Encode(bit_stream);
N = length(s);
% ls = linspace(0, N-1, N);
% figure
% plot(ls, s);
% title('Signal');
% xlabel('Time (miliseconds)');
% ylabel('Frequency (Hz)');

Fs = 48000;
% T = 1/Fs;
% t = (0:N-1)*T;
% fn = 10;
% noise = sin(2*pi*fn*t);
noise = 0.0007*randn(1,N);
% length(noise)
ts = s + noise;
% length(ts)

snr_val = mean( s .^ 2 ) / mean( noise .^ 2 );
snr_db = 10 * log10( snr_val ) % in dB

L2 = length(ts);
ls = linspace(0, L2-1, L2);
% figure
% plot(ls, ts);
% title('Signal and noise');
% xlabel('Time (miliseconds)');
% ylabel('Frequency (Hz)');

% obs = Decode(ts, 1000)
obs = Decode(s, 1000)

% snR = snr(s, noise)