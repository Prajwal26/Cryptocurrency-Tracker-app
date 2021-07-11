
import 'package:bitcoin_ticker/ui/firstscreen.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/components/rounded_button.dart';
import 'package:bitcoin_ticker/constants.dart';
import 'package:bitcoin_ticker/components/Infocard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bitcoin_ticker/components/session.dart';
import 'package:bitcoin_ticker/Aboutapp.dart';
import 'package:bitcoin_ticker/PrivacyPolicyScreen.dart';
import 'package:bitcoin_ticker/price_screen.dart';
import 'package:bitcoin_ticker/Info_screen.dart';
import 'package:bitcoin_ticker/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intro_Page extends StatefulWidget {
  static const String id = 'intro_page';
  @override
  _Intro_PageState createState() => _Intro_PageState();
}

class _Intro_PageState extends State<Intro_Page> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  void initState() {
    super.initState();
    getCurrentUser();
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
//            onTap: (){Session.isLoggedIn = false;exit(0);},
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

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        Session.isLoggedIn = true;
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  removeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("email");
    prefs.remove("password");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(

        child: ListView(
          children: <Widget>[

            UserAccountsDrawerHeader(
              accountName: Text("Hello! User"),
              accountEmail: Text(loggedInUser != null?loggedInUser.email:"loading...",),
              decoration: BoxDecoration(
                  color: Color(0xFF191414)
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://images.squarespace-cdn.com/content/v1/5a63f3576957da47039e978d/1522121548872-SX8UK20NPYJKQI0DYRTU/ke17ZwdGBToddI8pDm48kJme_vyRngthM-lqQfhlIH1Zw-zPPgdn4jUwVcJE1ZvWEtT5uBSRWt4vQZAgTJucoTqqXjS3CfNDSuuf31e0tVHdR4tGE0fFJHT7ppaMbI8l68Pv4V3IjdRIUtf6KN3cEolyXOhr1HlgtlqrKgcoGR0/8855.jpg?format=500w"),
              ),
            ),
            GestureDetector(
              child: ListTile(
                title: Text("About app"),
                onTap: (){
                  Navigator.pushNamed(context, AboutApp.id);
                },
                trailing: Icon(Icons.arrow_forward),
              ),
            ),

            GestureDetector(
              child: ListTile(
                title: Text("Privacy Policy"),
                onTap: (){
                  Navigator.pushNamed(context, Privacy.id);
                },
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
            GestureDetector(
              child: ListTile(
                title: Text("Crpto maniac"),
                onTap: (){
                  Navigator.pushNamed(context, FirstScreen.id);
                },
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
            ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                removeValues();
                _auth.signOut();
                Navigator.pushNamed(context, WelcomeScreen.id);
                Navigator.pushNamedAndRemoveUntil(context, WelcomeScreen.id, (route) => false);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('💰 Krypto',style: TextStyle(color: Colors.white, fontFamily: 'Nunito', fontSize: 25.0),),
        backgroundColor: Color(0xFF191414),
        bottom: PreferredSize(
            child: Container(
              color: Color(0xff1DB954),
              height: 1.0,
            ),
            preferredSize: Size.fromHeight(1.0)),
      ),
      body: Container(
        decoration: BoxDecoration(
//
        color: Color(0xff191414),
          
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[


              GestureDetector(
                onTap: (){Navigator.pushNamed(context,PriceScreen.id);},
                child: Info_Card(text: "Price",imageUrl: "images/finalprice.png",),
            ),

              GestureDetector(
                onTap: (){Navigator.pushNamed(context,InfoPage.id);},
                child: Info_Card(text: "Know About Currencies", imageUrl:"images/newknow.png",
            ),
              ),



    ],
        ),
      ),
    );
  }
}



