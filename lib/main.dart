import 'package:flutter/material.dart';
import 'homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Utility App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(), // This points to your fixed homescreen!
    );
  }
}
