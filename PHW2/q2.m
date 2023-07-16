%%
clc
clear
close all

%%
figure

%%
syms t;
f = triangularPulse(t);

%%
T = 1;
w0 = 2 * pi / T;
fs = 10e3;
tnum = -T/2:1/fs:T/2;
fprim = triangularPulse(w0*tnum);

%%
subplot(5,1,1)
plot(tnum, fprim)

%%
N = 10000;
a0 = double(1 / T * int(f, t, 0, T));
a = zeros(N, 1);
b = zeros(N, 1);
for i = 1:N
    funa = @(t) triangularPulse(t) .* cos(i .* w0 .* t);
    funb = @(t) triangularPulse(t) .* sin(i .* w0 .* t);
    a(i) = 2 / T * integral(funa, 0, T);
    b(i) = 2 / T * integral(funb, 0, T);
end

%%
fnum = a0;
terms = [10 50 100 10000];
j = 1;
for i = 1:N
    fnum = fnum + a(i) * cos(i * w0 * tnum) + b(i) * sin(i * w0 * tnum);
    if i == terms(j)
        subplot(5,1,j+1)
        plot(tnum, fnum)
        title('Fourier series Animation');
        text(0.1, 0.1, ['Terms: ', int2str(terms(j))]);
        j = j + 1;
    end
end