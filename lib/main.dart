import 'package:flutter/material.dart';
import 'package:flutter_api_2/example_four.dart';
import 'package:flutter_api_2/example_three.dart';
// import 'package:flutter_api_2/example_two.dart';
// import 'package:flutter_api_2/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ExampleThree(),
    );
  }
}

