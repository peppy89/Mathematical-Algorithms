# Continuous-Time Signal Generation in MATLAB

This project demonstrates how to generate and visualize common continuous-time signals using MATLAB.  
The following signals are implemented and plotted:

1. **Unit Impulse Signal (δ(t))**  
   Approximated as a single spike at `t = 0`.

2. **Unit Step Signal (u(t))**  
   A signal that is 0 for `t < 0` and 1 for `t ≥ 0`.

3. **Unit Ramp Signal (r(t))**  
   A signal that increases linearly with time for `t ≥ 0`, and 0 otherwise.

4. **Exponential Signal (e^(at))**  
   Exponential growth or decay depending on the parameter `a`.

5. **Signum Signal (sgn(t))**  
   Equal to -1 for `t < 0`, 0 at `t = 0`, and +1 for `t > 0`.

6. **Sinc Signal (sinc(t))**  
   MATLAB’s normalized definition:  
   \[
   \text{sinc}(t) = \frac{\sin(\pi t)}{\pi t}
   \]

---

## Instructions

1. Open MATLAB.
2. Copy the code from `signals.m` (or whatever you name the script) into the MATLAB editor.
3. Save the script in your working directory.
4. Run the script by clicking **Run** or typing:
   ```matlab
   signals
