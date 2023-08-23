import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/utils/Splash_servuces.dart';

import 'package:untitled/utils/utilities.dart';
import 'package:untitled/views/signupscreen.dart';

import 'home_screen.dart';
class Login extends StatefulWidget {
  static String id = 'login';
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static bool isVisible = true;
  bool isLoading = true;
  final formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        title: const Text('Whatsapp',textAlign: TextAlign.center,),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            Form (
              key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: TextFormField(
                        controller: numberController,
                        validator: (val){
                          if(val!.isEmpty) {
                            return "Enter Email";
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          fillColor: Colors.grey.withOpacity(.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.alternate_email_outlined,color: Colors.green,),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Colors.green,
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Colors.green,
                              )
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: TextFormField(
                        controller: passwordController,
                        validator: (val){
                          if(val!.isEmpty){
                            return "Enter Password";
                          }
                        },
                        obscureText: !isVisible,
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          fillColor: Colors.grey.withOpacity(.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.key,color: Colors.green,),
                          suffixIcon: IconButton(
                            icon: Icon( isVisible?
                            Icons.visibility_off_rounded : Icons.visibility,
                              color: Colors.green,),
                            onPressed: (){
                              isVisible = !isVisible;
                              setState(() {
                              });
                            },
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Colors.green,
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Colors.green,
                              )
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Text("Don't have an account?   ",style: TextStyle(fontSize: 17),),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, SignUpScreen.id);
                  },
                    child: const Text("Sign Up",style: TextStyle(fontSize: 18,color: Colors.green),)),
              ],
            ),
            const SizedBox(
              height: 200,
            ),
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: TextButton(
                  onPressed: ()async{
                    if(formKey.currentState!.validate()) {
                      // Navigator.pushNamed(context, HomeScreen.id);
                      setState(() {
                        isLoading = false;
                      });
                      auth.signInWithEmailAndPassword(
                          email: numberController.text.toString(),
                          password: passwordController.text.toString()).then((value){
                           //then
                        Utils.showAlertMessage(context, "Account Created Successfully");
                        Navigator.pushNamed(context, HomeScreen.id);
                      }).onError((error, stackTrace){
                        debugPrint(error.toString());
                        Utils.showAlertMessage(context, error.toString());
                      });
                      setState(() {
                        isLoading = true;
                      });
                    }
                  },
                  child: isLoading? const Text(
                    'login',
                    style: TextStyle(color: Colors.white,fontSize: 20),
                  ) : const CircularProgressIndicator(color: Colors.white,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


