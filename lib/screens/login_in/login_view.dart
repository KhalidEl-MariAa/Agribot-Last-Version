
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_in/widgets/Image&welcome_view.dart';
import 'package:flutter_application_1/screens/login_in/widgets/create_account_sen.dart';
import 'package:flutter_application_1/screens/login_in/widgets/custom_text_field.dart';
import 'package:flutter_application_1/screens/login_in/widgets/log_in_button.dart';
import 'package:flutter_application_1/screens/register/regisyer_viem.dart';

class LoginViem extends StatefulWidget {
  const LoginViem({super.key});

  @override
  State<LoginViem> createState() => _LoginViemState();
}

class _LoginViemState extends State<LoginViem> {
  bool isVisable = true;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
            child: Column(
          //main column carry the page
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Column content 
            const SizedBox(height: 120),
            const ImageAndWelcomeView(welcomePhraseText: 'Welocme to Agribot'),
            const SizedBox(height: 30),
            const CustomTextField(obscureText: false,label: 'Email',prefixIcon: Icons.email,),
            const SizedBox(height: 20,),
            const CustomTextField(obscureText: true,label: 'Password',prefixIcon: Icons.lock, suffixIcon: Icons.remove_red_eye,keyboardType: TextInputType.visiblePassword),
            const SizedBox(height: 20,),
            const LogInButton(buttonLabel: 'Log In'),
            const SizedBox(height: 20,),
            CreateAccountSentence(informationText: "if you don't have an account",actionText: 'Create one!',
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterView(),)),
            )

          ],
        )),
      ),
    )));
  }
}
