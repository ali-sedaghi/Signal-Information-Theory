function snr = snr(x, y)
  noisy = cast(x, 'double');
  original = cast(y, 'double');
  
  noise = noisy - original;
  
  squared_signal = original .^ 2;
  squared_noise = noise .^ 2;
  
  sum_squared_signal = sum(squared_signal(:));
  sum_squared_noise = sum(squared_noise(:));
  
  snr = sum_squared_signal / sum_squared_noise;
  
  snr = 10 * log10(snr);
end
