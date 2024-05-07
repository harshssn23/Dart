import 'package:flutter/material.dart';

void main() {
  runApp(const HelloApp());
}

class HelloApp extends StatelessWidget {
  const HelloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HelloHomePage(),
    );
  }
}

class HelloHomePage extends StatefulWidget {
  const HelloHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HelloHomePageState createState() => _HelloHomePageState();
}

class _HelloHomePageState extends State<HelloHomePage> {
  String _name = "";  // Store the name entered by the user
  final _nameController = TextEditingController();  // Controller for the text field

  @override
  void dispose() {
    // Dispose of the controller when the widget is removed from the widget tree
    _nameController.dispose();
    super.dispose();
  }

  void _showHelloMessage() {
    // Display a SnackBar with the "Hello" message and the name
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Hello, $_name!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello App'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text field to input the name
            TextField(
              controller: _nameController, 
              style: const TextStyle(
                color: Colors.amber,
              ), // Attach the controller
              decoration: const InputDecoration(
                labelText: "Enter your name",
                // Label for the text field
                ),
              onChanged: (text) {
                setState(() {
                  _name = text;  // Update the state with the entered name
                });
              },
            ),
          
            const SizedBox(height: 20),  // Spacer between text field and button
            // OK button to show the hello message
            ElevatedButton(
              onPressed: _showHelloMessage,  // Action to trigger on button click
              child: const Text("OK"),  // Label for the button
            ),
          ],
        ),
      ),
    );
  }
}
