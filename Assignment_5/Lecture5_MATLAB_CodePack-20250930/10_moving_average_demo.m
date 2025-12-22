%% 10) M-Point Moving Average Example
% Show zeros on the unit circle and magnitude response.

clear; clc; close all;

M = 9;
b = (1/M)*ones(1,M);
a = 1;

% Pole-zero plot
[z,p,k] = tf2zpk(b,a);

figure; zplane(z,p); title(sprintf('Pole-Zero Plot (M=%d moving average)', M));

% Magnitude response
figure; freqz(b,a,1024);
title('Magnitude Response (Moving Average)');
