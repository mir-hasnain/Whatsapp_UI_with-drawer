import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/home_screen.dart';
class Login extends StatefulWidget {
  static String id = 'login';
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
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
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: TextFormField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  fillColor: Colors.grey.withOpacity(.1),
                  filled: true,
                  prefixIcon: const Icon(Icons.phone,color: Colors.green,),
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
            const SizedBox(
              height: 250,
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
                    Navigator.pushNamed(context, HomeScreen.id);
                    SharedPreferences sp = await SharedPreferences.getInstance();
                    sp.setBool('login',true);
                  },
                  child: const Text(
                    'login',
                    style: TextStyle(color: Colors.white,fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


