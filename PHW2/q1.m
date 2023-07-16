%%
clc
clear
close all

%%
syms t;
f1 = (2 / pi) * sin(t);
f2 = (2 / (pi * 3)) * cos(3 * t);

%%
T = 10564;
dot_res = f1 * f2;
F = double(int(dot_res, t, -T, T))