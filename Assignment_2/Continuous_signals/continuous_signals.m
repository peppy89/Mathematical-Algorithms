%% Signal Generation and Plotting in MATLAB
clc; clear; close all;

% Time vector for continuous-time approximation
t = -10:0.001:10;  % from -5 to 5 with small step for smooth plots

%% 1. Unit Impulse (Dirac Delta approximation)
impulse = zeros(size(t));
impulse(t == 0) = 1;  % set value 1 at t=0
figure;
stem(t, impulse, 'filled');  % use stem to indicate impulse
title('Unit Impulse Signal');
xlabel('Time (t)');
ylabel('Amplitude');
grid on;

%% 2. Unit Step
u = double(t >= 0);  % 1 for t>=0, 0 otherwise
figure;
plot(t, u, 'LineWidth', 2);
title('Unit Step Signal');
xlabel('Time (t)');
ylabel('Amplitude');
grid on;

%% 3. Unit Ramp
ramp = t .* (t >= 0);  % t for t>=0, 0 otherwise
figure;
plot(t, ramp, 'LineWidth', 2);
title('Unit Ramp Signal');
xlabel('Time (t)');
ylabel('Amplitude');
grid on;

%% 4. Exponential Signal
a = -1;  % negative for decaying exponential
t = -10:0.01:10;  % time vector
exp_signal = exp(a * t);  % decaying for positive t

figure;
plot(t, exp_signal, 'LineWidth', 2);
title('Continuous-Time Exponential Signal');
xlabel('Continuous time t ---->');
ylabel('Amplitude --->');
grid on;

%% 5. Signum Signal
sign_signal = sign(t);  % returns -1 for t<0, 0 for t=0, 1 for t>0
figure;
plot(t, sign_signal, 'LineWidth', 2);
title('Signum Signal');
xlabel('Time (t)');
ylabel('Amplitude');
grid on;

%% 6. Sinc Signal
sinc_signal = sinc(t);  % MATLAB's sinc is sin(pi*t)/(pi*t)
figure;
plot(t, sinc_signal, 'LineWidth', 2);
title('Sinc Signal');
xlabel('Time (t)');
ylabel('Amplitude');
grid on;
