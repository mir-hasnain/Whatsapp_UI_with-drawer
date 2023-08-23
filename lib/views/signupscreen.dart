import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/utils/utilities.dart';

import 'login.dart';
class SignUpScreen extends StatefulWidget {
  static String id = 'signup';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isLoading = true;
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isVisible = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
            Form(
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
                          prefixIcon: const Icon(Icons.alternate_email_sharp,color: Colors.green,),
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
                const Text("Already have an account?   ",style: TextStyle(fontSize: 17),),
                InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, Login.id);
                    },
                    child: const Text("Login",style: TextStyle(fontSize: 18,color: Colors.green),)),
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
                  onPressed: (){
                    if(formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = false;
                      });
                      auth.createUserWithEmailAndPassword(
                          email: numberController.text.toString(),
                          password: passwordController.text.toString()).then(
                              (value) {

                              }
                      ).onError((error, stackTrace) {
                        Utils.showToast(error.toString());
                      });
                      setState(() {
                        isLoading = true;
                      });
                    }
                  },
                  child: isLoading? const Text(
                    'Sign Up',
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
