clc; clear; close all;

% -------------------------------------------------
% Define FIR impulse responses
% -------------------------------------------------
h1 = [1 2 3 4 4 3 2 1];      % Type I  (M even, symmetric)
h2 = [1 2 3 4 3 2 1];        % Type II (M odd, symmetric)
h3 = [-1 -2 -3 -4 3 3 2 1];  % Type III (M even, antisymmetric)
h4 = [-1 -2 -3 0 3 2 1];     % Type IV (M odd, antisymmetric)

filters = {h1, h2, h3, h4};
titles  = {'FIR Type I (Even, Symmetric)', ...
           'FIR Type II (Odd, Symmetric)', ...
           'FIR Type III (Even, Anti-symmetric)', ...
           'FIR Type IV (Odd, Anti-symmetric)'};

% -------------------------------------------------
% Create figure for all filters
% -------------------------------------------------
figure('Name','Exercise 11 – FIR Filter Types','NumberTitle','off',...
       'Position',[100 100 1400 900]);

for k = 1:4
    h = filters{k};
    [H, w] = freqz(h, 1, 512);   % Frequency response

    % ---- Magnitude ----
    subplot(4,3,(k-1)*3 + 1);
    plot(w/pi, abs(H), 'LineWidth',1.5); grid on;
    xlabel('Normalized Frequency (\times\pi rad/sample)');
    ylabel('|H(\omega)|');
    title([titles{k} ' – Magnitude']);

    % ---- Phase ----
    subplot(4,3,(k-1)*3 + 2);
    plot(w/pi, unwrap(angle(H)), 'LineWidth',1.5); grid on;
    xlabel('Normalized Frequency (\times\pi rad/sample)');
    ylabel('Phase (radians)');
    title([titles{k} ' – Phase']);

    % ---- Pole-Zero ----
    subplot(4,3,(k-1)*3 + 3);
    zplane(h,1);
    title([titles{k} ' – Pole–Zero']);
end

sgtitle('Exercise 11 – FIR Filter Types (Magnitude, Phase & Pole–Zero)');