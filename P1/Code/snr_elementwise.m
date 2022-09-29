function snr = snr_elementwise(x, y)
  noisy = cast(x, 'double');
  original = cast(y, 'double');
  
  noise = noisy - original + 10e-20;
  
  squared_signal = original .^ 2;
  squared_noise = noise .^ 2;
  
  division = squared_signal ./ squared_noise;
  
  snr = mean(division(:));
  
  snr = 10 * log10(snr);
end
