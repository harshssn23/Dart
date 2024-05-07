import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi-Input Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MultiInputHomePage(),
    );
  }
}

class MultiInputHomePage extends StatefulWidget {
  const MultiInputHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MultiInputHomePageState createState() => _MultiInputHomePageState();
}

class _MultiInputHomePageState extends State<MultiInputHomePage> {
  // Create TextEditingControllers for multiple inputs
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();

  // Function to show a message with all inputs
  void _showMessage() {
    final firstName = _firstNameController.text;
    final lastName = _lastNameController.text;
    final age = _ageController.text;

    final message = "Hello, $firstName $lastName! You are $age years old.";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void dispose() {
    // Dispose of controllers when done to avoid memory leaks
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi-Input Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding for better UI
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Stretch to fit width
          children: [
            // First Name input field
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                labelText: "First Name",
              ),
            ),
            const SizedBox(height: 16), // Spacer between fields

            // Last Name input field
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                labelText: "Last Name",
              ),
            ),
            const SizedBox(height: 16), // Spacer between fields

            // Age input field
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(
                labelText: "Age",
              ),
              keyboardType: TextInputType.number, // Expect numeric input
            ),
            const SizedBox(height: 16), // Spacer between fields

            // OK button to display the message
            ElevatedButton(
              onPressed: _showMessage,
              child: const Text("OK"),
            ),
          ],
        ),
      ),
    );
  }
}
