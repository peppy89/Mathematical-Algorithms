% Range of n values
n = -10:10;  

%% 1. Unit Impulse Signal
% δ[n] = 1 at n = 0, and 0 elsewhere
impulse = (n == 0);  

figure;
stem(n, impulse, 'filled');
xlabel('n'); ylabel('\delta[n]');
title('Unit Impulse Signal');
grid on;

%% 2. Unit Step Signal
% u[n] = 1 for n >= 0, else 0
step = (n >= 0);  

figure;
stem(n, step, 'filled');
xlabel('n'); ylabel('u[n]');
title('Unit Step Signal');
grid on;

%% 3. Unit Ramp Signal
% r[n] = n for n >= 0, else 0
ramp = n .* (n >= 0);  

figure;
stem(n, ramp, 'filled');
xlabel('n'); ylabel('r[n]');
title('Unit Ramp Signal');
grid on;

%% 4. Exponential Signal
% Example: a^n for some a (say a = 0.8)
a = 0.8;  
expo = (a.^n) .* (n >= 0);  % causal exponential

figure;
stem(n, expo, 'filled');
xlabel('n'); ylabel('a^n');
title(['Exponential Signal (a = ', num2str(a), ')']);
grid on;

%% 5. Signum Function
% signum[n] = -1 for n<0, 0 for n=0, +1 for n>0
signum = zeros(size(n));
signum(n < 0) = -1;
signum(n > 0) = 1;

figure;
stem(n, signum, 'filled');
xlabel('n'); ylabel('sgn[n]');
title('Signum Function');
grid on;

%% 6. Sinc Function
% sinc[n] = sin(pi*n)/(pi*n), with sinc(0) = 1
sinc_func = zeros(size(n));
for k = 1:length(n)
    if n(k) == 0
        sinc_func(k) = 1;  % handle the undefined point at n=0
    else
        sinc_func(k) = sin(pi*n(k)) / (pi*n(k));
    end
end

figure;
stem(n, sinc_func, 'filled');
xlabel('n'); ylabel('sinc[n]');
title('Sinc Function');
grid on;