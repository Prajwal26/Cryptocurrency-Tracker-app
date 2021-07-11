import 'dart:async';

import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import 'intro_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {
  @override
  static const id="Splash";
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _auth = FirebaseAuth.instance;
  bool isloggedin= false;
  String email,password;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStringValuesSF();
    Timer(Duration(seconds: 5),() async {
      if(isloggedin==true)
        {
          final user = await _auth.signInWithEmailAndPassword(
              email: email.trim(), password: password.trim());
          if (user != null) {
            Navigator.pushNamed(context, Intro_Page.id);
          }
        }
      else
        {
          Navigator.pushNamed(context, WelcomeScreen.id);
        }
    });
  }

  getStringValuesSF() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    email = prefs.getString('email');
    password = prefs.getString('password');
    if(email!=null && password != null)
      {
        setState(() {
          isloggedin = true;
        });
      }
  }

  getIntValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    int intValue = await prefs.getInt('intValue') ?? 0;
    setState(() {

    });
    print(intValue);
    return intValue;
  }
  
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Center(
        child: new Image.asset('images/krypto.jpg'),
      ),
    );
  }
}
