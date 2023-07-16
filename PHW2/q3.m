%%
clc
clear
close all

%%
figure

%%
syms t;
f = heaviside(t) - heaviside(t-1);

%%
T = 2;
wo = 2 * pi / T;
fs = 10e3;
tnum = 0:1/fs:10;

%%
fprim = heaviside(tnum) - heaviside(tnum-1);
subplot(2,1,1)
plot(fprim)

%%
N = 10;
[an] = FourierSeries(f,T,N);
fnum = (1/T)*int(f,t,0,T);
for n = 1:N
    harmonics = an(n)*exp(1i * wo * n * tnum);
    fnum = fnum + harmonics;
end

%%
subplot(2,1,2)
plot(tnum, fnum)
title('Fourier series');