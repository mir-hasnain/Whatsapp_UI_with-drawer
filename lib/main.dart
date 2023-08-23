import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/views/home_screen.dart';
import 'package:untitled/views/login.dart';
import 'package:untitled/views/signupscreen.dart';
import 'package:untitled/views/splashscreen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isLogin ;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.id,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        Login.id : (context) =>  const Login(),
        SignUpScreen.id : (context) => const SignUpScreen(),
        SplashScreen.id : (context) => const SplashScreen(),
      },
    );
  }
}
