import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fryo/src/Response/SuccesfullPayment.dart';
import 'package:fryo/src/apis/api_service.dart';
import 'package:fryo/src/models/User.dart';
import 'package:fryo/src/screens/category.dart';
import 'package:fryo/src/shared/buttons.dart';
import 'package:fryo/src/shared/fryo_icons.dart';
import 'package:fryo/src/shared/styles.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends StatefulWidget {
  final User userData;
  HomeProvider({Key key, this.title, this.iCategoryId,this.userData}) : super(key: key);

  final String title;
  final String iCategoryId;

  @override
  _HomeProviderState createState() => _HomeProviderState();
}

class _HomeProviderState extends State<HomeProvider> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  String vNormalizedusername = '';
  String vEmail = '';
  int _iUserId = 0;

  @override
  Widget build(BuildContext context) {
   readdata("iUserid");   

      final _tabs = [
      _selectedIndex == 0 ?  buildProduct(context,_iUserId) : Text('Tab1'),
      _selectedIndex == 1 ?  buildRequirements(context,_iUserId) : Text('Tab2'),
      _selectedIndex == 2 ? buildRequirementsHistory(context,_iUserId) : Text('Tab3')
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Proveedor"),
      ),
      drawer: buildDrawer(),
      body: _tabs[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Fryo.shop),
                title: Text(
                  'Servicios',
                  style: tabLinkStyle,
                )),
            BottomNavigationBarItem(
                icon: Icon(Fryo.alarm),
                title: Text(
                  'Solicitudes',
                  style: tabLinkStyle,
                )),
            BottomNavigationBarItem(
                icon: Icon(Fryo.history),
                title: Text(
                  'Historial',
                  style: tabLinkStyle,
                ))
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.lightBlue[600],
          onTap: _onItemTapped,
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Future readdata(String key) async {
   final prefs = await SharedPreferences.getInstance(); 
   _iUserId = prefs.getInt(key);
  }

  Widget buildTitle(String title) {
    return Center(
      child: Container(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          textAlign: TextAlign.center,
        ),
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: BoxDecoration(
            border: Border.all(
                width: 2, color: Colors.white, style: BorderStyle.solid)),
      ),
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
                title: new Text('Metodo de Pago'),
                content: new Text('Favor indique el metodo de pago'),
                actions: <Widget>[
                  new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: new Text('Efectivo'),
                  ),
                  new FlatButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: new Text('Visa'),
                  ),
                ],
              ),
        ) ??
        false;
  }
  Future<bool> _onWillPopQuestion(String title,String message) {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
                title: new Text(title),
                content: new Text(message),
                actions: <Widget>[
                  new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: new Text('No'),
                  ),
                  new FlatButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: new Text('Yes'),
                  ),
                ],
              ),
        ) ??
        false;
  }
   Widget buildDrawer() {
   getvNormalizedusername("vNormalizedusername");
   getvEmail("vEmail");
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: UserAccountsDrawerHeader(
//              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("img/mazzad.png"))),
              accountName: Text(vNormalizedusername),
              accountEmail: Text(vEmail),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/img/logo.png"),
                radius: 50,
              ),
            ),
          ),
          Expanded(
              flex: 6,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  buildSeparators("Perfil : Proveedor"),
                  buildTile(
                    "Cerrar Sessión",
                    "/signin",
                    'images/img/login.png',
                  ),
                  buildTile(
                    "Editar Usuario",
                    "/feedback",
                    'images/img/registeration_ico.png',
                  ),
                  Divider(),
                  buildSeparators("Información"),
                  /*buildTile(
                    "Feedback",
                    "/feedback",
                    'images/img/feedback.png',
                  ),*/
                  buildTile(
                    "Mis Servicios",
                    "/feedback",
                    'images/img/assistance.png',
                  ),
                  buildTile(
                    "Solicitudes",
                    "/feedback",
                    'images/img/shipping.png',
                  ),
                  buildTile(
                    "Pagos",
                    "/feedback",
                    'images/img/visa.png',
                  ),
                  buildTile(
                    "Preguntas Frecuentes",
                    "/feedback",
                    'images/img/assistance.png',
                  ),
                  Divider(),
                  buildSeparators("Politicas"),
                  buildTile(
                    "Politica de Privacidad",
                    "/feedback",
                    'images/img/policy.png',
                  ),
                  buildTile(
                    "Términos y Condiciones",
                    "/feedback",
                    'images/img/terms.png',
                  ),
                  /*buildTile(
                    "Return Policy",
                    "/feedback",
                    'images/img/refund.png',
                  ),*/
                ],
              ))
        ],
      ),
    );
    
  }
 Future getvNormalizedusername(String key) async {
   final prefs = await SharedPreferences.getInstance(); 
     vNormalizedusername = prefs.getString(key);
 }
 Future getvEmail(String key) async {
   final prefs = await SharedPreferences.getInstance(); 
     vEmail = prefs.getString(key);
 }
 Widget buildTile(String name, String path, String imgPath) {
    return ListTile(
      leading: Image.asset(
        imgPath,
        scale: 1.2,
      ),
      title: Text(name),
      onTap: () {
        if (path != '/signin' && path != '/signup' )
          Navigator.pop(context);
        else{
          Navigator.pushNamed(context, path);
          print('salir');
          }
      },
    );
  }

Widget buildRequirements(BuildContext context,int iUserId){
  int count = 0;
return Scaffold( 
     key : _scaffoldKey,
     body: FutureBuilder(  
      future: ApiService.getRequirementsXProveedor(iUserId),  
      builder: (context, snapshot) {   
      final requirements = snapshot.data;     
      if (snapshot.connectionState == ConnectionState.done) {  
         print('cantidad :' + requirements.length.toString());
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: requirements[count].iStatus == 1 ? 0.9 : requirements[count].iStatus == 5 ? 2.5 : 1.5),
        itemCount: requirements == null ? 0 : requirements.length,
        itemBuilder: (context, i) {
          count = i;
          return InkWell(
            child: Container(
                    margin: EdgeInsets.all(3),
                    child: Card(
                              elevation: 25,
                              margin: EdgeInsets.all(5),
                              child: Column(    
                                                         
                                  children:  (requirements != null && requirements.length > 0) ? <Widget>[
                                   
                                    Container(
                                      
                                              margin:EdgeInsets.only(top: 15),
                                      child:Text(
                                          requirements[i].vRequirementCode,
                                          style: foodNameText,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                        ),
                                    ),
                                    Container(
                                      child: Text(
                                          requirements[i].vServiceName,
                                          style: foodNameText,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center
                                        
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                          requirements[i].vAddressDelivery,
                                          style: foodNameText,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center
                                          
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                          requirements[i].vDetalle,
                                          style: foodNameText,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center
                                        
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                          requirements[i].dRequestDate,
                                          style: foodNameText,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center 
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                          requirements[i].mPriceSale,
                                          style: foodNameText,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center
                                        ),  
                                    ),                                    
                                    Container(                       
                                              child: Text(requirements[i].vStatus,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: TextStyle( 
                                                      fontWeight: FontWeight.w800, color: requirements[i].iStatus == 1 ? Colors.red : Colors.green)),
                                            ),
                                            /*Expanded(
                                              child: Text(
                                                "\$${employees[i].mPriceSale}",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w100,
                                                    decoration: TextDecoration.lineThrough),
                                              ),
                                            ),*/
                                     
                                    Container(
                                              margin:EdgeInsets.only(top: 15),
                                              width: 180,
                                              child: requirements[i].iStatus == 1 ? froyoFlatBtn('Confirmar Solicitud', () async {
                                                 final prefs = await SharedPreferences.getInstance(); 
                                                
                                                  Map requirementModel = {"IRequirementId" : requirements[i].iRequirementId, "IStatus" : 2, "iUseId" : prefs.getInt("iUserid"),"VAddressDelivery":"aprobar"};
                                                  _scaffoldKey.currentState.showSnackBar(
                                        
                                                  new SnackBar(duration: new Duration(seconds: 4), 
                                                  content:
                                                  new Row(
                                                    children: <Widget>[
                                                      new CircularProgressIndicator(
                                                        backgroundColor: Colors.lightBlue,
                                                      ),
                                                      new Text("  Confirmando la Solicitud..."),
                                                    ],
                                                  ),
                                                  ));
                                                  var result = await ApiService.updateStatusRequirement(body : requirementModel);
                                                      print(result);
                                                      if(result.success == true){
                                                         Fluttertoast.showToast(msg: 'La Solicitud fue COnfirmada',toastLength: Toast.LENGTH_SHORT);  
                                                      // Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rotate, duration: Duration(seconds: 1),  child: HomeProvider()));
                                                }
                                              }) :  requirements[i].iStatus == 2 ? froyoFlatBtn('Iniciar Servicio', () async {
                                                 final prefs = await SharedPreferences.getInstance(); 
                                                
                                                  Map requirementModel = {"IRequirementId" : requirements[i].iRequirementId, "IStatus" : 3, "iUseId" : prefs.getInt("iUserid"),"VAddressDelivery":"aprobar"};
                                                  _scaffoldKey.currentState.showSnackBar(
                                        
                                                  new SnackBar(duration: new Duration(seconds: 4), 
                                                  content:
                                                  new Row(
                                                    children: <Widget>[
                                                      new CircularProgressIndicator(
                                                        backgroundColor: Colors.lightBlue,
                                                      ),
                                                      new Text("  Iniciando la Solicitud..."),
                                                    ],
                                                  ),
                                                  ));
                                                  var result = await ApiService.updateStatusRequirement(body : requirementModel);
                                                      print(result);
                                                      if(result.success == true){
                                                       Fluttertoast.showToast(msg: 'La Solicitud fue Iniciada',toastLength: Toast.LENGTH_SHORT);                  
                                                       //Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rotate, duration: Duration(seconds: 1),  child: HomeProvider()));
                                                }
                                              }) :  requirements[i].iStatus == 3 ? froyoFlatBtn('Realizar Pago', () async {
                                                 final prefs = await SharedPreferences.getInstance(); 
                                                
                                                  Map requirementModel = {"IRequirementId" : requirements[i].iRequirementId, "IStatus" : 4, "iUseId" : prefs.getInt("iUserid"),"VAddressDelivery":"aprobar"};
                                                  _scaffoldKey.currentState.showSnackBar(
                                        
                                                  new SnackBar(duration: new Duration(seconds: 4), 
                                                  content:
                                                  new Row(
                                                    children: <Widget>[
                                                      new CircularProgressIndicator(
                                                        backgroundColor: Colors.lightBlue,
                                                      ),
                                                      new Text("  Realizando Pago..."),
                                                    ],
                                                  ),
                                                  ));
                                                  var result = await ApiService.updateStatusRequirement(body : requirementModel);
                                                      print(result);
                                                      if(result.success == true){
                                                         Fluttertoast.showToast(msg: 'La Solicitud fue Acreditada',toastLength: Toast.LENGTH_SHORT);  
                                                       Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rotate, duration: Duration(seconds: 1),  child: SuccesfullPayment(productData:  requirements[i],)));
                                                }
                                              
                                              })  :  requirements[i].iStatus == 4 ? froyoFlatBtn('Terminar Servicio', () async {
                                                 final prefs = await SharedPreferences.getInstance(); 
                                                
                                                  Map requirementModel = {"IRequirementId" : requirements[i].iRequirementId, "IStatus" : 5, "iUseId" : prefs.getInt("iUserid"),"VAddressDelivery":"aprobar"};
                                                  _scaffoldKey.currentState.showSnackBar(
                                        
                                                  new SnackBar(duration: new Duration(seconds: 4), 
                                                  content:
                                                  new Row(
                                                    children: <Widget>[
                                                      new CircularProgressIndicator(
                                                        backgroundColor: Colors.lightBlue,
                                                      ),
                                                      new Text("  Termminando la Solicitud..."),
                                                    ],
                                                  ),
                                                  ));
                                                  var result = await ApiService.updateStatusRequirement(body : requirementModel);
                                                      print(result);
                                                      if(result.success == true){
                                                         Fluttertoast.showToast(msg: 'El servicio fue terminado',toastLength: Toast.LENGTH_SHORT);  
                                                       //Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rotate, duration: Duration(seconds: 1),  child: HomeProvider()));
                                                }
                                              }) :  
                                                    Container(
                                                      margin: EdgeInsets.only(left: 15),
                                                      child: Text('',
                                                          style: taglineText),
                                                    )
                                                
                          ),  requirements[i].iStatus == 1 ? Container(
                            width: 180,
                            child: froyoOutlineDenegarBtn('Denegar Solicitud', () async {
                                      final prefs = await SharedPreferences.getInstance(); 
                                                
                                                  Map requirementModel = {"IRequirementId" : requirements[i].iRequirementId, "IStatus" : 0, "iUseId" : prefs.getInt("iUserid"),"VAddressDelivery":"aprobar"};
                                                  _scaffoldKey.currentState.showSnackBar(
                                        
                                                  new SnackBar(duration: new Duration(seconds: 4), 
                                                  content:
                                                  new Row(
                                                    children: <Widget>[
                                                      new CircularProgressIndicator(
                                                        backgroundColor: Colors.lightBlue,
                                                      ),
                                                      new Text("  Denegando la Solicitud..."),
                                                    ],
                                                  ),
                                                  ));
                                                  var result = await ApiService.updateStatusRequirement(body : requirementModel);
                                                      print(result);
                                                      if(result.success == true){
                                                         Fluttertoast.showToast(msg: 'La Solicitud fue Denegada',toastLength: Toast.LENGTH_SHORT);  
                                                       //Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rotate, duration: Duration(seconds: 1),  child: HomeProvider()));
                                                }

                            }),
                          ):  Container(
                                                      margin: EdgeInsets.only(left: 15),
                                                      child: Text('',
                                                          style: taglineText),
                                                    )] : <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text('No hay Servicios Disponibles en este momento',
                                        style: taglineText),
                                  )
                                ],
                                ),
                            )
                  ),
            onTap: () async => {
                  /*await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    print('2222222222222222');
                                    return new ProductPage(
                                      productData: requirements[i],
                                    );
                                  },
                                ),
                  )*/
                },
          );
        });  
         }  
         return Center(  
           child: CircularProgressIndicator(),  
         );  
       },  
     ),    
   );                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
}
Widget buildRequirementsHistory(BuildContext context,int iUserId){
return Scaffold( 
     key : _scaffoldKey,
     body: FutureBuilder(  
      future: ApiService.getRequirementsXProveedorHistory(iUserId),  
      builder: (context, snapshot) {   
      final requirements = snapshot.data;     
      if (snapshot.connectionState == ConnectionState.done) {  
         print('cantidad :' + requirements.length.toString());
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 1.1),
        itemCount: requirements == null ? 0 : requirements.length,
        itemBuilder: (context, i) {
          return InkWell(
            child: Container(
                    margin: EdgeInsets.all(3),
                    child: Card(
                              elevation: 25,
                              margin: EdgeInsets.all(5),
                              child: Column(    
                                                         
                                  children:  (requirements != null && requirements.length > 0) ? <Widget>[
                                   
                                    Container(
                                      
                                              margin:EdgeInsets.only(top: 15),
                                      child:Text(
                                          requirements[i].vRequirementCode,
                                          style: foodNameText,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                        ),
                                    ),
                                    Container(
                                      child: Text(
                                          requirements[i].vServiceName,
                                          style: foodNameText,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center
                                        
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                          requirements[i].vAddressDelivery,
                                          style: foodNameText,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center
                                          
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                          requirements[i].vDetalle,
                                          style: foodNameText,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center
                                        
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                          requirements[i].dRequestDate,
                                          style: foodNameText,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center 
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                          requirements[i].mPriceSale,
                                          style: foodNameText,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center
                                        ),  
                                    ),                                    
                                    Container(                       
                                              child: Text(requirements[i].vStatus,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: TextStyle( 
                                                      fontWeight: FontWeight.w800, color: requirements[i].iStatus == 1 ? Colors.red : Colors.green)),
                                            )
                                            /*Expanded(
                                              child: Text(
                                                "\$${employees[i].mPriceSale}",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w100,
                                                    decoration: TextDecoration.lineThrough),
                                              ),
                                            ),*/
                                     
                                   ] : <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text('No hay Servicios Disponibles en este momento',
                                        style: taglineText),
                                  )
                                ],
                                ),
                            )
                  ),
            onTap: () async => {
                  /*await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    print('2222222222222222');
                                    return new ProductPage(
                                      productData: requirements[i],
                                    );
                                  },
                                ),
                  )*/
                },
          );
        });  
         }  
         return Center(  
           child: CircularProgressIndicator(),  
         );  
       },  
     ),    
   );                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
}

}
 
  Widget buildSeparators(String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 10)),
        Text(
          name,
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
      ],
    );
  }

 Widget buildProduct(BuildContext context,int iUserId) {

  return Scaffold(  
     body: FutureBuilder(  
       future: ApiService.getServiciosXProveedor(iUserId),  
       builder: (context, snapshot) {  
         final employees = snapshot.data; 
         if (snapshot.connectionState == ConnectionState.done) {  
      
            return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.8),
        itemCount: employees == null ? 0 : employees.length,
        itemBuilder: (context, i) {
          return InkWell(
            child: Container(
                    margin: EdgeInsets.all(3),
                    child: Card(
                              elevation: 5,
                              margin: EdgeInsets.all(10),
                              child: Container(
                                 color: Color.fromRGBO(201, 201, 201, 1),
                                margin: EdgeInsets.only(left: 1,top:5),
                                width: MediaQuery.of(context).size.width / 3.40,
                                height: MediaQuery.of(context).size.height / 3,
                                child: Column(    
                                                         
                                  children:  (employees.length > 0) ? <Widget>[
                                    /*Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center, 
                                        children: <Widget>[
                                          /*Image.asset(
                                            servicio[i].image,
                                            fit: BoxFit.fill,
                                             width: 100,
                                            height: MediaQuery.of(context).size.height / 2,
                        
                                          ), */
                                        ],
                                      ),
                                      flex: 3
                                    ),*/
                                    Expanded(
                                      child: ListTile(
                                        title: Text(
                                          employees[i].vCode,
                                          style: foodNameText,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center
                                        
                                        ),  
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text(
                                          employees[i].vName,
                                          style: foodNameText,
                                          maxLines: 5,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center
                                        ),                                      
                                        subtitle: Row(
                                          children: <Widget>[                                          
                                            Expanded(                       
                                              child: Text("\S/.${employees[i].mPriceSale}",
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w800, color: Colors.red)),
                                            ),
                                            /*Expanded(
                                              child: Text(
                                                "\$${employees[i].mPriceSale}",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w100,
                                                    decoration: TextDecoration.lineThrough),
                                              ),
                                            ),*/
                                          ],
                                        ),
                                      ),
                                      flex: 2,
                                    )] : <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text('No hay Servicios Disponibles en este momento',
                                        style: taglineText),
                                  )
                                ],
                                ),
                              ),
                            )
                  ),
            onTap: () async => {
                  /*await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    print('2222222222222222');
                                    return new ProductPage(
                                      productData: employees[i],
                                    );
                                  },
                                ),
                  )*/
                },
          );
        });  
         }  
         return Center(  
           child: CircularProgressIndicator(),  
         );  
       },  
     ),    
   ); 
  }


