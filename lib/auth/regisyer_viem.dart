import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/NavigationBar/main_page.dart';
import 'package:flutter_application_1/auth/login_view.dart';
import 'package:flutter_application_1/core/models/register_model.dart';

class RegisterView2 extends StatefulWidget {
  const RegisterView2({super.key});

  @override
  State<RegisterView2> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView2> {
  var formKey = GlobalKey<FormState>();
  bool isVisable = true;
  String? usernamee;
  String? email;
  String? passwoord;
  RegisterData? reguser;
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: isLoading? const Center(child: CircularProgressIndicator(),): SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
            child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/2.jpg'),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'SignUp to your account',
                style: TextStyle(fontSize: 20, color: Colors.teal[400]),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                onChanged: (value) {
                  usernamee =value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name must not be empty!';
                  }
                  return null;
                },
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'Enter your Name',
                  label: const Text('Name'),
                  prefixIcon: const Icon(Icons.email_rounded),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.black)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.teal),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.red)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.red)),
                ),
              ),
              const SizedBox(
                height: 15,
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
                height: 15,
              ),
              TextFormField(
                onChanged: (value) {
                  passwoord=value;
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
                  hintText: 'Enter your Password',
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
                height: 15,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty || value.length < 8) {
                    return 'Password must not be empty OR \nPassword must not length 8 ';
                  }
                  return null;
                },
                obscureText: isVisable,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: 'Enter your Password',
                  label: const Text('Confirm The Password'),
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
                height: 15,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.teal[400], // لون النص
                  ),
                  onPressed: () async {





                    // -----------------------------------------------------------------------------------------------
                    if (formKey.currentState!.validate()) {
                      setState(() {
                          
                        });
                      try{
                        isLoading=true;
                        
                           var response= await Dio().post('https://agribotapi.onrender.com/api/auth/local/register',
                           data: {"username":usernamee.toString(),"email":email.toString(),"password":passwoord.toString()});
                           if(response.statusCode == 200){
                            reguser = RegisterData.fromjson(response.data);
                            if (reguser!.token!.isNotEmpty){
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
                            body: const Text('Email or Username are already taken',),
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
                   
     
                    }
                  },
                  //--------------------------------------------------------------------------------------------------------------
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  child: const Text('SignUp')),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('if you have an account'),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LoginViem2(),
                        ));
                      },
                      child: Text(
                        'Login Now',
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
