import 'package:flutter/material.dart';
import 'package:fryo/src/models/Service.dart';
import 'package:fryo/src/screens/Dashboard.dart';
import 'package:fryo/src/screens/home.dart';
import 'package:fryo/src/shared/inputFields.dart';
import 'package:page_transition/page_transition.dart';
import '../shared/Product.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/partials.dart';
import '../shared/buttons.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class SuccesfullRegisterRequirement extends StatefulWidget {
  final String pageTitle;
  final Service productData;

  SuccesfullRegisterRequirement({Key key, this.pageTitle, this.productData}) : super(key: key);

  @override
  _SuccesfullRegisterRequirementState createState() => _SuccesfullRegisterRequirementState();
}

class _SuccesfullRegisterRequirementState extends State<SuccesfullRegisterRequirement> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          elevation: 5,
          backgroundColor: bgColor,
          centerTitle: true,
          leading: BackButton(
            color: darkText,
          ),
          title: Text('Registro de Solicitud', style: h4),
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
                                  child: Text("¡ Se Realizó el Registro del Servicio con Éxito !", style: h3,textAlign: TextAlign.center),
                                  margin: EdgeInsets.only(left: 20,right: 20,bottom: 15)
                          ),
                          Container(
                                  child: Text("Debe esperar la Confirmación del Proveedor para que se haga efectiva la solicitud", style: h6,textAlign: TextAlign.center),
                                  margin: EdgeInsets.only(left: 20,right: 20,bottom: 15)
                          ),
                    
                          Container(
                                  child: Text('El Proveedor ' +widget.productData.vCustomerName + ' ha sido Notificado', style: h6,textAlign: TextAlign.center),
                                  margin: EdgeInsets.only(left: 20,right: 20,bottom: 15)
                          ),
                        Container(
                                  child: Text("Precio a Pagar por el Servicio : \S/.${widget.productData.mPriceSale.toString()}", style: h3),
                                  margin: EdgeInsets.only(left: 20,right: 20,bottom: 5),
                                ),
                          //Text(widget.productData.vDescription, style: h6,textAlign: TextAlign.center,),                                        
                          /*Container(
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
                          ),*/                                          
                          Container(
                            width: 180,
                            child: froyoFlatBtn('Volver al Menú', () {
                               Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rotate, duration: Duration(seconds: 1),  child: Home()));
                            }),
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
                    /*Align(
                        alignment: Alignment.center,
                      child: SizedBox(
                        width: 200,
                        height: 160,
                        child: foodItemService(widget.productData,
                            isProductPage: true,
                            onTapped: () {},
                            imgWidth: 250,
                            onLike: () {}),
                      ),
                    )*/
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
