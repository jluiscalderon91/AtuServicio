import 'package:flutter/material.dart';
import 'package:fryo/src/screens/homeProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/buttons.dart';

import 'package:page_transition/page_transition.dart';
import './SignUpPage.dart';
import './SignInPage.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  final String pageTitle;

  HomePage({Key key, this.pageTitle}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset('images/logo4.png', width: 190, height: 190),
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 0),
            child: Text('A tu Servicio!', style: logoStyle),
          ),
          Container(
            width: 200,
            margin: EdgeInsets.only(bottom: 0),
            child: froyoFlatBtn('Ingresar', () async { 
              final prefs = await SharedPreferences.getInstance(); 
              print(prefs.getString("vUsername"));
              if(prefs.getString("vUsername") == null)
              Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rotate, duration: Duration(seconds: 1),  child: SignInPage()));
              else
              {
                if(prefs.getInt("userRoleid") == 112)
                    Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rotate, duration: Duration(seconds: 1),  child: Home()));
                else
                    Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rotate, duration: Duration(seconds: 1),  child: HomeProvider()));            
              }
            }),
          ),
          Container(
            width: 200,
            padding: EdgeInsets.all(0),
            child: froyoOutlineBtn('Registrarse', (){
              Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rotate, duration: Duration(seconds: 1),  child: SignUpPage()));
              // Navigator.of(context).pushReplacementNamed('/signup');
             }),
          ),
          Container(
            margin: EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                Text('Lenguaje:', style: TextStyle(color: darkText)),
                Container(
                  margin: EdgeInsets.only(left: 6),
                  child: Text('Español ›', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
                )
              ],
            ),
          )
        ],
      )),
      backgroundColor: bgColor,
    );
  }
}
