import 'package:flutter/material.dart';
import 'package:fryo/src/Response/ResponseFinished.dart';
import 'package:fryo/src/apis/api_service.dart';
import 'package:fryo/src/models/Requirement.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/buttons.dart';

class SuccesfullPayment extends StatefulWidget {
  final String pageTitle;
  final Requirement productData;

  SuccesfullPayment({Key key, this.pageTitle, this.productData}) : super(key: key);

  @override
  _SuccesfullPaymentState createState() => _SuccesfullPaymentState();
}

class _SuccesfullPaymentState extends State<SuccesfullPayment> {
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
          title: Text('Resumen del Pago', style: h4),
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
                                  child: Text("¡ Se Realizó el Pago del Servicio con Éxito !", style: h3,textAlign: TextAlign.center),
                                  margin: EdgeInsets.only(left: 20,right: 20,bottom: 15)
                          ),
                           Text('Detalle :', style: h6,textAlign: TextAlign.center)
                          ,
                          Container(
                                  child: Text(widget.productData.vRequirementCode, style: h3,textAlign: TextAlign.center),
                                  margin: EdgeInsets.only(left: 20,right: 20,bottom: 15)
                          ),
                           Container(
                                  child: Text(widget.productData.vServiceName, style: h3,textAlign: TextAlign.center),
                                  margin: EdgeInsets.only(left: 20,right: 20,bottom: 15)
                          ),
                          Container(
                                  child: Text('Pago En Efectivo', style: h6,textAlign: TextAlign.center),
                                  margin: EdgeInsets.only(left: 20,right: 20,bottom: 15)
                          ),
                        Container(
                                  child: Text(widget.productData.mPriceSale, style: h3),
                                  margin: EdgeInsets.only(bottom: 5),
                                ),
                          Container(
                            width: 180,
                            child: froyoOutlineBtn('Finalizar Servicio', () async {
                              
                              final prefs = await SharedPreferences.getInstance(); 
                                Map requirementModel = {"IRequirementId" : widget.productData.iRequirementId, "IStatus" : 5, "iUseId" : prefs.getInt("iUserid"),"VAddressDelivery":"terminar"};
                                      
                                      _scaffoldKey.currentState.showSnackBar(
                                        
                                      new SnackBar(duration: new Duration(seconds: 4), content:
                                      new Row(
                                        children: <Widget>[
                                          new CircularProgressIndicator(),
                                          new Text("  Enviando su Solicitud...")
                                        ],
                                      ),
                                      ));

                                      var result = await ApiService.updateStatusRequirement(body : requirementModel);
                                                      print(result);
                                                      if(result.success == true){
                                                       Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rotate, duration: Duration(seconds: 1),  child: ResponseFinished()));
                                                }
                                              
                            }),
                          ),
                         
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
