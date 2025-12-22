A1 – Warm‑up: Finite Sequences → Polynomials
+ Z-transform results
    •	X1(z)=1+2z−1+5z−2X_1(z) = 1 + 2z^{-1} + 5z^{-2}X1(z)=1+2z−1+5z−2
    •	X2(z)=3z−1+4z−3X_2(z) = 3z^{-1} + 4z^{-3}X2(z)=3z−1+4z−3

<img width="513" height="356" alt="image" src="https://github.com/user-attachments/assets/cde358b5-e1de-4692-ae7d-3f8a6c0e54d7" />

+ Why finite sequences have “nice” ROC
    •	Z-transform becomes a finite polynomial in z^(-1).
    •	No infinite summations → no convergence issues.
    •	ROC is the entire z-plane except possibly z=0 or z=∞.

+ I noticed how finite sequences make the Z-transform very straightforward: just plug values into powers of z^(-1). It was also clear that the ROC problems only arise when dealing with infinite sequences. Using MATLAB symbolic tools makes verification easy since the sums collapse neatly into polynomials. This reinforced that the Z-transform is basically a polynomial representation for finite signals.
  
  A2 – Infinite Sequences & ROC
(a) x[n] = a^n u[n], with a = 0.6
  X(z) = 1/(1-az^(-1))
  ROC: ∣az^(−1)∣<1 ⟹ ∣z∣>∣a∣ ⇒ ROC: ∣z∣>∣a∣.​
  For a = 0.6: ∣z∣ > 0.6
  Pole: single pole at 𝑧 = a (here z=0.6)
<img width="504" height="458" alt="image" src="https://github.com/user-attachments/assets/9397c839-f308-4e0e-8063-ec5ae45f89ec" />

(b) x[n] = (−0.8)^n u[n]
  X(z)= 1/(1 + 0.8z^(-1))
  ROC: ∣z∣>0.8
  Pole: at z = -0.8
  <img width="528" height="491" alt="image" src="https://github.com/user-attachments/assets/0a2d642e-ee53-49bb-977b-9c2602cfd66d" />


(c) x[n] = −(0.9)^n u[−n−1]   (a left‑sided sequence)
  X(z)= 1/(1-0.9z^(-1))
  ROC: ∣z∣ < 0.9
  Pole: single pole at 𝑧=0.9
  <img width="495" height="495" alt="image" src="https://github.com/user-attachments/assets/d68c7d70-8f26-4b86-ab04-23c5f9f1ba0b" />

  + The ROC is the set of complex z for which the Z-series (infinite sum) converges; it is defined by inequalities in ∣z∣ because each term is proportional to powers of z^(-1) or z. Poles are singularities of the rational X(z) (values of z that make the denominator zero) and always lie on the boundary of the ROC. For right-sided (causal) sequences the ROC is outside the outermost pole (∣z∣>max pole radius) (|z|> max pole radius); for left-sided sequences the ROC is inside the innermost pole (∣z∣<min pole radius); two-sided sequences have an annular ROC between poles.

A3 – Properties: Linearity & Shifting 
(a) Linearity:
X_lin should display (-1 + 2.5*z^(-1)) / (1 - 0.25*z^(-2))
and the alternative simplified rational form: (-z^2 + 2.5*z) / (z^2 - 0.25)
ROCs: ∣z∣>0.5

(b) Time-shift:
X_shift should display: z^(-3) / (1 - 0.5*z^(-1))
which is the same as the time-shift result above.
ROC: ∣z∣>0.5
<img width="495" height="644" alt="image" src="https://github.com/user-attachments/assets/881e1467-467c-4661-847b-eb65358ed88d" />

+ I noticed that linearity makes the Z-transform calculation a matter of just combining fractions and simplifying. The time-shift property was straightforward - shifting by kkk samples only multiplies the transform by z^(-k) without changing the ROC for causal signals. MATLAB symbolic tools provided clean confirmation of the algebra and helped check the simplified forms. It reinforced how systematic these Z-transform properties are, making it easier to handle more complex sequences.

A4 – Inverse Z-Transform
(a) X(z) = 1 / (1 − 0.7 z^{−1})
    X[n] = 0.7^n u[n]
(b) X(z) = (1 − 0.5 z^{−1}) / (1 − 0.8 z^{−1})
    X[n] = δ[n] 0.3 0.8^(n-1) u[n-1]
    
<img width="488" height="726" alt="image" src="https://github.com/user-attachments/assets/cf060016-4467-43a2-a84f-620621bc93c1" />

How I got them by inspection
•	Poles determine the exponential form: a pole at z=a (with ROC outside the pole for causal signals) gives a term a^n u[n].
•	For rational X(z) you can do partial-fraction or algebraic splitting in powers of z^(-1) to read off shifted exponentials and impulses (as in (b) where the z^(-1) in the numerator produces a shifted exponential).

Reading 𝑋(𝑧) directly often tells you the shape of 𝑥[𝑛] immediately — poles give exponentials, zeros and numerator powers produce shifts or impulses. Splitting a rational function into simpler pieces (or using MATLAB's iztrans) quickly confirms the time-domain terms and handles edge cases like n=0. The ROC is essential: the same rational form can correspond to different time-domain sequences depending on the ROC (causal vs. anti-causal). MATLAB symbolic output is a helpful sanity check and shows the un-simplified shifted terms that you can compress by inspection.

A5 – H(z), Poles/Zeros & Frequency Response 
(a) Poles and Zeros

<img width="575" height="500" alt="image" src="https://github.com/user-attachments/assets/b5ce0ff0-c017-41f1-94a0-aa107118084b" />
Expected numeric values (approx):
Zeros: 𝑧≈1.2±1.2𝑖
Poles: z≈0.4±0.4i
Zeros lie outside the unit circle, poles lie inside the unit circle (stable filter)
(b) Magnitude and Phase Response

<img width="585" height="509" alt="image" src="https://github.com/user-attachments/assets/b3b1c0f5-069e-4930-b3e7-79f24052b01e" />

Magnitude peaks at low frequencies and rolls off at high frequencies → suggests low-pass behavior.
Phase response starts at 0 and decreases smoothly → causal, stable filter.
<img width="484" height="728" alt="image" src="https://github.com/user-attachments/assets/f4fc76ad-ad21-4e8d-b791-1a7c09b6ccdb" />
<img width="508" height="173" alt="image" src="https://github.com/user-attachments/assets/323e573f-f2e7-4af6-bc55-3c7ec91ea6c1" />

(c) Filter Type
Observation from magnitude plot: strong gain at low ω (near 0) and attenuation at high ω (near π) → low-pass.
Pole locations: poles inside the unit circle at 0.4±0.4i → ensures stability and emphasizes low-frequency components.
Zero locations: zeros outside the unit circle at 1.2±1.2i → help suppress high-frequency components.
Justification: combination of pole-zero placement shapes the frequency response with peak gain at low frequencies, smooth roll-off at high frequencies, and no band-pass or notch behavior.
The phase plot shows a monotonic decreasing phase, typical for a stable causal low-pass IIR filter.
Conclusion: This is a stable low-pass IIR filter, designed to pass low frequencies and attenuate high frequencies.
