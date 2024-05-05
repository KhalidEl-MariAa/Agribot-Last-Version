import 'package:flutter/material.dart';
import 'package:flutter_application_1/NavigationBar/Columnlength.dart';
import 'package:flutter_application_1/NavigationBar/QR.dart';
import 'package:flutter_application_1/NavigationBar/car.dart';
import 'package:flutter_application_1/home-view.dart';
import 'package:tflite/tflite.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<MainPage> {
   Future<void> loadModel ()async { // define the function that create the ai model
   await  Tflite.loadModel(
    model:'assets/model_unquant.tflite',///
    
    labels: 'assets/labels.txt',/// 
      
);
  }
  int currentPageIndex = 0;
  final List<Widget> _pages = [const HomeView(), const Car(), const Qr(), const SoundIndicatorScreen()];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  loadModel();
    
  }
 
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      
      body: _pages[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.teal[400],
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home_outlined),
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.car_crash_outlined),
            icon: Badge(child: Icon(Icons.car_rental)),
            label: 'car',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.qr_code_scanner_sharp),
            icon: Badge(
              child: Icon(Icons.qr_code_2_outlined),
            ),
            label: 'Qr',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.vertical_align_center_sharp),
            icon: Badge(child: Icon(Icons.align_vertical_bottom_sharp)),
            label: 'Column length',
          ),
        ],
      ),
    );
  }
}
