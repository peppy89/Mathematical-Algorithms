%% Lab 6: Mini Project – Image DSP Pipeline
close all; clear; clc;

% 1) Load your own image (object, face, landscape, etc.)
I = im2double(rgb2gray(imread('https://www.trainerroad.com/blog/wp-content/uploads/2021/11/benefits-of-cycling.jpg')));

% 2) Pre-process: noise removal using 3x3 median filter
I_filt = medfilt2(I, [3 3]);

% 3) Enhance contrast
I_enh = imadjust(I_filt, [0.2 0.8], [0 1]);

% 4) Extract features: edges using Canny detector
edges = edge(I_enh, 'Canny', [0.1 0.25]);

% 5) Frequency-domain filtering (Low-pass)
F = fftshift(fft2(I_enh));
[M,N] = size(F);
[u,v] = meshgrid(-N/2:N/2-1, -M/2:M/2-1);
H = double(sqrt(u.^2 + v.^2) < 60);    % circular low-pass mask
I_lp = real(ifft2(ifftshift(F .* H)));

% 6) Visualization
figure;
montage({I, I_filt, I_enh, edges, I_lp}, 'Size', [1 5]);
title('Original | Denoised | Enhanced | Edges | Low-pass Result');
