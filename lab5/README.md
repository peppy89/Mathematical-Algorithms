# Lab 5: Edge Detection and Segmentation

**1) Basic derivative filters (Sobel, Prewitt)**

  - Both operators approximate 1st-order spatial derivatives (gradients).
  
  - Sobel uses larger weight in center row/column → slightly smoother, more robust to noise.
  
  - Prewitt is simpler and purely gradient-based.
  
  The gradient magnitude increases where pixel intensity changes rapidly — i.e., edges.

  ![pic1](https://github.com/user-attachments/assets/ab2dcc1e-5864-45c8-ac87-87920c5f0bc2)


**2) Canny detector (multi-stage)**

  Canny performs:
  
  - Gaussian smoothing (noise suppression).
  
  - Gradient computation (edge strength).
  
  - Non-maximum suppression (thin edges).
  
  - Hysteresis thresholding using two thresholds (0.05 & 0.2 here).

    
  ✅ Produces the thinnest and cleanest edges — the best balance between detection accuracy and noise rejection.

  ![pic2](https://github.com/user-attachments/assets/cfa85013-3381-4cb9-973c-ad35faa66d73)

**3) Laplacian of Gaussian (LoG)**

  - Laplacian of Gaussian (LoG) applies a second derivative after smoothing.
  
  - Detects zero-crossings of the Laplacian — locations where intensity curvature changes sign.
  
  - Works well for closed contours, but may produce thick edges if not thresholded carefully.
  
  Conceptual link: The Laplacian responds to both positive and negative changes in intensity (2nd-order edges).

  ![pic3](https://github.com/user-attachments/assets/c3590dce-8b39-4a3b-86cf-15f811bce6fa)

**4) Edge map → segmentation (Otsu threshold)**

  - Otsu’s method automatically finds the threshold that maximizes inter-class variance in the histogram.
  
  - It effectively separates foreground and background without manual tuning.
  
  Concept: Histogram-based segmentation → best single threshold splits image intensities into two distinct clusters.

  ![pic4](https://github.com/user-attachments/assets/f2c11782-6fa5-4586-9edd-24f4aa663add)


**5) Label and visualize regions**

  - bwlabel assigns a unique label to each connected white region.
  
  - label2rgb converts those labels into a colorful visualization.
  
  - The variable num shows the total number of detected objects.

    ![pic5](https://github.com/user-attachments/assets/0bc6f020-e918-40af-bd18-baefcd17b17d)
      
**6) Reflections**

  - Which operator gives the thinnest, cleanest edges?
  
      Canny — due to non-maximum suppression and dual thresholds that remove weak or spurious edges.
      
  - Why does Canny outperform simple gradient filters?

      It combines noise suppression, gradient magnitude filtering, and hysteresis thresholding, ensuring only meaningful continuous edges remain
    
  - How does Otsu relate to histogram-based thresholding?
  
      It automatically finds the threshold that maximizes the variance between two classes (foreground/background), equivalent to selecting the histogram valley between peaks.

   
