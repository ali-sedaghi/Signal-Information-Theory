%%
clear
close all
clc

%%
figure
fs = 100e3;
fm = 1000;
T0 = -100 / fm;
Tf = 100 / fm;
Ts = 1 / fs;
t = T0:Ts:Tf;

%% Sawtooth
m = sawtooth(2 * pi * 50 * t);
[freq, M] = FFT(m, fs);

subplot(3, 2, 1);
plot(t, m);
title('Message Signal');
xlabel('Time (s)');
ylabel('Amp');

subplot(3, 2, 2);
plot(freq, abs(M));
title('Messgae Spectrum');
xlabel('Freq (Hz)');
ylabel('abs(M)');
xlim([-3e-8 3e-8]);

%% Square
m = square(2 * pi * 50 * t);
[freq, M] = FFT(m, fs);

subplot(3, 2, 3);
plot(t, m);
title('Message Signal');
xlabel('Time (s)');
ylabel('Amp');

subplot(3, 2, 4);
plot(freq, abs(M));
title('Messgae Spectrum');
xlabel('Freq (Hz)');
ylabel('abs(M)');
xlim([-3e-8 3e-8]);

%% Pulstran
fs = 100e9;
D = [2.5 10 17.5]' * 1e-9; % pulse delay times
t = 0 : 1/fs : 2500/fs; % signal evaluation time
w = 1e-9; % width of each pulse
m = pulstran(t, D, @rectpuls, w);
[freq, M] = FFT(m, fs);

subplot(3, 2, 5);
plot(t, m);
title('Message Signal');
xlabel('Time (s)');
ylabel('Amp');

subplot(3, 2, 6);
plot(freq, abs(M));
title('Messgae Spectrum');
xlabel('Freq (Hz)');
ylabel('abs(M)');
xlim([-3e-8 3e-8]);
