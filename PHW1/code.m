%% clear console
clc
close all

%% define signal
fs = 100;
T0 = 0;
Tf = 3;
Ts = 1/fs;
t = T0:Ts:Tf;
x = 4*sin(2*pi*t) - 2*cos(3*pi*2*t);

%% define figure
figure

%% plot
subplot(3,2,1)
plot(t,x)
title('Plot')
xlabel('Time')
ylabel('Amplitude')

%% stem
subplot(3,2,2)
stem(x)
title('Stem')
xlabel('Time')
ylabel('Amplitude')

%% conv
convolution = conv(x, x, 'same');
subplot(3,2,3)
plot(t, convolution)
title('Convolution')
xlabel('Time')
ylabel('Amplitude')

%% corr
subplot(3,2,4)
plot(xcorr(x, x))
title('Correlation')
xlabel('Time')
ylabel('Amplitude')

%% lsim
sys = tf([1 2], [5 0.5 2]);
y = lsim(sys, x, t);
subplot(3,2,5)
plot(t, y)
title('System output')
xlabel('Time')
ylabel('Amplitude')
