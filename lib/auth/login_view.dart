import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/NavigationBar/main_page.dart';
import 'package:flutter_application_1/auth/regisyer_viem.dart';
import 'package:flutter_application_1/core/models/log_in_model.dart';

class LoginViem2 extends StatefulWidget {
  const LoginViem2({super.key});

  @override
  State<LoginViem2> createState() => _LoginViemState();
}

class _LoginViemState extends State<LoginViem2> {
  var formKey = GlobalKey<FormState>();
  bool isVisable = true;
  String? email;
  String? password;
  LogInData? userModel;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: isLoading?const Center(child: CircularProgressIndicator(),): SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
            child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 120,
              ),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/2.jpg'),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Welocme to Agribot',
                style: TextStyle(fontSize: 20, color: Colors.teal[400]),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                onChanged: (value) {
                  email=value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email must not be empty!';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: const Text('Email'),
                  hintText: 'Enter your Email',
                  prefixIcon: const Icon(Icons.email),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.teal),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.red)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.red)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (valuee) {
                  password=valuee;
                },
                validator: (value) {
                  if (value!.isEmpty || value.length < 8) {
                    return 'Password must not be empty OR \nPassword must not length 8 ';
                  }
                  return null;
                },
                obscureText: isVisable,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  label: const Text('Password'),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisable = !isVisable;
                        });
                      },
                      icon: Icon((isVisable)
                          ? Icons.remove_red_eye
                          : Icons.visibility_off_rounded)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.black)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.teal)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.red)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.red)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () async{






                    
                //-------------------------------------------------------------------------------
                    if (formKey.currentState!.validate()) {
                      setState(() {
                          
                        });
                      try{
                        isLoading=true;
                        
                           var response = await Dio().post('https://agribotapi.onrender.com/api/auth/local',
                           data: {"identifier":email.toString(),"password":password.toString()});
                           if(response.statusCode == 200){
                            userModel = LogInData.fromjson(response.data);
                            if (userModel!.token!.isNotEmpty){
                             Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const MainPage(),
                      ));
                            }

                           }

                          else{
                            AwesomeDialog(context: context,dialogType: DialogType.error,title: 'Sorry',
                            body: Text(response.data['error']['message'],),
                            btnOk: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[400]),
                              onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Ok'),)
                            ).show();
                          }
                      }
                      

                      catch(e){
                           AwesomeDialog(context: context,dialogType: DialogType.error,title: 'Sorry',
                            body: const Text('Invalid Identifier or Password',),
                            btnOk: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal[400]


                              ),
                              onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Ok',style: TextStyle(color: Colors.white),),)
                            ).show();
                      }
                      isLoading=false;
                      setState(() {
                        
                      });
                   
     
        //--------------------------------------------------------------------------------------------------------
                      








                    }
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.teal[400]),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('if you have not an account'),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const RegisterView2()));
                      },
                      child: Text(
                        'Create one!',
                        style: TextStyle(color: Colors.teal[400]),
                      ))
                ],
              )
            ],
          ),
        )),
      ),
    )));
  }
}
