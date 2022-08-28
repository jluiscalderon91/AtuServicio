import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fryo/src/apis/api_service.dart';
import 'package:fryo/src/bloc/bloc.dart';
import 'package:fryo/src/models/User.dart';
import 'package:fryo/src/screens/HomePage.dart';
//import 'package:fryo/src/screens/category.dart';
import 'package:fryo/src/screens/home.dart';
import 'package:fryo/src/screens/homeProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/inputFields.dart';
import 'package:page_transition/page_transition.dart';
import './SignUpPage.dart';
//import './Dashboard.dart';

class SignInPage extends StatefulWidget {
  final String pageTitle;

  SignInPage({Key key, this.pageTitle}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String email = "";
  String password = "";
  String messageuser = "";
  String messagepass = "";
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key : _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: Text('Ingresar',
            style: TextStyle(
                color: Colors.grey, fontFamily: 'Poppins', fontSize: 15)),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              //Navigator.of(context).pushReplacementNamed('/signup');
              Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft,  child: SignUpPage()));

            },
            child: Text('Registrarse', style: contrastText),
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
        padding: EdgeInsets.only(left: 18, right: 18),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Bienvenido Nuevamente!', style: h3),
                Text('Hola, autentiquémonos', style: taglineText),
                Container(
                          margin: EdgeInsets.only(top: 13),
                          child: TextFormField(
                            controller: emailController,
                            validator: (value) => (value.isEmpty) ? "Please enter Email!!" : null,
                            onTap: () {},
                            onEditingComplete: () {},
                            onChanged: (String s) {
                                setState(() {
                                     if(s.length > 0)
                                      messageuser = '';
                                     else
                                     messageuser = 'Ingrese email válido';
                                });
                            },
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: primaryColor,
                            style: inputFieldTextStyle,
                            decoration: InputDecoration(
                                hintText: 'Email@dominio.com',
                                hintStyle: inputFieldHintTextStyle,
                                focusedBorder: inputFieldFocusedBorderStyle,
                                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                border: inputFieldDefaultBorderStyle),
                          ),
                        ),Container(child : Text(messageuser,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w800, color: Colors.red))),
                        Container(
                            margin: EdgeInsets.only(top: 13),
                            child: TextFormField(
                            controller: passwordController,
                            validator: (value) => (value.isEmpty) ? "Please enter Password!!" : null,
                             onTap: () {},
                            onEditingComplete: () {},  
                             onChanged: (String s) {
                                setState(() {
                                     if(s.length > 0)
                                      messagepass = '';
                                      else
                                      messagepass = 'Ingrese contraseña';
                                });
                            },                 
                              obscureText: true,
                              cursorColor: primaryColor,
                              style: inputFieldHintPaswordTextStyle,
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: inputFieldHintPaswordTextStyle,
                                  focusedBorder: inputFieldFocusedBorderStyle,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  border: inputFieldDefaultBorderStyle),
                            ),
                          ),Container(child : Text(messagepass,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w800, color: Colors.red))),
                FlatButton(
                  onPressed: () {},
                  child: Text('Olvidaste tu Contraseña?', style: contrastTextBold),
                )
              ],
            ),
            Positioned(
              bottom: 15,
              right: -15,
              child: FlatButton(                       
                onPressed: () async {
                   print(emailController.text);
                   print(passwordController.text);
                   if(emailController.text == ""){
                     setState(() {
                                       return messageuser = 'Ingrese email válido';
                                });
                   }
                   if(passwordController.text ==""){
                     setState(() {
                                       return messagepass = 'Ingrese contraseña';
                                });
                   }
                   else{
                _scaffoldKey.currentState.showSnackBar(
                  
                      new SnackBar(duration: new Duration(seconds: 4), content:
                      new Row(
                        children: <Widget>[
                          new CircularProgressIndicator(),
                          new Text("  Autenticando...")
                        ],
                      ),
                      ));
       
                 
                  User users = await ApiService.loginUser(emailController.text, passwordController.text);
                  print(users);
                    if(users != null){
                                savedata(users);
                                //readdata("vEmail");
                                if(users.userRoleid == 112){
                                Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: new Home(userData: users)));
                                }
                                else{
                                Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: HomeProvider(userData: users)));  
                                }
                              }
                              else{
                                Fluttertoast.showToast(msg: 'Credenciales Incorrectas',toastLength: Toast.LENGTH_SHORT);
                            
                              }
                   }
                              },
                              color: primaryColor,
                              padding: EdgeInsets.all(13),
                              shape: CircleBorder(),
                              child: Icon(Icons.arrow_forward, color: white),
                            ),
                          )
                        ],
                      ),
                      height: 345,
                      
                      width: double.infinity,
                      decoration: authPlateDecoration,
                    ),
                    ],
                  )
                );
              
              }
                      
 Future savedata(User users) async {
   final prefs = await SharedPreferences.getInstance();
   prefs.setInt("iUserid", users.iUserid);
   prefs.setString("vEmail", users.vEmail);
   prefs.setString("vPassword", users.vPassword);
   prefs.setString("vUsername", users.vUsername);
   prefs.setString("vName", users.vName);
   prefs.setString("vSurname", users.vSurname);
   prefs.setString("vNormalizedusername", users.vNormalizedusername);
   prefs.setInt("userRoleid", users.userRoleid);

   Fluttertoast.showToast(msg: 'Bienvenido '+users.vNormalizedusername,toastLength: Toast.LENGTH_SHORT);
 }

 Future readdata(String key) async {
   final prefs = await SharedPreferences.getInstance(); 
 }
  
}
