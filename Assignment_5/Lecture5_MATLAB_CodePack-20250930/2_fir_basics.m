%% 2) FIR Basics: simple moving average FIR
% FIR uses only input samples (non-recursive), always stable.

clear; clc; close all;

% 5-point moving average FIR
M = 5;
b = (1/M)*ones(1,M);
a = 1; % FIR => a = 1

% Create a test signal
N = 500; n = 0:N-1;
x = sin(2*pi*0.02*n) + 0.4*randn(size(n));

% Filter
y = filter(b, a, x);

% Time-domain view
figure;
subplot(2,1,1); plot(n, x, 'LineWidth', 1); grid on; title('Input x[n]'); xlabel('n');
subplot(2,1,2); plot(n, y, 'LineWidth', 1); grid on; title('FIR Output y[n]'); xlabel('n');

% Frequency response
figure;
freqz(b, a, 1024);
title('FIR (Moving Average) Frequency Response');
