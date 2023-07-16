function [freq, M] = FFT(m, fs)
N = numel(m);
interval = -N / 2 : N / 2 - 1;
w = 2 * pi * fs;
k = interval / w;
freq = (2 * pi / N) * k;
M = fftshift(fft(m));
end