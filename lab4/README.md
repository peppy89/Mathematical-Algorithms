# Lab 4: Noise and Filtering

**1) Add different noise types**

    - Gaussian noise: additive, continuous, affects all pixels with small variations — models sensor or transmission noise.
    
    - Salt & pepper noise: impulse-type — random pixels become 0 (“pepper”) or 1 (“salt”) — models bit errors or dead pixels.
    
     Observation: Gaussian noise gives fine “grain,” while salt-and-pepper shows bright and dark specks.

  ![pic1](https://github.com/user-attachments/assets/8da94337-37c6-4f79-811b-78e1d58a2526)
  
**2) Compute simple quality metrics**

    Lower MSE → better quality (less distortion).

**3) Linear filtering (mean, Gaussian)**

    Mean filter (box): Simple averaging; smooths noise but also blurs edges.

    Gaussian filter: Weighted averaging, more natural smoothing, reduces high frequencies gently.
    
    Note: Both are linear, so strong edges get blurred when averaged with neighboring intensities.

**4) Non-linear filtering (median)**

    Median filter: replaces each pixel by the median in its neighborhood.
    
  → Excellent for removing impulse (salt-and-pepper) noise because outliers don’t affect the median.

   Observation: Median preserves edges better than averaging filters, especially for sparse noise.
   
  ![pic2](https://github.com/user-attachments/assets/2ad554ca-13d7-4ad5-b383-3a02b9756cf2)


**5) Compare metrics after filtering**

    This quantifies which filter better restores the original.
    You should see that median filtering gives much lower MSE for salt-and-pepper noise.

**6) Reflections**

   - Which noise is best removed by median filter? Why?
     
     Median is most effective against salt-and-pepper noise, because it removes isolated outlier pixels while preserving edges.
     
   - Why does linear filtering blur edges more?
     
     Mean/Gaussian filters average across intensity boundaries, smoothing both noise and actual edges.
     
   - How could we design adaptive filters to preserve detail?
     
     Adaptive methods (e.g., bilateral filter, Wiener filter) adjust weights based on local variance or intensity similarity, reducing noise while retaining edges.


