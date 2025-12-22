# Lab8
**Section 1: Load Image and AI Network**

  - Loads a sample color image (peppers.png) to use as the target.
  
  - Loads a pre-trained SqueezeNet CNN (squeezenet) for image classification.
  
  - Displays the original image in the first subplot.

    ![original_img](https://github.com/user-attachments/assets/7aeb126f-b65d-4591-b9da-4d27680725ce)


**Section 2: Traditional Method (Color Segmentation with K-Means)**

  - Converts the image to L*a*b* color space and uses only the a/b channels (color info).
  
  - Uses K-means clustering (imsegkmeans) to segment the image into 2 color clusters.
  
  - Builds a binary mask for one cluster (assumed to be the main object).
  
  - Applies the mask to keep only the object and set the background to black.
  
  - Shows the mask and the isolated object.

    ![img2](https://github.com/user-attachments/assets/57b81583-a9ce-4db6-b9c9-668cc92de7fa)


**Section 3: AI Method (Image Classification)**

  - Gets the required input size of SqueezeNet (227×227×3).
  
  - Resizes the isolated object to that size.
  
  - Feeds the resized object into the network with classify.
  
  - Gets the predicted class label and class probabilities.

**Section 4: Results Analysis**

  - Displays the resized object (actual input to the AI).
  
  - Prints the predicted class and its confidence (max probability) to the command window.
  
  - Comments explain that doing traditional segmentation first helps the AI focus on the object, potentially improving classification accuracy.

    ![img3](https://github.com/user-attachments/assets/fd63efa0-0dd2-450f-a7b8-e9f04fb42b51)
