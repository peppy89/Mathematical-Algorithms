%% 5) FIR vs IIR comparison on same signal
% Compare smoothing and delay characteristics.

clear; clc; close all;

N = 600; n = 0:N-1;
x = sin(2*pi*0.03*n) + 0.25*sin(2*pi*0.3*n) + 0.3*randn(size(n));

% FIR (moving average)
Mf = 9;
b_fir = (1/Mf)*ones(1,Mf); a_fir = 1;
y_fir = filter(b_fir, a_fir, x);

% IIR (Butter LPF)
[b_iir,a_iir] = butter(4, 0.12/0.5);  % normalized cutoff ~0.12
y_iir = filter(b_iir, a_iir, x);

figure;
plot(n, x, 'Color',[0.6 0.6 0.6]); hold on;
plot(n, y_fir, 'LineWidth', 1);
plot(n, y_iir, 'LineWidth', 1);
grid on; legend('Input','FIR (MA9)','IIR (Butter)');
title('FIR vs IIR on the same signal'); xlabel('n');

% Group delay comparison
figure;
[gd_fir,w] = grpdelay(b_fir, a_fir, 512);
[gd_iir,~] = grpdelay(b_iir, a_iir, 512);
plot(w/pi, gd_fir, 'LineWidth', 1); hold on;
plot(w/pi, gd_iir, 'LineWidth', 1);
grid on; legend('FIR GD','IIR GD');
title('Group Delay Comparison'); xlabel('Normalized Frequency (\times\pi)'); ylabel('Samples');
