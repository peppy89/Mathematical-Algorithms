syms n z
Xa = 1 / (1 - 0.7*z^(-1));
xa = iztrans(Xa, z, n);
% Expected output: 0.7^n * heaviside(n)

syms n z
Xb = (1 - 0.5*z^(-1)) / (1 - 0.8*z^(-1));
xb = iztrans(Xb, z, n);
% Expected output: 0.8^n*heaviside(n) - 0.5*0.8^(n-1)*heaviside(n-1)
% which simplifies to the piecewise form shown above

