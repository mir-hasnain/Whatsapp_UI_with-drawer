import 'package:flutter/material.dart';
import 'package:untitled/utils/Splash_servuces.dart';
class SplashScreen extends StatefulWidget {
  static String id = "splash screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices ss = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ss.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image(
                height: MediaQuery.of(context).size.height * .5,
                width: MediaQuery.of(context).size.width * .5,
                image: const AssetImage('images/appstore.png')),
          ),
        ],
      ),
    );
  }
}


