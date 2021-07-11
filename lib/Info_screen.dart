import 'package:bitcoin_ticker/data_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:bitcoin_ticker/components/Infocard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


final _firestore = Firestore.instance;
FirebaseApp firebase;
FirebaseUser loggedInUser;
ListView temp;
int flag=0;
String srcImage = "https://tenor.com/view/comicstaan-comicstaan-season2-amazon-prime-video-amazon-prime-video-in-comicstaan2-gif-14558674.gif";

class InfoPage extends StatefulWidget {
  static const String id = "Info_screen";
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {


  final firestoreInstance = Firestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    flag=0;
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(

          appBar: AppBar(
            iconTheme: new IconThemeData(color: Colors.white),
            backgroundColor: Color(0xFF191414),
            title: Center(
                child: Text(
                  "Krypto",
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'Lobster', fontSize: 25.0),
                )),

//            elevation: 50.0,

            bottom: PreferredSize(
                child: Container(
    color: Color(0xff1DB954),
                  height: 1.0,
                ),
                preferredSize: Size.fromHeight(1.0)),
          ),
          body: SingleChildScrollView(

            child: Container(
              decoration: BoxDecoration(color: Color(0xFF191414)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[


                  GestureDetector(
                  onTap: (){Navigator.pushNamed(context,DataScreen.id,arguments: {"name":"Bitcoin" });},
                    child: Info_Card(text: "Bitcoin", imageUrl:"images/Bitcoin.png",
                    ),
                  ),
                  GestureDetector(
                    onTap: (){Navigator.pushNamed(context,DataScreen.id,arguments: {"name":"Ethereum" });},
                    child: Info_Card(text: "Ethereum", imageUrl:"images/Ethereum.png",
                    ),
                  ),
              GestureDetector(
              onTap: (){Navigator.pushNamed(context,DataScreen.id,arguments: {"name":"Litecoin" });},
                  child:Info_Card(text: "Litecoin", imageUrl:"images/litecoin.png",
                  ),),
              GestureDetector(
                onTap: (){Navigator.pushNamed(context,DataScreen.id,arguments: {"name":"XLM" });},
                  child:Info_Card(text: "XLM", imageUrl:"images/XLM.png",
                  ),),
    GestureDetector(
    onTap: (){Navigator.pushNamed(context,DataScreen.id,arguments: {"name":"BNB" });},
                  child:Info_Card(text: "BNB", imageUrl:"images/bnb.png",
                  ),),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

    }



