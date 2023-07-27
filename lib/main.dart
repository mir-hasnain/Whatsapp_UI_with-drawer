import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/home_screen.dart';
import 'package:untitled/login.dart';
void main() {
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
    loginCheck();
  }
  Future<void> loginCheck() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    isLogin = sp.getBool('login');
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: isLogin == null ? Login.id : HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        Login.id : (context) =>  const Login(),
      },
      home: const HomeScreen()
    );
  }
}
