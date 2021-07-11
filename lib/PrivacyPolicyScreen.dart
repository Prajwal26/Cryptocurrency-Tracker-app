import 'package:flutter/material.dart';
import 'intro_screen.dart';
class Privacy extends StatefulWidget {
  static const id="Privacy";
  @override
  _PrivacyState createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          title: Text('💰 Krypto'),
          backgroundColor: Color(0xFF191414),
        ),

        body: ListView(
          padding: EdgeInsets.all(15.0),
          children: <Widget>[
            Center(child: Text("Privacy Policy",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),)),
            SizedBox(height: 5.0,),
            Text("We collect information to provide better services to all our users — from figuring out basic stuff like which language you speak, to more complex things like which ads you’ll find most useful, the people who matter most to you online, or which YouTube videos you might like. The information Google collects, and how that information is used, depends on how you use our services and how you manage your privacy controls.",style: TextStyle(color:Colors.grey.shade700,fontWeight: FontWeight.bold,fontSize: 15.0),),
            SizedBox(height: 30.0,),
            Center(child: Text("Terms of Use",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),)),
            SizedBox(height: 5.0,),
            Text("The information we collect includes unique identifiers, browser type and settings, device type and settings, operating system, mobile network information including carrier name and phone number, and application version number. We also collect information about the interaction of your apps, browsers, and devices with our services, including IP address, crash reports, system activity, and the date, time, and referrer URL of your request.",style: TextStyle(color:Colors.grey.shade700,fontWeight: FontWeight.bold,fontSize: 15.0),),
            SizedBox(height: 30.0,),
            Center(child: Text("Permissions",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),)),
            SizedBox(height: 5.0,),
            Text("We collect information about your location when you use our services, which helps us offer features like driving directions for your weekend getaway or showtimes for movies playing near you.We use various technologies to collect and store information, including cookies, pixel tags, local storage, such as browser web storage or application data caches, databases, and server logs.",style: TextStyle(color:Colors.grey.shade700,fontWeight: FontWeight.bold,fontSize: 15.0),)
          ],
        ),
      ),
    );
  }
}
