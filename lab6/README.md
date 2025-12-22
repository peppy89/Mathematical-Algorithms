# Mini-Project-Integrated-Image-Processing
<img width="631" height="80" alt="pic_lab6" src="https://github.com/user-attachments/assets/2c2c5a42-140f-49fc-af31-31de10ec4dd8" />


**1. Load and Grayscale Conversion**

DSP Concept: Sampling / Quantization
Converts the continuous scene into a discrete 2D signal. Grayscale simplifies processing and represents pixel intensity as sampled values for DSP operations.

**2. Median Filtering**

DSP Concept: Spatial Filtering (Non-linear)
Removes impulsive noise by replacing each pixel with the median of its neighbors. Acts as a non-linear low-pass filter, preserving edges better than averaging.

**3. Contrast Enhancement**

DSP Concept: Point-wise Transformation
Stretches intensity levels using a non-linear mapping. Similar to amplitude scaling in DSP, it increases visual clarity and contrast range.

**4. Edge Extraction**

DSP Concept: High-pass Spatial Filtering
Canny operator finds gradients (intensity changes). Differentiation emphasizes high-frequency details—edges—while suppressing smooth, low-frequency areas.

**5. Frequency-Domain Masking**

DSP Concept: Frequency Filtering (Low-pass)
Applies a circular low-pass mask on the FFT. Suppresses high-frequency details to smooth the image, demonstrating spatial–frequency domain duality.

**6. Visualization**

DSP Concept: Signal Interpretation
Displays each stage to compare effects of different DSP operations—noise removal, enhancement, edge detection, and spectral filtering.

**Improvements or limitations**

Improvements
- Adaptive contrast stretching (like histogram equalization) could yield better enhancement.
- Multi-scale edge detection (e.g., wavelets) could handle fine and coarse features more effectively.

Limitations
- Fixed thresholds may not generalize across diverse images.
- Frequency-domain filter cutoff (<60) is empirical; optimization could improve detail preservation.
