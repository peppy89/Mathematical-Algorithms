# Tire Stud Detector (MATLAB)
This project implements a simple image-processing pipeline in MATLAB to detect whether a tire is studded or non-studded.
Detection is based on grayscale preprocessing, thresholding, morphological filtering, and connected-component analysis.

---

## 📂 Project Files
+ tire_stud_detector.m (or lab9.m)
  Main MATLAB script that:

  - Loads tire images
  
  - Preprocesses them
  
  - Detects possible metal studs
  
  - Counts valid stud components
  
  - Classifies the tire
  
  - Visualizes the results

+ studded_tire.jpg

+ summer_tire.jpg
  Example input images.

  ---

  ## 🚀 How It Works
  The algorithm processes each tire image using the following steps:

  ### 1. Read & Resize Image
  
  Images are loaded (imread) and optionally scaled using imresize.
  
  ### 2. Convert to Grayscale
  
  If the image is RGB, it is converted to grayscale using rgb2gray.
  
  ### 3. Create Tire Mask
  
  Since the tire is darker than the background:
  
    - Apply Gaussian smoothing
    
    - Threshold to isolate the dark tire region
    
    - Fill internal holes (imfill)
    
    - Remove small background objects (bwareaopen)
  
  ### 4. Detect Candidate Studs
  
  Studs appear as bright spots on the tire:
  
    - Threshold for bright intensities
    
    - Restrict detection to the tire mask
    
    - Remove noise and small artifacts
    
    - (Optional) morphological closing
  
  ### 5. Connected Component Analysis
  Detect blobs using:
  ```bask
  bwconncomp(cand)
  regionprops(...)
  ```
  
  Extract important properties:
    - Area
    - Perimeter
    - Eccentricity
    - Circularity
  
  ### 6. Filter Valid Studs
  Studs should be:
  
    - Small
    
    - Round-ish
    
    - Bright
    
    - Inside the tire region
  
  Candidate blobs failing these conditions are discarded.
  
  ### 7. Classify Tire
  A simple rule is used:
  ```bash
  If studCount > threshold → STUDED TIRE
  Else → NON-STUDDED TIRE
  ```
  Optionally, density = studCount / tireArea can also be used.
  
  ### 8. Visualization
  Three images are displayed for each tire:
  
    1. Original input image
    
    2. Binary stud candidate mask
    
    3. Final detections overlaid on the original image

---

## Usage
MATLAB Desktop or MATLAB Online
### 1. Upload:
```bash
studded_tire.jpg
summer_tire.jpg
tire_stud_detector.m
```
### 2. Make sure images are in the same folder as your script.

### 3. Run:
```bash
tire_stud_detector
```
or
```bash
lab9
```
## Requirements
- MATLAB R2020+ (works on MATLAB Online)
- Image Processing Toolbox

## Project Goal
This project demonstrates fundamental computer-vision operations:

  - Thresholding
  
  - Morphological preprocessing
  
  - Blob detection
  
  - Feature filtering
  
  - Simple binary classification

Useful for learning:

  - Image segmentation
  
  - Basic feature engineering
  
  - Regionprops analysis
