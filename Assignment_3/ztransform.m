% Use symbolic z
syms z

% Example i)
X1 = 1 + 2*z^(-1) + 5*z^(-2);
pretty(X1)
% Optionally simplify/expand/display
disp('X1 ='); disp(vpa(X1,6))

% Example ii)
X2 = 0 + 3*z^(-1) + 0*z^(-2) + 4*z^(-3);
pretty(X2)
disp('X2 ='); disp(vpa(X2,6))

% If you prefer to compute from the sequence explicitly:
n = 0:2;
x1 = [1 2 5];
X1_from_sum = sum(x1 .* z.^(-n));
simplify(X1 - X1_from_sum)    % should return 0

n2 = 0:3;
x2 = [0 3 0 4];
X2_from_sum = sum(x2 .* z.^(-n2));
simplify(X2 - X2_from_sum)    % should return 0
