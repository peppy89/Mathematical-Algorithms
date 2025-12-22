% Time vector
t = 0:1/100:10-1/100; % time vector from 0 to 10 with 100 samples per second
% Signal definition
x = sin(2*pi*15*t) + sin(2*pi*40*t); % sum of two sine waves at 15 Hz and 40 Hz
% Discrete Fourier Transform (DFT)
y = fft(x);
% frequency vector for plotting
f = (0:length(y)-1)/10/length(y);
% small magnitudes (for phase calculation) to zero to avoid round-off errors
magnitude_threshold = 1e-6;
y(abs(y) < magnitude_threshold) = 0;
% Plotting the original signal
figure;
subplot(3,1,1);
plot(t, x);
title('Given Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');
% Plot the magnitude spectrum
subplot(3,1,2);
plot(f, abs(y));
title('Magnitude Spectrum');
xlabel('Frequency (Hz.)');
ylabel('Magnitude');
% the phase spectrum
subplot(3,1,3);
plot(f, angle(y)*180/pi); % Convert phase from radians to degrees
title('Phase Spectrum');
xlabel('Frequency (Hz.)');
ylabel('Phase (degrees)');
% Customize the x-axis
ax = gca;
ax.XTick = [15 40 60 85];
