Breast Cancer Ultrasound Classification

This project focuses on building a deep-learning–based classifier for breast ultrasound images to distinguish between benign and malignant tumors. The model is implemented in MATLAB using an enhanced LeNet-5 Convolutional Neural Network, with additional improvements such as data augmentation, batch normalization, and dropout.

The goal was to design a lightweight model that runs smoothly on CPU-based systems while still achieving strong accuracy and generalization on real ultrasound images.


├── ultrasound breast classification/     # Training and validation dataset
│   ├── train/
│   │   ├── benign/
│   │   └── malignant/
│   └── val/
│       ├── benign/
│       └── malignant/
│
├── testimages/                           # User-provided images for prediction
│
├── Train.m                               # Training script (build + train CNN)
├── Predict.m                             # Script to run predictions on images
├── BreastUS_CNN_Trained.mat              # Saved trained model
└── README.md                             # Project documentation


🎯 Project Overview

Breast cancer remains one of the most common and serious health issues affecting women globally. Ultrasound imaging is frequently used for diagnosis due to its safety, affordability, and suitability for dense breast tissue. However, interpreting ultrasound scans manually can be challenging because the images often contain noise, shadows, and irregular shapes.

To address this, the project applies a deep learning approach using an improved CNN model inspired by LeNet-5. The network learns patterns from thousands of ultrasound images and classifies them into:

Benign
Malignant

This automated approach can support radiologists by reducing workload, minimizing misclassification, and providing faster diagnosis.

🧠 Model Architecture

The network is built on an enhanced version of LeNet-5 with medically suitable modifications.
Major layers include:

Input layer – accepts 128×128 grayscale ultrasound images
Convolution + BatchNorm + ReLU blocks – extract low-level and deep texture features
Max-Pooling layers – reduce spatial size and help with translation invariance
Deep feature extraction block – 64-filter conv layer for tumor boundary detection
Fully connected layers – 120 and 84 neurons for high-level feature learning
Dropout – reduces overfitting
Softmax classification layer – outputs benign / malignant probabilities
This architecture is efficient and deployable on normal CPU systems.



📊 Dataset Description

The dataset contains real clinical breast ultrasound images, organized into training and validation folders with medically verified labels.

From the project report 

Breast Cancer Classification

~4100 benign training images
~4000 malignant training images
500 benign + 400 malignant validation images
All images were preprocessed into 128×128 grayscale format
Augmentations used: rotation, flipping, and scaling


⚙️ Implementation Details
Software Used
MATLAB R2023a

Deep Learning Toolbox

Training Setup
Optimizer: Adam
Learning rate: 0.004
Batch size: 32
Epochs: 20
Hardware: CPU-only


🏆 Results

The trained model achieved strong performance across both classes.

Final Precision:     89.08%
Final Recall:        89.53%
Final F1-Score:      89.17%
Final Specificity:   89.52%
Final Accuracy:      89.22%



🧪 Running Predictions

The Predict.m script allows testing images directly:
Run the script
Select one or multiple images for classification
The model outputs “benign” or “malignant” with visualization
Images for testing are stored in:

testimages/


📎 References

Breast Ultrasound Images Dataset (Kaggle)
LeCun et al. "Gradient-Based Learning Applied to Document Recognition"
MATLAB Deep Learning Toolbox Documentation
Published medical research on ultrasound-based tumor detection.