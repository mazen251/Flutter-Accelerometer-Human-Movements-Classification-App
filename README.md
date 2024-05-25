# Accelerometer Movement Prediction App
Welcome to the Accelerometer Movement Prediction App! This Flutter application utilizes TensorFlow Lite and device sensors to capture accelerometer data and make real-time predictions using a machine learning model.

## Table of Contents
- Introduction
- Features
- Installation
- Usage
- Project Structure
- Contributing
- License
- Acknowledgements

## Introduction
The Accelerometer Movement Prediction App is designed to demonstrate how to integrate TensorFlow Lite with Flutter to make predictions based on real-time accelerometer data. This project showcases how to capture sensor data, process it, and feed it into a pre-trained machine learning model to obtain predictions.

## Features
- **Real-time accelerometer data capture**
- **Integration with TensorFlow Lite for on-device machine learning**
- **User-friendly interface displaying sensor data and model predictions**
- **Cross-platform support (Android, iOS)**

## Installation
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.
### Prerequisites:
- Flutter SDK: Install Flutter
- TensorFlow Lite model: Ensure you have a .tflite model file

### Steps
```sh
#Clone the Repository
git clone https://github.com/mazen251/Flutter-Accelerometer-Human-Movements-Classification-App.git
cd Flutter-Accelerometer-Human-Movements-Classification-App-master

#Add the TensorFlow Lite Model, Place your model.tflite file in the assets directory.
cd assets
#Use the existing models or your own model  

#Update pubspec.yaml, Ensure the assets section in pubspec.yaml includes your model:
flutter:
  assets:
    - assets/model.tflite

#Install Dependencies,Run the following command to install the required dependencies:
flutter pub get

#Run the App, Connect your device or start an emulator, then run:
flutter run
```
## Usage
### Launch the App
- Start the app on your device/emulator.

### View Accelerometer Data
- The app displays real-time accelerometer data (X, Y, Z axes).

### View Model Predictions
- The app makes predictions based on the accelerometer data and displays the results for different classes.

## Contributing
contributions are welcomed to improve this project. To contribute, please follow these steps:

- Fork the repository.
- Create a new branch (git checkout -b feature/your-feature).
- Commit your changes (git commit -m 'Add some feature').
- Push to the branch (git push origin feature/your-feature).
- Open a pull request.

## License
This project is licensed under the MIT License. See the `LICENSE` for more details.

## Contact
Mazen Walid - [@Mazen Walid](https://www.linkedin.com/in/mazen-walid-225582208/)

## Acknowledgements
- Flutter
- TensorFlow Lite
- Sensors Plus

