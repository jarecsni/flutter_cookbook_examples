import 'package:flutter/material.dart';
import 'package:flutter_cookbook_examples/chapter5/e_commerce_screen.dart';

void main(List<String> args) => runApp(const StaticApp());

class StaticApp extends StatelessWidget {
  const StaticApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter Demo",
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.green,
          appBarTheme: AppBarTheme(
            elevation: 10,
            titleTextStyle: const TextTheme(
                titleLarge: TextStyle(
              fontFamily: 'LeckerliOne',
              fontSize: 24,
            )).titleLarge,
          ),
        ),
        //home: const FlexScreen(),
        //home: const ProfileScreen());
        // home: const DeepTree(),
        home: const ECommerceScreen());
  }
}
