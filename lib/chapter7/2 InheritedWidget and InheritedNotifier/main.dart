import 'package:flutter/material.dart';
import 'package:flutter_cookbook_examples/chapter7/2%20InheritedWidget%20and%20InheritedNotifier/plan_provider.dart';
import './view/plan_screen.dart';
import './model/data_layer.dart';

void main() => runApp(const MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: PlanProvider(
        notifier: ValueNotifier<Plan>(const Plan()),
        child: const PlanScreen(),
      ),
    );
  }
}
