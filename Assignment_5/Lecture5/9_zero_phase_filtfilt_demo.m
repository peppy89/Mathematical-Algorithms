%% 9) Zero-phase filtering with filtfilt (offline processing)
% filtfilt applies forward-backward filtering to remove phase distortion.

clear; clc; close all;

% Noisy test signal
N = 600; n = 0:N-1;
x = sin(2*pi*0.03*n) + 0.25*sin(2*pi*0.25*n) + 0.5*randn(size(n));

% IIR low-pass
[b,a] = butter(4, 0.12/0.5);

y_causal = filter(b, a, x);     % causal (phase distortion)
y_zero   = filtfilt(b, a, x);   % zero-phase

figure;
plot(n, x, 'Color',[0.65 0.65 0.65]); hold on;
plot(n, y_causal, 'LineWidth', 1);
plot(n, y_zero, 'LineWidth', 1);
grid on; legend('Input','Causal filter','Zero-phase (filtfilt)');
title('Causal vs Zero-phase Filtering'); xlabel('n');
