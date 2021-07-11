import 'package:flutter/material.dart';


class Info_Card extends StatelessWidget {
  Info_Card({this.color,this.text,this.imageUrl});
  final Color color;
  final String text;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Container(
        height: 185.0,

        decoration: BoxDecoration(
            boxShadow:[
              BoxShadow(
                color: Color.fromARGB(80, 30, 215, 96),
                blurRadius: 6.0,
                spreadRadius: 0.0,
                offset: Offset(3.0, 5.0),

              ),

            ],
            gradient: LinearGradient(colors: [Color(0xff99ff66),Color(0xff1DB954),])
,          borderRadius: BorderRadiusDirectional.circular(24.0),

        ),
        child: Container(
          decoration: BoxDecoration(
//            gradient: LinearGradient(colors: [Color(0xff1DB954),Color(0xff25CE60)]),
            color: Color(0xff191414),
            borderRadius: BorderRadiusDirectional.circular(24.0),
          ),
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 30.0,
                child: Image(image: AssetImage(imageUrl),height: 400,width: 400,),
              ),
              Expanded(
                flex: 11,

                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    child: Center(
                      child: Text(
                        text,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Color(0xff1DB954),
                            fontFamily: 'Lobster',
                            fontWeight: FontWeight.w500,
                            fontSize: 30.0),
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 4,
                child: SizedBox(
                  height: 10.0,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}