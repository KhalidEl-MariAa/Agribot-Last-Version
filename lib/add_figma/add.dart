
import 'package:flutter/material.dart';
import 'package:flutter_application_1/sensor.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  List<Sensor> sensor = [
    Sensor(
        name: 'Ph sensor',
        description:
            'It is a miniature computer with standard credit card dimensions ',
        reading: 0),
    Sensor(
        name: 'Soil moisture sensor',
        description:
            'It is a device for monitoring moisture levels in the soil',
        reading: 0),
    Sensor(
        name: 'Soil temperature sensor',
        description:
            'They are devices used to measure the temperature of the soil or ground.',
        reading: 0)
  ];
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}