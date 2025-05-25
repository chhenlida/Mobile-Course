import 'package:flutter/material.dart';
import 'narbar.dart'; // <-- Import your nav bar file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomNavBar(), // <-- Use your custom nav bar here
    );
  }
}