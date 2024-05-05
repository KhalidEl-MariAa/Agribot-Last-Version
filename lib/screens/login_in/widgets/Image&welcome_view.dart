import 'package:flutter/material.dart';

class ImageAndWelcomeView extends StatelessWidget {
  const ImageAndWelcomeView({super.key, required this.welcomePhraseText});
final String welcomePhraseText;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
         const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/4.jpg'),
            ),
             const SizedBox(
              height: 30,
            ),
            Text(
              welcomePhraseText,
              style: TextStyle(fontSize: 20, color: Colors.teal[400]),
            ),
      ],
    );
  }
}