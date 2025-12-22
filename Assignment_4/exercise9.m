clc;
clear all;
close all;
% Time vector from 0 to 10 with increments of 1/100
t = 0:1/100:10;
% signal as x = sin(2*pi*15*t) + sin(2*pi*40*t)
x = sin(2*pi*15*t) + sin(2*pi*40*t);
% Send to 512 per the instruction
n = 512;
% Compute the DFT of the signal with 512 points
y = fft(x, n);
% magnitude of y
m = abs(y);
m(m < 1e-6) = 0;
% phase of y
p = unwrap(angle(y));
% frequency vector for plotting (adjusted for n=512)
f = (0:n-1) * 100 / n; % Frequency vector based on length of DFT result
% magnitude of the Fourier transform
subplot(2,1,1);
plot(f, m);
title('Magnitude');
xlabel('Frequency (Hz.)');
ylabel('Magnitude');
ax = gca;
ax.XTick = [15 40 60 85];
% phase of the Fourier transform
subplot(2,1,2);
plot(f, p * 180 / pi);
grid on;
title('Phase');
xlabel('Frequency, Hz.');
ylabel('Phase (degrees)');
ax = gca;
ax.XTick = [15 40 60 85];
