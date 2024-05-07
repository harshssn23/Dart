import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  // Controllers for the text fields
  final _num1Controller = TextEditingController();
  final _num2Controller = TextEditingController();

  double _result = 0;  // To store the result

  // Function to add two numbers
  void _addNumbers() {
    final num1 = double.tryParse(_num1Controller.text) ?? 0;
    final num2 = double.tryParse(_num2Controller.text) ?? 0;
    setState(() {
      _result = num1 + num2;  // Perform addition
    });
  }

  // Function to subtract two numbers
  void _subtractNumbers() {
    final num1 = double.tryParse(_num1Controller.text) ?? 0;
    final num2 = double.tryParse(_num2Controller.text) ?? 0;
    setState(() {
      _result = num1 - num2;  // Perform subtraction
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisignment.stretch,  // Stretch to fit width
          children: <Widget>[
            // Input field for the first number
            TextField(
              controller: _num1Controller,
              decoration: const InputDecoration(
                labelText: "Enter first number",
              ),
              keyboardType: TextInputType.number,  // Expect numeric input
            ),
            const SizedBox(height: 16),  // Spacer between fields

            // Input field for the second number
            TextField(
              controller: _num2Controller,
              decoration: const InputDecoration(
                labelText: "Enter second number",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),  // Spacer between fields

            // Buttons for addition and subtraction
            Row(
              // mainAxisAlignment: MainAxisignment.spaceAround,  // Space between buttons
              children: [
                ElevatedButton(
                  onPressed: _addNumbers,
                  child: const Text("Add"),
                ),
                ElevatedButton(
                  onPressed: _subtractNumbers,
                  child: const Text("Subtract"),
                ),
              ],
            ),
            const SizedBox(height: 16),  // Spacer between buttons and result

            // Display the result
            Text(
              "Result: $_result",  // Show the result of the calculation
              style: const TextStyle(fontSize: 24),  // Make the text larger
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Properly dispose of the controllers when no longer needed
    _num1Controller.dispose();
    _num2Controller.dispose();
    super.dispose();
  }
}


