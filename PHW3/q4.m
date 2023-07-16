n = 2^10;                 % size of mask
M = zeros(n);
I = 1:n; 
x = I-n/2;                % mask x-coordinates 
y = n/2-I;                % mask y-coordinates
[X,Y] = meshgrid(x,y);    % create 2-D mask grid
R = 10;                   % aperture radius
A = (X.^2 + Y.^2 <= R^2); % circular aperture of radius R
M(A) = 1;                 % set mask elements inside aperture to 1
imagesc(M)                % plot mask
axis image

DP = fftshift(fft2(M));
imagesc(abs(DP))
axis image