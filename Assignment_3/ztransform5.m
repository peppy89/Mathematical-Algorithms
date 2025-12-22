b = [1 -2.4 2.88];
a = [1 -0.8 0.64];
figure; zplane(b,a); grid on; title('Pole-Zero Plot');

% Numeric values
z_zeros = roots(b);
z_poles = roots(a);

[H,w] = freqz(b,a,512);
figure;
subplot(2,1,1); plot(w/pi, abs(H)); grid on; ylabel('|H|'); title('Magnitude');
subplot(2,1,2); plot(w/pi, angle(H)); grid on; xlabel('\omega/\pi'); ylabel('Phase');
