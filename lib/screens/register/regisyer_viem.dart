import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_in/login_view.dart';
import 'package:flutter_application_1/screens/login_in/widgets/Image&welcome_view.dart';
import 'package:flutter_application_1/screens/login_in/widgets/create_account_sen.dart';
import 'package:flutter_application_1/screens/login_in/widgets/custom_text_field.dart';
import 'package:flutter_application_1/screens/login_in/widgets/log_in_button.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 120,),
            const ImageAndWelcomeView(welcomePhraseText: 'Sign Up to your account'),
            const SizedBox(height: 30,),
            const CustomTextField(obscureText: false, label: 'Name', prefixIcon: Icons.email_rounded),
            const SizedBox(height: 20,),
            const CustomTextField(obscureText: false, label: 'Email', prefixIcon: Icons.email,keyboardType: TextInputType.emailAddress,),
            const SizedBox(height: 20,),
            const CustomTextField(obscureText: true, label: 'Password', prefixIcon:Icons.lock,suffixIcon:Icons.remove_red_eye ,keyboardType: TextInputType.visiblePassword,),
            const SizedBox(height: 20,),
            const SizedBox(height: 20,),
            const LogInButton(buttonLabel: 'Sign Up'),
            CreateAccountSentence(informationText:'if you have an account' , actionText: 'Login Now',
             onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginViem(),)))
          ],
        )),
      ),
    )));
  }
}
