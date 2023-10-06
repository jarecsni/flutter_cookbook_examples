import 'package:flutter/material.dart';
import './basic_screen.dart';

void main(List<String> args) => runApp(const StaticApp());

class StaticApp extends StatelessWidget {
  const StaticApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const BasicScreen(),
    );
  }
}
