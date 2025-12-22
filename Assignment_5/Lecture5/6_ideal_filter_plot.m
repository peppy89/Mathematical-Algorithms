%% 6) Ideal Filter "shape" (for illustration)
% We plot an ideal low-pass mask for comparison only.

clear; clc; close all;

w = linspace(0,pi,1024);
wc = 0.4*pi; % cutoff in rad/sample

H_ideal = double(w <= wc);

figure; plot(w/pi, H_ideal, 'LineWidth', 2); grid on;
xlabel('Normalized Frequency (\times \pi)'); ylabel('|H_{ideal}(e^{j\omega})|');
title('Ideal Low-pass Response (mask) - Not realizable exactly');
ylim([-0.1 1.1]);
