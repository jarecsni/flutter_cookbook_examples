import 'package:flutter/material.dart';
import 'package:flutter_cookbook_examples/chapter5/profile_screen.dart';

void main(List<String> args) => runApp(const StaticApp());

class StaticApp extends StatelessWidget {
  const StaticApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter Demo",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: const FlexScreen(),
        home: const ProfileScreen());
  }
}
