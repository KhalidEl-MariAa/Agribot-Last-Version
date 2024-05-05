import 'package:flutter/material.dart';
import 'package:flutter_application_1/NavigationBar/main_page.dart';

class LogInButton extends StatelessWidget {
  const LogInButton({super.key, required this.buttonLabel});
 final String buttonLabel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>  const MainPage(),
                  ));
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.teal[400]),
                  child:  Text(
                    buttonLabel,
                    style:const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ));
  }
}