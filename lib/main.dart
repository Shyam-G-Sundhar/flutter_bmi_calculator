import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        backgroundColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BMICalculatorScreen(),
    );
  }
}

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  double _height = 0;
  double _weight = 0;
  double _bmi = 0;
  String _bmiStatus = '';

  void calculateBMI() {
    setState(() {
      _bmi = _weight / ((_height / 100) * (_height / 100));
      _bmiStatus = getBMIStatus(_bmi);
    });
  }

  String getBMIStatus(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 25) {
      return 'Normal';
    } else if (bmi < 30) {
      return 'Overweight';
    } else if (bmi > 30.00) {
      return 'Obese';
    } else {
      return 'Enter the Details';
    }
  }

  Color getBMIStatusColor(String bmiStatus) {
    if (bmiStatus == 'Underweight') {
      return Colors.blue;
    } else if (bmiStatus == 'Normal') {
      return Colors.green;
    } else if (bmiStatus == 'Overweight') {
      return Colors.orange;
    } else if (bmiStatus == 'Enter the Details') {
      return Colors.blueGrey;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "BMI Calculator",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 35.0,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Height (in cm)',
              ),
              onChanged: (value) {
                setState(() {
                  _height = double.parse(value);
                  calculateBMI();
                });
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight (in kg)',
              ),
              onChanged: (value) {
                setState(() {
                  _weight = double.parse(value);
                  calculateBMI();
                });
              },
            ),
            SizedBox(height: 24.0),
            Text(
              'BMI: ${_bmi.toStringAsFixed(2)}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: getBMIStatusColor(_bmiStatus),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Status: $_bmiStatus',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                color: getBMIStatusColor(_bmiStatus),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
