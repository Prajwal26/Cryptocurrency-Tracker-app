import 'package:bitcoin_ticker/Aboutapp.dart';
import 'package:bitcoin_ticker/PrivacyPolicyScreen.dart';
import 'package:bitcoin_ticker/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'price_screen.dart';
import 'welcome_screen.dart';
import 'login_page.dart';
import 'registration_screen.dart';
import 'PrivacyPolicyScreen.dart';
import 'SplashScreen.dart';
import 'Aboutapp.dart';
import 'intro_screen.dart';
import 'Info_screen.dart';
import 'ui/newsscreen.dart';
import 'ui/firstscreen.dart';
import 'data_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.amber,
          scaffoldBackgroundColor: Colors.white),
        initialRoute:SplashScreen.id,
        routes:{
        InfoPage.id:(context)=>InfoPage(),
        FirstScreen.id:(context)=>FirstScreen(),
          SplashScreen.id:(context)=>SplashScreen(),
//          NewsScreen.id:(context)=>NewsScreen(),
          AboutApp.id:(context)=>AboutApp(),
          Privacy.id:(context)=>Privacy(),
          DataScreen.id:(context)=>DataScreen(),
          Login_Page.id:(context)=>Login_Page(),
          Intro_Page.id:(context)=>Intro_Page(),
          RegistrationScreen.id:(context)=>RegistrationScreen(),
          WelcomeScreen.id:(context)=>WelcomeScreen(),
          PriceScreen.id:(context)=>PriceScreen(),

        }
    );
  }
}
