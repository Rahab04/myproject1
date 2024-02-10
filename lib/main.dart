import 'package:flutter/material.dart';
import 'package:mycashbook/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cash book',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Livvic',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: Login(),
    );
  }
}

