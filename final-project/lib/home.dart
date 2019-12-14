import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizstar/quizpage.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  List<String> images = [
    "images/football.png",
    "images/basketball.png",
    "images/hockey.png",
  ];

  List<String> description = [
    "Football is one of the most if not the most popular sport in the world.\n If You think you know some of its facts... \nJust test yourself !!",
    "Basketball is very popular all across the globe.\n Feel free to taeke the test !!",
    "Hockey is Canada's national sport and is super popular from coast to coast.\n If you know its trivia, take the challenge !!",
  ];

  Widget customcard(String sport, String image, String description){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            // in changelog 1 we will pass the sport to ther other widget class
            // this name will be used to open a particular JSON file 
            // for a particular language
            builder: (context) => getjson(sport),
          ));
        },
        child: Material(
          color: Colors.lightBlue,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      height: 150.0,
                      width: 150.0,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            image,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    sport,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: "Quando",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontFamily: "Alike"
                    ),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),
                  
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sports Trivia",
          style: TextStyle(
            fontFamily: "Quando",
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard("Football", images[0], description[0]),
          customcard("Basketball", images[1], description[1]),
          customcard("Hockey", images[2], description[2]),
        ],
      ),
    );
  }
}