clc;

clear all;

close all;

% Define the value of t
t = -1:0.001:1;

% Write the given expression x in terms of t
x= sin(2*pi*50*t) + sin(2*pi*75*t);

subplot(2,1,1);

plot(t(1001:1200),x(1001:1200)); %Plot from t=0 to t=0.2 seconds

grid on;

title('Sin(2\pi50t)+Sin(2\pi75t)')

xlabel('Time, s');
ylabel('Amplitude');
%Compute the FFT of x
X=fft(x);

%Shift the FFT result to center zero frequency
X2= fftshift(abs(X));

% assign f from -499.9 to 500 with increment of 1000/2001
f = linspace(-499.9, 500, length(X2));
subplot(2,1,2);

plot(f, X2);

grid on;

title('Frequency domain representation of Sin(2\pi50t)+ Sin(2\pi75t)');

xlabel('Frequency, Hz.')
ylabel('Amplitude');
