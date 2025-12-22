%% 4) IIR Basics: Butterworth low-pass example
% IIR uses past outputs (recursive), efficient but must check stability.

clear; clc; close all;

fs = 1;             % normalized fs
fc = 0.1;           % normalized cutoff (0..0.5)
ord = 4;            % Butterworth order
[b,a] = butter(ord, fc/(fs/2));  % here fs/2 == 0.5; so Wn = fc/0.5 = 0.2

N = 500; n = 0:N-1;
x = sin(2*pi*0.02*n) + 0.5*sin(2*pi*0.25*n) + 0.3*randn(size(n)); % mix of low/high

y = filter(b, a, x);

figure;
subplot(2,1,1); plot(n, x, 'LineWidth', 1); grid on; title('Input x[n]'); xlabel('n');
subplot(2,1,2); plot(n, y, 'LineWidth', 1); grid on; title('IIR Output y[n] (Butter LPF)'); xlabel('n');

figure; freqz(b, a, 1024); title('Butterworth IIR Frequency Response');
