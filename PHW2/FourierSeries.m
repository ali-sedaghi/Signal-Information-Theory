function [an] = FourierSeries(f, T, N)
    wo = 2 * pi / T;
    syms t
    for n = 1:N
         an_sym(n) = (1/T)*int(f*exp(-1i * n * wo * t),t,0,T);
         an(n) = double(an_sym(n));
    end
end