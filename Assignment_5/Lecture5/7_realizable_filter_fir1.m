%% 7) Realizable FIR with windowed design (fir1)
% Approximate an ideal low-pass with transition band and ripples.

clear; clc; close all;

N = 40;               % filter order
wc = 0.4;             % normalized cutoff (0..1) where 1 = Nyquist
b = fir1(N, wc, 'low', hamming(N+1));
a = 1;

figure; freqz(b, a, 2048); title('Realizable FIR (fir1 + Hamming)');
