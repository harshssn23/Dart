import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Flutter Button Example",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 25,
              // backgroundColor: Colors.pinkAccent,
            ),
          ),
        backgroundColor: Colors.pink,
        centerTitle: true,),
        body: const Center(
          child: MyButton(), // Add your button widget here
        ),
        
      ),
    );
  }
}


class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Define the action that occurs when the button is pressed
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
            "Button Pressed!",
            style: TextStyle(
                height: 40,
                color: Colors.blue,),),
          backgroundColor: Colors.amber,
          // padding: EdgeInsets.all(130.0),
          )
        );
      },
      child: const Text(
        "Press Me",
        style: TextStyle(
          color: Colors.amber,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          // backgroundColor: Colors.blue,
        ),
      ), 
      // The label displayed on the button
    );
  }
}
