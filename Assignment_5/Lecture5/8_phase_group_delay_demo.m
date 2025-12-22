%% 8) Phase and Group Delay demo
clear; clc; close all;

% Example filter
[b,a] = butter(4, 0.2);

% Phase
[H,w] = freqz(b, a, 1024);
theta = angle(H);

figure;
subplot(3,1,1);
plot(w/pi, 20*log10(abs(H)+eps), 'LineWidth', 1); grid on;
title('Magnitude Response'); ylabel('dB');

subplot(3,1,2);
plot(w/pi, unwrap(theta), 'LineWidth', 1); grid on;
title('Phase Response'); ylabel('Radians');

subplot(3,1,3);
[gd, wgd] = grpdelay(b, a, 1024);
plot(wgd/pi, gd, 'LineWidth', 1); grid on;
title('Group Delay'); xlabel('Normalized Frequency (\times\pi)'); ylabel('Samples');
