import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fryo/src/Response/SuccesfullRegisterRequirement.dart';
import 'package:fryo/src/apis/api_service.dart';
import 'package:fryo/src/models/Requirement.dart';
import 'package:fryo/src/models/Response.dart';
import 'package:fryo/src/models/Service.dart';
import 'package:fryo/src/shared/inputFields.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../shared/Product.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/partials.dart';
import '../shared/buttons.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductPage extends StatefulWidget {
  final String pageTitle;
  final Service productData;

  ProductPage({Key key, this.pageTitle, this.productData}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  double _rating = 4;
  int _quantity = 1;
  String messagedir = "";
  String messageadi = "";

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        key : _scaffoldKey,
        backgroundColor: bgColor,
        appBar: AppBar(
          elevation: 5,
          backgroundColor: bgColor,
          centerTitle: true,
          leading: BackButton(
            color: darkText,
          ),
          title: Text(widget.productData.vName, style: h4),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              //margin: EdgeInsets.only(top: 5),
              child: Center(
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                           Container(
                                  child: Text(widget.productData.vName, style: h3,textAlign: TextAlign.center),
                                  margin: EdgeInsets.only(left: 20,right: 20,bottom: 15)
                          ),
                          Container(
                                  child: Text(widget.productData.vDescription, style: h6,textAlign: TextAlign.center),
                                  margin: EdgeInsets.only(left: 20,right: 20,bottom: 15)
                          ),
                          Text('Provedor', style: h6,textAlign: TextAlign.center)
                          ,
                          Container(
                                  child: Text(widget.productData.vCustomerName, style: h6,textAlign: TextAlign.center),
                                  margin: EdgeInsets.only(left: 20,right: 20,bottom: 15)
                          ),
                          Container(
                          margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                          child: TextField(
                            controller: direcccionController, 
                             /*onChanged: (String s) {
                                setState(() {
                                     if(s.length > 0)
                                      messagedir = '';
                                     else
                                     messagedir = 'Ingrese Dirección';
                                });
                            },*/                      
                            keyboardType: TextInputType.text,
                            cursorColor: primaryColor,
                            style: inputFieldTextStyle,
                            decoration: InputDecoration(
                                hintText: 'Ingrese Dirección',
                                hintStyle: inputFieldHintTextStyle,
                                focusedBorder: inputFieldFocusedBorderStyle,
                                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                border: inputFieldDefaultBorderStyle),
                          ),
                        ),
                        Container(margin: EdgeInsets.only(right: 100),child : Text(messagedir,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w800, color: Colors.red))),
                        Container(
                          margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                          child: TextField(
                            controller: infoAdicionalController,   
                            keyboardType: TextInputType.multiline,
                            cursorColor: primaryColor,
                            style: inputFieldTextStyle,
                            decoration: InputDecoration(
                                hintText: 'Informacion Adicional',
                                hintStyle: inputFieldHintTextStyle,
                                focusedBorder: inputFieldFocusedBorderStyle,
                                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                border: inputFieldDefaultBorderStyle),
                          ),
                        ),
                        Container(
                                  child: Text("\S/.${widget.productData.mPriceSale.toString()}", style: h3),
                                  margin: EdgeInsets.only(bottom: 5),
                                ),
                          //Text(widget.productData.vDescription, style: h6,textAlign: TextAlign.center,),                                        
                          Container(
                            margin: EdgeInsets.only(top: 5, bottom: 20),
                            child: SmoothStarRating(
                              allowHalfRating: false,
                              onRatingChanged: (v) {
                                setState(() {
                                  _rating = v;
                                });
                              },
                              starCount: 5,
                              rating: _rating,
                              size: 27.0,
                              color: Colors.orange,
                              borderColor: Colors.orange,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 25),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Text('Quantity', style: h6),
                                  margin: EdgeInsets.only(bottom: 15),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 55,
                                      height: 55,
                                      child: OutlineButton(
                                        onPressed: () {
                                          setState(() {
                                            if(_quantity == 1) return;
                                            _quantity += 1;
                                          });
                                        },
                                        child: Icon(Icons.add),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: Text(_quantity.toString(), style: h3),
                                    ),
                                    Container(
                                      width: 55,
                                      height: 55,
                                      child: OutlineButton(
                                        onPressed: () {
                                          setState(() {
                                           if(_quantity == 1) return;
                                             _quantity -= 1; 
                                          });
                                        },
                                        child: Icon(Icons.remove),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 180,
                            child: froyoOutlineBtn('Solicitar Ahora', () async {
                              
                              final prefs = await SharedPreferences.getInstance(); 
                              print(prefs.getString("vUsername"));
                             Map requirementModel = {"iServiceId" : widget.productData.iServiceId, "vAddressDelivery" : direcccionController.text, "vDetalle": infoAdicionalController.text,"vIdentifierUser": prefs.getString("vUsername"),"VAddressDelivery" : "inserta soli"};
                             //new Requirement(
                               //);
                                      if(direcccionController.text == ""){                                      
                                       return Fluttertoast.showToast(msg: 'Ingrese Dirección',toastLength: Toast.LENGTH_SHORT);                                     
                                      }else{
                                      _scaffoldKey.currentState.showSnackBar(
                                        
                                      new SnackBar(duration: new Duration(seconds: 4), content:
                                      new Row(
                                        children: <Widget>[
                                          new CircularProgressIndicator(),
                                          new Text("  Enviando su Solicitud...")
                                        ],
                                      ),
                                      ));

                                      var result = await ApiService.registerRequirement(body : requirementModel);
                                      print(result);
                                      if(result.success == true){
                                        direcccionController.clear();
                                        infoAdicionalController.clear();                                        
                                        Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rotate, duration: Duration(seconds: 1),  child: SuccesfullRegisterRequirement(productData:widget.productData)));
                                }}
                            }),
                          ),
                          Container(
                            width: 180,
                            child: froyoFlatBtn('Reservar Servicio', () {}),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 15,
                                spreadRadius: 5,
                                color: Color.fromRGBO(0, 0, 0, .05))
                          ]),
                    ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
