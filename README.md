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
