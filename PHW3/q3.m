fs = 1e3;
T0 = 0;
Tf = 2;
Ts = 1 / fs;
t = T0 : Ts : Tf;

f0 = 100;
f1 = 200;

x = chirp(t, f0, 1, f1, 'quadratic', [], 'concave');

d = seconds(Ts);
window = hamming(100, 'periodic');
stft(x, d, 'Window', window, 'OverlapLength', 98, 'FFTLength', 128);

view(-45,65);
colormap jet;