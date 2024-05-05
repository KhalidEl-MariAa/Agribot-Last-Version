import 'package:flutter/material.dart';
import 'package:flutter_application_1/Navigation%20Drawer/app_drawer.dart';
import 'package:flutter_application_1/account_data.dart';

class SoundIndicatorScreen extends StatefulWidget {
  const SoundIndicatorScreen({super.key});

  @override
  _SoundIndicatorScreenState createState() => _SoundIndicatorScreenState();
}

class _SoundIndicatorScreenState extends State<SoundIndicatorScreen> {
  double _soundLevel = 0.0;
  final double _minValue = 0;
  final double _maxValue = 45;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal[400],
        title: const Text(
          'Wether station',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Account(),
                ));
              },
              icon: const Icon(
                Icons.account_circle_outlined,
                size: 35,
                color: Colors.white,
              ))
        ],
      ),
      drawer: const AppDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${_soundLevel.toStringAsFixed(2)} cm'),
                Text('$_maxValue cm'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SliderTheme(
            data: SliderThemeData(
              activeTrackColor: Colors.teal[400],
              inactiveTrackColor: Colors.grey,
              thumbColor: Colors.teal[400],
              overlayColor: Colors.blue.withOpacity(0.3),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
              tickMarkShape: const RoundSliderTickMarkShape(),
              showValueIndicator: ShowValueIndicator.always,
            ),
            child: Slider(
              value: _soundLevel,
              min: _minValue,
              max: _maxValue,
              onChanged: (newValue) {
                setState(() {
                  _soundLevel = newValue;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
