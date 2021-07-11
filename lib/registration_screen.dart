import 'package:bitcoin_ticker/price_screen.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/components/rounded_button.dart';
import 'package:bitcoin_ticker/constants.dart';
import 'package:bitcoin_ticker/intro_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';



class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  _displaySnackBar(BuildContext context, String SnackBarText) {
    final snackBar = SnackBar(
      backgroundColor: Color(0xFFBD34C59),
      content: Text(
        SnackBarText,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0),
      ),
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'OK',
        onPressed: () {},
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      color: Color(0xff3E2948),
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Text("OK"),
      ),
    );


    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Center(child: Text("T&C",style: TextStyle(color: Color(0xffF0BE1F),fontSize: 25.0),)),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              "1.Your data is completely safe and secured.Your security is our fast concern",
              style: TextStyle(
                  fontSize: 15.0
              ),
            ),
            SizedBox(height: 5,),
            Text(
              "2. The resources used in the application belong to their respective owners.",
              style: TextStyle(
                  fontSize: 15.0
              ),
            ),
            SizedBox(height: 5,),
            Text(
              "3. For any query or feedback You can contact us at prajwal1726@gmail.com",
              style: TextStyle(
                  fontSize: 15.0
              ),
            ),
            SizedBox(height: 10,),
            Text("For further details you can read our ",style: TextStyle(color:Color(0xff3E2948),)),
            SizedBox(height: 10,),
            GestureDetector(
//              onTap: (){
//                Navigator.pushNamed(context, Privacy.id);
//              },
              child: Text("Privacy Policy",style: TextStyle(color:Color(0xff3E2948),fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: okButton,
            ),
          ],
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Color(0xff1DB954)
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lobster',
                      fontSize: 40.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Welcome!',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lobster',
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60.0),
                          topRight: Radius.circular(60.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 80,
                          ),
                          Column(
                            children: <Widget>[
                              TextField(
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  email = value;
                                },
                                decoration: kTextFileDecoration.copyWith(
                                  hintText: 'Enter your email',
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              TextField(
                                obscureText: true,
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  password = value;
                                },
                                decoration: kTextFileDecoration.copyWith(
                                    hintText: 'Enter your password'),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("By signing up you agree our",style: TextStyle(color:Color(0xff3E2948),)),
                              GestureDetector(
                                onTap: (){
                                  showAlertDialog(context);
                                },
                                child: Text("Terms and Conditions",style: TextStyle(color:Color(0xff191414),fontWeight: FontWeight.bold),),
                              )
                            ],
                          ),
                          SizedBox(height: 50.0),

                          RoundButton(
                            title: 'Register',
                            colour: Color(0xff191414),
                            textcolour: Colors.white,
                            onPressed: () async {
                              setState(() {
                                showSpinner = true;
                              });
                              if(email!=null && password != null && email.isNotEmpty && password.isNotEmpty)
                                {
                                  try {
                                    final newUser =
                                    await _auth.createUserWithEmailAndPassword(
                                        email: email.trim(),
                                        password: password.trim());
                                    if (newUser != null) {
                                      Navigator.pushNamed(context, Intro_Page.id);
                                    }

                                    setState(() {
                                      showSpinner = false;
                                    });
                                  } catch (e) {
                                    print(e);
                                    if (password!= null && password.length<6)
                                    {
                                      _displaySnackBar(
                                          context, "Password must contain atleast 6 characters.");
                                    }
                                    else {
                                      _displaySnackBar(
                                          context,
                                          "Email is invalid or registered");
                                    }
                                  }
                                }
                              else
                                {
                                  _displaySnackBar(
                                  context, "Email or Password is Empty");

                                }
                            },
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                        ],
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
