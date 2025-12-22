%% 3) FIR as Convolution
% Show that FIR output equals convolution of x with the impulse response b.

clear; clc; close all;

% FIR coefficients (impulse response)
b = [1 1 1]/3;
a = 1;

% Noisy sine
N = 400; n = 0:N-1;
x = sin(2*pi*0.05*n) + 0.5*randn(size(n));

y_filter = filter(b, a, x);
y_conv   = conv(x, b, 'same');  % same length as x

figure;
plot(n, y_filter, '-', 'LineWidth', 1); hold on;
plot(n, y_conv, '--', 'LineWidth', 1);
grid on; legend('filter(b,a,x)', 'conv(x,b) (same)');
title('FIR Output via filter vs conv');
xlabel('n'); ylabel('Amplitude');
