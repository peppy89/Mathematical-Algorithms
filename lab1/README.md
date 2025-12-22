# Lab1_Image_as_2D_signal
1) Load and inspect an image
   Converts RGB to grayscale, displays both, and prints basic info.
   
   ![pịc_lab1](https://github.com/user-attachments/assets/763b49c7-4ea8-4372-be24-02a5b0159cb6)
   
   ![pic2_lab1](https://github.com/user-attachments/assets/a8d6c7cd-38cb-4a21-9236-f61f2c0575e8)
   ![pic1_lab1](https://github.com/user-attachments/assets/9e23cdc6-d6ad-4eeb-84cb-f36721ce94ea)


2) Quantization and dynamic range
   Reduces bit-depth to simulate 6-bit and 4-bit quantization
   
   ![pic3_lab1](https://github.com/user-attachments/assets/52c6a6c7-d227-4b5b-8b99-9d3b345794db)

3) Histogram and contrast stretching
   Compresses midtones into full dynamic range → improved contrast.
   
   ![pic4_lab1](https://github.com/user-attachments/assets/b68f4ddf-6ed0-4312-a147-7bdcd58c3159)

4) Gamma correction (nonlinear amplitude scaling)
   
   Applies nonlinear remapping with γ = 0.6 (brighten) and γ = 1.6 (darken):
   
     I_gamma_low = imadjust(I,[],[],0.6);
      I_gamma_high = imadjust(I,[],[],1.6);
   
   ![pic5_lab1](https://github.com/user-attachments/assets/f6a5fa40-b254-49c7-8ae4-eb98c93dd13a)

5) Sampling and aliasing (downsample then upsample)
  Downsamples image to 10% size, then resizes back.
  Shows aliasing when sampling frequency < Nyquist rate

  ![pic6_lab1](https://github.com/user-attachments/assets/2c9d1575-09a4-4eeb-9af1-8fd5e04574c2)

6) Short reflections
   1. Relate bit-depth to visible banding/posterization you observed.
      Lower bit-depth (e.g., 4-bit) introduces visible steps—posterization—since fewer levels represent intensity.
      
   2. How does contrast stretching change the histogram and visibility of details?
      Expands narrow histogram to fill full range → better local detail and separation of tones.
      
   3. Explain why aggressive downsampling causes aliasing (reference Nyquist)
      When sampling below Nyquist (less than 2 samples per smallest detail), high-frequency components fold into lower ones → jagged or repetitive patterns.
