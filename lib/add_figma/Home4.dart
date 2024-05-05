import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double percentage = 0.5; // قيمة النسبة المئوية للدائرة (مثال)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circular Percentage Indicator'),
      ),
      body: Center(
        child: CircularPercentIndicator(
          radius: 150.0, // قطر الدائرة
          lineWidth: 12.0, // عرض الخط الذي يحيط بالدائرة
          percent: percentage, // النسبة المئوية
          center: Text("${(percentage * 100).toStringAsFixed(1)}%",
              style: const TextStyle(fontSize: 20.0)),
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: Colors.grey,
          progressColor: Colors.blue,
        ),
      ),
    );
  }
}
