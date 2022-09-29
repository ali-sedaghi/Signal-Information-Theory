%%
clear
close all
clc

%% Load and show image
I = imread('./images/Original.jpg');
I = im2double(I);


%% Convert to grayscale and save
I_gray = rgb2gray(I);
imwrite(I_gray, './images/Gray.jpg');
imshow(I_gray);


%% Energy and power
[energy, power] = Energy_Power(I_gray);

fprintf('Energy and Power of the gray image\n');
fprintf('Energy: %0.4f dB\n', energy);
fprintf('Power: %0.4f\n', power);


%% Add noise
I_noisy = imnoise(I_gray, 'gaussian', 0, 0.01);
imwrite(I_noisy, './images/Noisy.jpg');


%% Gray image metrics
SNR = snr(I_gray, I_gray);
PSNR = psnr(I_gray, I_gray);

fprintf('\nGray image metrics\n');
fprintf('SNR: %0.4f dB\n', SNR);
fprintf('PSNR: %0.4f dB\n', PSNR);


% Noisy image metrics
SNR = snr(I_noisy, I_gray);
PSNR = psnr(I_noisy, I_gray);

fprintf('\nNoisy image metrics\n');
fprintf('SNR: %0.4f dB\n', SNR);
fprintf('PSNR: %0.4f dB\n', PSNR);


%% Fourier transform
ft_gray = fftshift(log(abs(fft2(I_gray))));
ft_noise = fftshift(log(abs(fft2(I_noisy - I_gray))));
ft_noisy = fftshift(log(abs(fft2(I_noisy))));
imshow(ft_gray, []);
imshow(ft_noise, []);
imshow(ft_noisy, []);


%% Remove noise - wiener
[I_wiener, noise_out] = wiener2(I_noisy);
imwrite(I_wiener, './images/Denoised_wiener.jpg');
SNR = snr(I_wiener, I_gray);
PSNR = psnr(I_wiener, I_gray);

fprintf('\nRemoving noise with wiener filter\n');
fprintf('SNR: %0.4f dB\n', SNR);
fprintf('PSNR: %0.4f dB\n', PSNR);


%% Remove noise - filter
I_filter = filter2(fspecial('average', 3), I_noisy);
imwrite(I_filter, './images/Denoised_filter.jpg');
SNR = snr(I_filter, I_gray);
PSNR = psnr(I_filter, I_gray);

fprintf('\nRemoving noise with filter\n');
fprintf('SNR: %0.4f dB\n', SNR);
fprintf('PSNR: %0.4f dB\n', PSNR);


%% Remove noise - conv
I_conv = conv2(double(I_noisy), ones(3)/9, 'same');
imwrite(I_conv, './images/Denoised_conv.jpg');
SNR = snr(I_conv, I_gray);
PSNR = psnr(I_conv, I_gray);

fprintf('\nRemoving noise with conv filter\n');
fprintf('SNR: %0.4f dB\n', SNR);
fprintf('PSNR: %0.4f dB\n', PSNR);


%% Remove noise - medfilt
I_medfilt = medfilt2(I_noisy);
imwrite(I_medfilt, './images/Denoised_medfilt.jpg');
SNR = snr(I_medfilt, I_gray);
PSNR = psnr(I_medfilt, I_gray);

fprintf('\nRemoving noise with median filter\n');
fprintf('SNR: %0.4f dB\n', SNR);
fprintf('PSNR: %0.4f dB\n', PSNR);
