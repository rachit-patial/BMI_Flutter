import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double _result = 0;
  String _message = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Age in years', icon: Icon(Icons.calendar_month)),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'height in cm',
                icon: Icon(Icons.trending_up),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'weight in kg',
                icon: Icon(Icons.line_weight_outlined),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              onPressed: calculateBMI,
              child: const Text(
                "Calculate",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              _result == 0 ? "Enter Value" : _result.toStringAsFixed(2),
              style: const TextStyle(
                color: Colors.redAccent,
                fontSize: 19.4,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              _message == "" ? "" : _message,
              style: TextStyle(
                color: Colors.pink.shade900,
                fontSize: 26,
                fontWeight: FontWeight.w200,
              ),
            )
          ],
        ),
      ),
    );
  }

  void calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double wieght = double.parse(_weightController.text);

    double heightSquare = height * height;
    double result = wieght / heightSquare;
    _result = result;
    _message = checkBMI(result);
    setState(() {});
  }

  String checkBMI(double bmi) {
    String message;

    if (bmi < 16) {
      message = "Severe Thinness";
    } else if (bmi >= 16 && bmi < 17) {
      message = "Moderate Thinness";
    } else if (bmi >= 17 && bmi < 18.5) {
      message = "Mild Thinness";
    } else if (bmi >= 19.5 && bmi < 25) {
      message = "Normal";
    } else if (bmi >= 25 && bmi < 30) {
      message = "Overweight";
    } else {
      message = "Obese";
    }

    return message;
  }
}
