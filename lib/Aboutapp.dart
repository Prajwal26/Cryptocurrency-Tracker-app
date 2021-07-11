import 'package:flutter/material.dart';
class AboutApp extends StatefulWidget {
  static const id="About";
  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('💰 Krypto'),
          backgroundColor: Color(0xFF191414),
        ),

        body: Container(
          decoration: BoxDecoration(
            color: Color(0xFF191414)
          ),
          child: ListView(
            padding: EdgeInsets.all(15.0),
            children: <Widget>[
              Center(child: Text("About TestTag",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),)),
              SizedBox(height: 5.0,),
              Text("Krypto is an mobile application which will provide you the prices of all the cryptocurrencie and will get update regularly. The info section also contains all the details of famous crptocurrencies which in turn will helo you to learn mote about currencies.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),),
              SizedBox(height: 30.0,),
              Center(child: Text("Version",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),)),
              SizedBox(height: 5.0,),
              Center(child: Text("1.0",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),)),
              SizedBox(height: 30.0,),
              Center(child: Text("Developed By",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),)),
              SizedBox(height: 5.0,),
              Text("Group : 7",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),),
              Text("For more details email us",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),),
//            InkWell(
//                child: new Text('Open Browser'),
//                onTap: () => launch('wwww.gmail.com');
//            ),
              SizedBox(height: 10.0,),

            ],
          ),
        ),
      ),
    );
  }
}
