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

%% x(t)
x = sin(2 * pi * 50 * t);

subplot(3, 2, 1);
plot(t, x);
title('x(t)');
xlabel('Time (s)');
ylabel('Amp');

%% h(t)
h = 2 * sinc(2 * pi * 25 * t);

subplot(3, 2, 3);
plot(t, h);
title('h(t)');
xlabel('Time (s)');
ylabel('Amp');

%% y(t) = x(t) * h(t)
y = conv(x, h);

subplot(3, 2, 5);
plot(y);
title('y(t)');
xlabel('Time (s)');
ylabel('Amp');

%% X(w)
[freq, M] = FFT(x, fs);

subplot(3, 2, 2);
plot(freq, abs(M));
title('X(w)');
xlabel('Freq (Hz)');
ylabel('abs(M)');
xlim([-1.5e-8 1.5e-8]);

%% H(w)
[freq, M] = FFT(h, fs);

subplot(3, 2, 4);
plot(freq, abs(M));
title('H(w)');
xlabel('Freq (Hz)');
ylabel('abs(M)');
xlim([-1.5e-8 1.5e-8]);

%% Y(w)
[freq, M] = FFT(y, fs);

subplot(3, 2, 6);
plot(freq, abs(M));
title('Y(w)');
xlabel('Freq (Hz)');
ylabel('abs(M)');
xlim([-1.5e-8 1.5e-8]);
