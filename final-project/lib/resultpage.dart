import 'package:flutter/material.dart';
import 'package:quizstar/home.dart';

class resultpage extends StatefulWidget {
  int points;
  resultpage({Key key , @required this.points}) : super(key : key);
  @override
  _resultpageState createState() => _resultpageState(points);
}

class _resultpageState extends State<resultpage> {

  List<String> images = [
    "images/winner.png",
    "images/alright.png",
    "images/loser.png",
  ];

  String message;
  String image;

  @override
  void initState(){
    if(points < 7){
      image = images[2];
      message = "Come on, try harder\n" + "You scored $points";
    }else if(points < 12){
      image = images[1];
      message = "Not bad, but I know you can do better\n" + "You scored $points";
    }else{
      image = images[0];
      message = "Excellent job, you really know your sports\n" + "You scored $points";
    }
    super.initState();
  }

  int points;
  _resultpageState(this.points);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Result",
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Material(
              elevation: 10.0,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      child: Container(
                        width: 300.0,
                        height: 300.0,
                        child: ClipRect(
                          child: Image(
                            image: AssetImage(
                              image,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 15.0,
                      ),
                      child: Center(
                      child: Text(
                        message,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: "Quando",
                        ),
                      ),
                    )
                    ),
                  ],
                ),
              ),
            ),            
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => homepage(),
                    ));
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  borderSide: BorderSide(width: 3.0, color: Colors.indigo),
                  splashColor: Colors.lightBlue,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}