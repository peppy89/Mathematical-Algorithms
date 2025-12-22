% MATLAB symbolic verification (paste these lines)
syms n z

% Define sequences
x1 = (0.5)^n * heaviside(n);
x2 = (-0.5)^n * heaviside(n);

% (a) Linearity
X_lin = ztrans( 2*x1 - 3*x2, n, z );
pretty(X_lin)
disp('X_lin ='); disp(simplify(X_lin))

% (b) Time shift x1[n-3]
x1_shift = subs(x1, n, n-3);         % x1[n-3] = (0.5)^(n-3) * u(n-3)
X_shift = ztrans( x1_shift, n, z );
pretty(X_shift)
disp('X_shift ='); disp(simplify(X_shift))

% If you want the simplified rational forms:
disp('Alt form multiply numerator/denominator by z^2:')
disp('X_lin (alt) ='); disp(simplify( ( -z^2 + 2.5*z ) / ( z^2 - 0.25 ) ))
disp('X_shift (alt) ='); disp(simplify( z^(-3) / ( 1 - 0.5*z^(-1) ) ))
