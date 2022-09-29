function [energy, power] = Energy_Power(x)
   signal = cast(x, 'double');
   squared_signal = signal .^ 2;
   energy = sum(squared_signal(:));
   energy = 10 * log10(energy);
   power = energy / (2 * inf);
end
