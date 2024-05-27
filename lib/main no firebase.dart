import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:sensors_plus/sensors_plus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Interpreter interpreter; // Use 'late' to indicate late initialization
  List<double> accelerometerValues = [0.0, 0.0, 0.0];
  List<double> prediction = [0.0, 0.0, 0.0, 0.0]; // Initialize with default values

  @override
  void initState() {
    super.initState();
    _initModel();
    _initAccelerometer();
  }



  Future<void> _initModel() async {
    interpreter = await Interpreter.fromAsset('assets/model.tflite');
  }

  void _initAccelerometer() {
    accelerometerEvents.listen((event) {
      setState(() {
        accelerometerValues = [event.x, event.y, event.z];
        _makePrediction(); // Make predictions whenever new data is received
      });
    });
  }

  Future<void> _makePrediction() async {
    // Check if the interpreter is initialized
    if (interpreter == null) return;

    // Prepare input data as per your model's requirements
    final x = accelerometerValues[0];
    final y = accelerometerValues[1];
    final z = accelerometerValues[2];

    // Reshape the input data to match the expected shape [1, 1, 3]
    final input_data = [
      [
        [x, y, z],
      ],
    ];

    try {
      final output = List.filled(1, <double>[]); // Initialize an empty list

      interpreter.run(input_data, output);

      // Update the prediction with the output from the model
      setState(() {
        prediction = output[0];
      });
    } catch (e) {
      print('Prediction error: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accelerometer & Prediction App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Accelerometer Data:'),
            Text('X: ${accelerometerValues[0]}'),
            Text('Y: ${accelerometerValues[1]}'),
            Text('Z: ${accelerometerValues[2]}'),
            SizedBox(height: 20), // Add some spacing
            Text('Model Predictions:'),
            Text('Class 1: ${prediction[0]}'),
            Text('Class 2: ${prediction[1]}'),
            Text('Class 3: ${prediction[2]}'),
            Text('Class 4: ${prediction[3]}'),
          ],
        ),
      ),
    );
  }
}
