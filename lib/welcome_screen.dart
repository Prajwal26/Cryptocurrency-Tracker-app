import 'dart:io';

import 'package:flutter/material.dart';
import 'registration_screen.dart';
import 'package:bitcoin_ticker/components/rounded_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WelcomeScreen extends StatefulWidget {

  static const String id = 'welcome_screen';
  @override


  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {


  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
//      print(animation.value);
    });
  }

  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit'),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: Container(
                padding: EdgeInsets.all(10.0),
                decoration:BoxDecoration(
                  color: Color(0xff3E2948),
                ),
                child: Text(
                  "NO",
                  style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),
                )
            ),
          ),
          SizedBox(height: 16),
          new GestureDetector(
            onTap: (){exit(0);},
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration:BoxDecoration(
                color: Color(0xff3E2948),
              ),
              child: Text(
                "YES",
                style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    ) ??
        false;
  }

  Future<bool> exitApp()
  {
    exit(0);
  }

  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: exitApp,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //call kr tu network s bahar hai
             Center(
               child: Text(
                 "Krypto",
                 style: TextStyle(
                   backgroundColor: Colors.white,
                   color: Colors.black,
                   fontWeight: FontWeight.bold,
                   fontSize: 50.0,
                   fontFamily: 'Lobster',

                ),
               ),
             ),
              SizedBox(
                height: 48.0,
              ),
              RoundButton(
                colour: Color(0xff1DB954),
                title: 'LOG IN',
                textcolour: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, Login_Page.id);
                },
              ),
              RoundButton(
                colour: Color(0xff191414),
                title: 'Register',
                textcolour:Colors.white ,

                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}

