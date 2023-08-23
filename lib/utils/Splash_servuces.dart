import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/views/home_screen.dart';

import '../views/login.dart';

class SplashServices{
  FirebaseAuth auth = FirebaseAuth.instance;
  void isLogin(BuildContext context){
    Timer(const Duration(seconds: 5), () {

      if(auth.currentUser!.email != null){
        Navigator.pushNamed(context, HomeScreen.id);
      }else{
        Navigator.pushNamed(context, Login.id);
      }
      }
    );
  }
}