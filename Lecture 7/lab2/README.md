# Lab2_lecture7
**1) Delta image & impulse response**

  The delta acts as an impulse input.
  The convolution output equals the kernel itself → you visualize the impulse response (i.e., the filter).
  
  ![pic1](https://github.com/user-attachments/assets/292b7ba5-f624-4c34-af47-732a45f94e75)

**2) Low-pass: box vs Gaussian, separability**

  The Gaussian filter has smoother frequency roll-off (less ringing) than a box filter.
  Separable ⇒ can convolve rows and columns separately, reducing cost from O(N^2) to O(2N)
  
  ![pic2](https://github.com/user-attachments/assets/ef1edf0c-dca4-4eef-8a22-1fb8e03274e1)

**3) Unsharp masking (sharpen)**

  Subtracting the blur extracts edges (high frequencies).
  Adding it back amplifies detail - the basis for sharpening.
  
  ![pic3](https://github.com/user-attachments/assets/6fb567d3-537c-495f-8b82-342974f9d155)

**4) Edges: Sobel & Laplacian**

  Sobel: gradient in X & Y → directional edges.
  Laplacian: second derivative → emphasizes intensity transitions in all directions.
  
  ![pic4](https://github.com/user-attachments/assets/27f575e4-b39d-495f-b922-058de2e95e53)

**5) Correlation vs convolution (kernel flip)**

  This line compares outputs to confirm that imfilter with the 'conv' option performs kernel flipping, making it equivalent to conv2.

**6) Boundary handling**

  Each mode affects border behavior:
  
    - Replicate: repeats edge pixels (avoids dark borders).
    
    - Symmetric: mirrors image (common in image processing).
    
    - Circular: wraps around (used for periodic signals).
    
  ![pic5](https://github.com/user-attachments/assets/89e3cc04-fc70-4701-963e-9e6c5037ba1b)

  **7) Reflections**
  
    1. Why is Gaussian preferred over large box LP?
      Gaussian provides smoother attenuation and fewer ringing artifacts because its frequency response is also Gaussian — no abrupt cutoff
      
    2. What does separability do for computational cost?
      A 2D 𝑁×𝑁 convolution becomes two 1D N-length convolutions, reducing complexity roughly from 𝑁^2 to 2N per pixel.
      
    3. How do boundary modes change corners/edges?
      Boundary handling defines how pixels near the border are extrapolated.

      - Replicate may blur edges outward,
      
      - Symmetric preserves local structure,
      
      - Circular introduces wrap-around artifacts.


  
