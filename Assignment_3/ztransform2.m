syms n z a
assume(abs(a) < 1)
X = ztrans(a^n * heaviside(n), n, z);   % yields 1/(1 - a*z^-1), ROC: |z|>|a|

% Specific check a = 0.6
Xs = subs(X,a,0.6);
pretty(simplify(Xs))

syms n z
a = -0.8;
Xb = ztrans(a^n * heaviside(n), n, z);
pretty(simplify(Xb))
% Expect 1/(1 + 0.8*z^-1), ROC |z|>0.8

syms n z
% Direct sum for left-sided sequence
Xc = symsum( - (0.9)^n * z^(-n), n, -inf, -1 );
pretty(simplify(Xc))
% Should simplify to z/(z-0.9)  and ROC is inferred: |z|<0.9
