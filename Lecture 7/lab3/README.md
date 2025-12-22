# Lab 3: Frequency-Domain Filtering with fft2
**1) Magnitude spectrum (log-scale)**

    fft2 → 2D DFT of the image.
    
    fftshift → centers low frequencies (DC) for better visualization.
    
    log(1 + abs(...)) compresses dynamic range of the magnitude spectrum
    
    ![pic1](https://github.com/user-attachments/assets/b8fe7bfa-4025-466e-8355-4fafe1244f26)

**2) Ideal & Gaussian Low-pass in frequency**

    Ideal LP sharply cuts high frequencies → causes ringing.
    
    Gaussian LP decays smoothly → avoids artifacts.

  **3) Apply LP filters in frequency domain**

    Multiply filter with shifted spectrum → apply filter.
    
    Use ifftshift before inverse FFT to un-center frequencies.
    
    The ideal filter produces ringing around edges (Gibbs effect).

    ![pic2](https://github.com/user-attachments/assets/661d37af-adb4-4428-96d5-1c11e473ad50)

  **4) High-pass via complement**

  This extracts edge and texture details by removing low frequencies.

  ![pic3](https://github.com/user-attachments/assets/e9d2a2e6-b68d-40b5-980b-d1e775fda037)

  **5) Compare spatial vs frequency-domain Gaussian LP**

  Both should look nearly identical — confirming the convolution theorem numerically.

  ![pic4](https://github.com/user-attachments/assets/97d5d403-8f9d-4fef-88aa-7fcb851f2503)

  **6) Reflections**

  1) Why does ideal LP cause ringing (Gibbs phenomenon)?
     
     Because a sharp cutoff in frequency domain corresponds to a sinc function in spatial domain, which oscillates and causes visible ripples near edges.

  2) What does fftshift do visually?

     It shifts the zero-frequency (DC) component to the center of the image, making the spectrum symmetrical and easier to interpret — low frequencies in the middle, high at edges.

  3) When is frequency-domain filtering computationally preferable?

     For large kernels, since FFT-based convolution is O(NlogN) vs. direct O(N^2). It’s widely used in deblurring, correlation, and large-scale filtering.
 
     


    


