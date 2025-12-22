%% Exercise 12 – FIR Low-Pass Filter Design
% Comparison of M = 20 and M = 64
% (Figure layout matches the example you showed)

clc; clear; close all;

%% Parameters
wc = 1;                  % cutoff frequency (rad)
M1 = 20;                 % first filter order
M2 = 64;                 % second filter order
Nfft = 1024;             % FFT points
w = linspace(-pi, pi, Nfft);

%% ----------------------------
% Compute impulse responses
% ----------------------------
% ----- For M = 20 -----
n1 = 0:M1;
h1 = sin(wc*(n1 - M1/2)) ./ (pi*(n1 - M1/2));
h1(n1 == M1/2) = wc/pi;      % handle divide-by-zero

H1 = fft(h1, Nfft);

% ----- For M = 64 -----
n2 = 0:M2;
h2 = sin(wc*(n2 - M2/2)) ./ (pi*(n2 - M2/2));
h2(n2 == M2/2) = wc/pi;

H2 = fft(h2, Nfft);

%% ----------------------------
% Create comparison figure
% ----------------------------
figure('Name','FIR LPF: M=20 vs M=64','NumberTitle','off',...
       'Position',[100 100 1200 700]);

% ---- Impulse response of M=20 ----
subplot(2,2,1);
stem(n1, h1, 'b','filled','LineWidth',1.2); grid on;
xlabel('n'); ylabel('h_{LP}(n)');
title('Impulse response of the 20th order filter');

% ---- Impulse response of M=64 ----
subplot(2,2,2);
stem(n2, h2, 'r','filled','LineWidth',1.2); grid on;
xlabel('n'); ylabel('h_{LP}(n)');
title('Impulse response of the 64th order filter');

% ---- Frequency response of M=20 ----
subplot(2,2,3);
plot(w/pi, abs(fftshift(H1)),'b','LineWidth',1.5); grid on;
xlabel('\omega / \pi'); ylabel('|H_{LP}(e^{j\omega})|');
title('Frequency response of the windowed 20th order filter');

% ---- Frequency response of M=64 ----
subplot(2,2,4);
plot(w/pi, abs(fftshift(H2)),'r','LineWidth',1.5); grid on;
xlabel('\omega / \pi'); ylabel('|H_{LP}(e^{j\omega})|');
title('Frequency response of the windowed 64th order filter');

sgtitle('Comparison of Low-Pass FIR Filters (M=20 vs M=64)');

%% Save figure (optional)
if ~exist('figures','dir')
    mkdir figures
end
saveas(gcf,'figures/FIR_LPF_M20_vs_M64.png');
