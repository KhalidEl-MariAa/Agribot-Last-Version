import 'package:flutter_application_1/add_figma/bar%20graph/bar%20graph.dart';

class BarData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double webAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;
  BarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.webAmount,
    required this.thurAmount,
    required this.friAmount,
    required this.satAmount,
  });

  List<IndividualBar> barData = [
  ];
  void initializeBarData(){
      barData =[

        IndividualBar(x: 0, y: sunAmount),
        IndividualBar(x: 0, y: monAmount),
        IndividualBar(x: 0, y: tueAmount),
        IndividualBar(x: 0, y: webAmount),
        IndividualBar(x: 0, y: thurAmount),
        IndividualBar(x: 0, y: friAmount),
        IndividualBar(x: 0, y: satAmount),
       
        
      ];
    }
  // List<BarGraph >
}
