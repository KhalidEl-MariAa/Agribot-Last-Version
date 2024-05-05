import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Image(image: AssetImage('assets/about us/second.png'),),
                Image(image: AssetImage('assets/about us/1.png'),),
                Image(image: AssetImage('assets/about us/3.png'),),
                Image(image: AssetImage('assets/about us/4.png'),),
                Image(image: AssetImage('assets/about us/5.png'),),
                Image(image: AssetImage('assets/about us/6.png'),),
                Image(image: AssetImage('assets/about us/7.png'),),
                Image(image: AssetImage('assets/about us/8.png'),),
                Image(image: AssetImage('assets/about us/9.png'),),
                Image(image: AssetImage('assets/about us/10.png'),),
                Image(image: AssetImage('assets/about us/11.png'),)],
            ),
          )
        ],
      ),
    );
  }
}