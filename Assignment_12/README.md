# Exercise 12 – FIR Low-Pass Filter Design

## Overview
This project designs and analyzes a **Low-Pass FIR filter** using the **direct formula** for the impulse response:

\[
h_{LP}(n) = \frac{\sin \big( \omega_c (n - M/2) \big)}{\pi \, (n - M/2)}
\]

with the special case at the center:
\[
h_{LP}(M/2) = \omega_c / \pi
\]

(n) for M = 20 and M = 64 show that higher order filters have longer impulse responses.

Magnitude Responses

The comparison below illustrates how increasing M sharpens the transition band.


Increasing the filter order M makes the transition band narrower and improves the selectivity of the low-pass filter.

A higher M means the impulse response is longer, increasing computational complexity but also providing better frequency selectivity.

Higher-order filters have smoother and sharper magnitude responses, reducing ripples in passband and stopband.
	​

Environment

MATLAB R2023b 

OS: Windows 11

Author: Trang Dinh

Date: 2025-10-08
