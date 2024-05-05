import 'package:flutter/material.dart';
import 'package:flutter_application_1/Navigation%20Drawer/app_drawer.dart';
import 'package:flutter_application_1/account_data.dart';

class Car extends StatelessWidget {
  const Car({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal.shade400,
        title: const Text(
          'Pesticide Robot',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
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
          ElevatedButton(
            onPressed: () {
              print('ON button pressed');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.greenAccent.shade400,
            ),
            child: const Text(
              'ON - Open Spray',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          const SizedBox(height: 80.0),
          ElevatedButton(
            onPressed: () {
              print('OFF button pressed');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade500, // لون الخلفية
            ),
            child: const Text(
              'OFF - Close Spray',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          const SizedBox(
            height: 80.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ArrowButton(
                  imagePath: 'assets/up_arrow.PNG',
                  onPressed: () => _handleArrowPress('Up')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ArrowButton(
                  imagePath: 'assets/left_arrow.PNG',
                  onPressed: () => _handleArrowPress('Left')),
              StopButton(
                  imagePath: 'assets/stop_button.PNG',
                  onPressed: () => _handleStopPress()),
              ArrowButton(
                  imagePath: 'assets/right_arrow.PNG',
                  onPressed: () => _handleArrowPress('Right')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ArrowButton(
                  imagePath: 'assets/down_arrow.PNG',
                  onPressed: () => _handleArrowPress('Down')),
            ],
          ),
        ],
      ),
    );
  }

  void _handleArrowPress(String direction) {
    // تنفيذ العمليات المناسبة عند الضغط على الأسهم هنا
    print('Arrow pressed: $direction');
  }

  void _handleStopPress() {
    // تنفيذ العمليات المناسبة عند الضغط على الزر الدائري هنا
    print('Stop button pressed');
  }
}

class ArrowButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  const ArrowButton(
      {super.key, required this.imagePath, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          imagePath,
          width: 80.0,
          height: 80.0,
        ),
      ),
    );
  }
}

class StopButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  const StopButton(
      {super.key, required this.imagePath, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          imagePath,
          width: 85.0,
          height: 85.0,
        ),
      ),
    );
  }
}
