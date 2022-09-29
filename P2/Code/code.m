%% Step 1: Initialization
clear
close all
clc
pkg load communications

alphabet_count = 10;
temp = 50;

%% Step 2: Loading audio wav file
% Read the data back into MATLAB , and listen to audio.
[y, Fs] = audioread('voice.wav');

% Play wav file
player = audioplayer(y, Fs);
play(player);


%% Step 3:
% Symbol rate = Fs
fprintf("Symbol rate: %d [symbols/second]\n", Fs);

% Number of symbols
disp("Shape of audio file:");
disp(size(y));
n = size(y, 1);
ch = size(y, 2);
fprintf("Number of symbols: %d\n", n);
fprintf("Each symbol has %d channels.\n", ch);

% Time of audio file
t = Fs \ n;
fprintf("Time: %d\n", t);
fprintf("---------------------------------------------\n");

% Separating channels
% Comparing histograms shows the equality
% of two channels
y_1 = y(:, 1);

% Type of middle symbol
middle_symbol = y_1(floor(n/2))(1);
fprintf("Middle symbol type: %s\n", class(middle_symbol));

% Middle symbol
fprintf("Middle symbol value: %f\n", middle_symbol);
fprintf("---------------------------------------------\n");

% Min symbol
fprintf("Min symbol value: %f\n", min(y_1));

% Max symbol
fprintf("Max symbol value: %f\n", max(y_1));

% Mean symbol
fprintf("Mean of symbols: %f\n", mean(y_1));
fprintf("---------------------------------------------\n");

%y_casted = y_1 * (histogram_count - 1);
%y_casted = uint8(y_casted);
%y_casted = y_casted + 1;

alphabet = 1:alphabet_count;
partition  = linspace(-1.0, 1.0, alphabet_count-2);
[index, quantized] = quantiz(y_1, partition, alphabet);
quantized = uint8(quantized);

histo = hist(y_1, temp);
hist_quantized = hist(quantized, alphabet_count);

%% Step 4:
% Plot histogram
hist(y_1, temp, 'FaceColor', 'red');
colormap(summer ());
grid on;

% Probability distribution
p = hist_quantized / sum(hist_quantized);
p_org = histo / sum(histo);
fprintf("Sum of probabilities: %d\n", sum(p));
fprintf("---------------------------------------------\n");

% Entropy
entropy = -sum(p_org .* log2(p_org));
fprintf("Entropy: %d\n", entropy);
fprintf("---------------------------------------------\n");


%% Step 5: Huffman encoding compress
dict = huffmandict(alphabet, p);
encoded = huffmanenco(quantized, dict);

% Save
audiowrite('voice_compressed.wav', encoded, Fs);

% Compare
org_bin = de2bi(quantized);
org_len = numel(org_bin);
comp_bin = de2bi(encoded);
comp_len = numel(comp_bin);
fprintf("Original file bit length: %d\n", org_len);
fprintf("Compressed file bit length: %d\n", comp_len);
