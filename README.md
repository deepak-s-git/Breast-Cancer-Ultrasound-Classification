<h1 align="center">🩺 Breast Cancer Ultrasound Classification</h1>

<p align="center">
A deep-learning classifier built using MATLAB to distinguish between <b>benign</b> and <b>malignant</b> breast tumors using ultrasound images.
<br>
Enhanced LeNet-5 architecture • Batch Normalization • Data Augmentation • Dropout
</p>

---

## 📁 Project Structure

```plaintext
├── ultrasound breast classification/     # Training & validation dataset
│   ├── train/
│   │   ├── benign/
│   │   └── malignant/
│   └── val/
│       ├── benign/
│       └── malignant/
│
├── testimages/                           # Images for prediction
│
├── Train.m                               # Script to build & train the CNN
├── Predict.m                             # Script to classify test images
├── BreastUS_CNN_Trained.mat              # Saved trained CNN model
└── README.md                             # Project documentation


🎯 Project Overview

Breast cancer remains one of the most serious health issues affecting women globally.
Ultrasound imaging is widely used because it is:

Safe
Affordable
Effective for dense breast tissue
However, interpreting ultrasound scans manually is challenging due to noise, shadows, and irregular tumor shapes.

This project applies deep learning using an enhanced version of LeNet-5 CNN to classify tumors into:

Benign
Malignant

This automated approach helps radiologists by:

✔ Reducing workload
✔ Improving diagnostic accuracy
✔ Providing faster predictions


🧠 Model Architecture

The network is based on an improved LeNet-5 with modifications for medical imaging.

🔍 Major Layers

Input: 128×128 grayscale ultrasound image
Conv + BatchNorm + ReLU blocks: Extract low-level & high-level texture patterns
Max-Pooling: Spatial reduction + translation invariance
Deep feature conv layer: 64 filters for tumor boundary detection
Fully connected layers: 120 & 84 neurons
Dropout: Prevents overfitting
Softmax layer: Outputs benign or malignant probability

This model is optimized to run efficiently on CPU-only systems.


📊 Dataset Description

This project uses real clinical breast ultrasound images.

Dataset Summary

~4100 benign training images
~4000 malignant training images
900 validation images (500 benign / 400 malignant)
All images resized to 128×128
Data augmentation used: rotation, flipping, scaling


⚙️ Implementation Details

🖥 Software

MATLAB R2023a
Deep Learning Toolbox

| Parameter     | Value    |
| ------------- | -------- |
| Optimizer     | Adam     |
| Learning rate | 0.004    |
| Batch size    | 32       |
| Epochs        | 20       |
| Hardware      | CPU-only |


🏆 Results

The trained model achieved:

| Metric          | Score  |
| --------------- | ------ |
| **Precision**   | 89.08% |
| **Recall**      | 89.53% |
| **F1-Score**    | 89.17% |
| **Specificity** | 89.52% |
| **Accuracy**    | 89.22% |


🧪 Running Predictions

Use the Predict.m script:
Run the script in MATLAB
Select one or more ultrasound images
The model displays classification results with bounding box/overlay
Accepted test images go inside:

testimages/


📎 References

Breast Ultrasound Images Dataset (Kaggle)
LeCun et al., Gradient-Based Learning Applied to Document Recognition
MATLAB Deep Learning Toolbox
Research articles on ultrasound tumor detection


<h3 align="center">✨ If you like this project, consider giving it a ⭐ on GitHub!</h3> ```