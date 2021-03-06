import 'package:flutter/material.dart';
import 'listingscreen.dart';
import 'newsscreen.dart';
import 'settingsscreen.dart';
class FirstScreen extends StatefulWidget {

  @override
  static const String id = "first_scr";
  State<StatefulWidget> createState() {

    return FirstScreenState();
  }
}

class FirstScreenState extends State<FirstScreen> {
  
  int _currentIndex=1;
  List<Widget> widgets = [NewsScreen(0.0, ""),ListingScreen(),SettingsScreen()];
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color(0xff191414),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex=index;            
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.note,color: Colors.green,),
            title: Text('News',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontFamily: 'RobotoLight')),
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on,color: Colors.green,),
            title: Text('Coins',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontFamily: 'RobotoLight'))
            
          ),

        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Cryptocurrency Maniac',
          style: TextStyle(
              fontFamily: 'RobotoBold',
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 20.0),
          textAlign: TextAlign.center,
        ),
      ),
      body: widgets[_currentIndex],
    );
  }
}
