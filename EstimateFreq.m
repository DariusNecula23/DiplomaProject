function freq_estimate = EstimateFreq( input_signal, Nfft )
%EstimateFreq estimates the frequency of the given signal
%   @INPUT: input_signal - the signal to be analyzed

% Choose FFT size and calculate spectrum
fsamp = 48000;
%L = length(input_signal);
%Nfft = 2^nextpow2(L);
% Nfft = 10000;
%%
% Y = fft(input_signal,Nfft)/L;
% f = fsamp/2*linspace(0,1,Nfft/2+1);
% 
% % Plot single-sided amplitude spectrum.
% plot(f,2*abs(Y(1:Nfft/2+1))) 
% title('Single-Sided Amplitude Spectrum of y(t)')
% xlabel('Frequency (Hz)')
% ylabel('|Y(f)|')
% 
% %I added the next lines to find the value
% %find maximum value, it should be the fundamental frequency (approximated)
% [C,I] = max(2*abs(Y(1:Nfft/2+1)));
% freq_estimate = f(I);


%%
% [Pxx,f] = pwelch(input_signal,gausswin(Nfft),Nfft/2,Nfft,fsamp);
[Pxx,f] = pwelch(input_signal,rectwin(Nfft),Nfft/2,Nfft,fsamp);
% Plot frequency spectrum
% subplot(2,1,2);
% plot(f,Pxx);
% ylabel('PSD'); xlabel('Frequency (Hz)');
% grid on;

% Get frequency estimate (spectral peak)
[~,loc] = max(Pxx);
freq_estimate = f(loc);
% title(['Frequency estimate = ',num2str(freq_estimate),' Hz']);

end

