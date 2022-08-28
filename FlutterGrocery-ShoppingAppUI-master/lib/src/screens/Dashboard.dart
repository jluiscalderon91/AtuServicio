import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fryo/src/apis/api_service.dart';
import 'package:fryo/src/models/Service.dart';
import 'package:fryo/src/screens/category.dart';
import 'package:fryo/src/shared/buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/fryo_icons.dart';
import './ProductPage.dart';
import '../shared/Product.dart';
import '../shared/partials.dart';

class Dashboard extends StatefulWidget {
  final int iCategoryId;
  final String pageTitle;
  
  Dashboard({Key key, this.iCategoryId,this.pageTitle}) : super(key: key);


  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  int _iUserId = 0;
 
  final Category _category= Category();
      
  @override
  Widget build(BuildContext context) {
     readdata("iUserid"); 
    final _tabs = [
      _selectedIndex == 0 ?  buildProduct(context, widget.iCategoryId) : Text('Tab1'),
      _selectedIndex == 1 ?  buildRequirements(context,_iUserId,widget.iCategoryId) : Text('Tab2'),
      Text('Tab3')
    ];

     return Scaffold(
        backgroundColor: bgColor,
        /*appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            iconSize: 21,
            icon: Icon(Fryo.funnel),
          ),
          backgroundColor: primaryColor,
          title:
              Text('Fryo', style: logoWhiteStyle, textAlign: TextAlign.center),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              iconSize: 21,
              icon: Icon(Fryo.magnifier),
            ),
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              iconSize: 21,
              icon: Icon(Fryo.alarm),
            )
          ],
        ),*/
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
                icon: Icon(Fryo.cart),
                title: Text(
                  'Solicitudes',
                  style: tabLinkStyle,
                )),
            BottomNavigationBarItem(
                icon: Icon(Fryo.heart_1),
                title: Text(
                  'Favoritos',
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
  
  /*void getuserid() async {
    count = count + 1;
    print(count);
    final prefs = await SharedPreferences.getInstance(); 
    setState(() {
      _iUserId = prefs.getInt("iUserid");
    });
  }*/
  Widget buildRequirements(BuildContext context, int iUserId, int iCategoryid){
int count = 0;
return Scaffold( 
     key : _scaffoldKey,
     body: FutureBuilder(  
      future: ApiService.getRequirementsXUser(iUserId,iCategoryid),   
      builder: (context, snapshot) {   
      final requirements = snapshot.data;     
      if (snapshot.connectionState == ConnectionState.done) {  
         print('cantidad :' + requirements.length.toString());
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: requirements[count].iStatus == 1 ? 1.1 : requirements[count].iStatus == 5 ? 1.1 : 1.1),
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
                                              child: requirements[i].iStatus == 1 ? Container(
                            width: 180,
                            child: froyoOutlineDenegarBtn('Anular Solicitud', () async {
                                      final prefs = await SharedPreferences.getInstance(); 
                                                
                                                  Map requirementModel = {"IRequirementId" : requirements[i].iRequirementId, "IStatus" : -1, "iUseId" : prefs.getInt("iUserid"),"VAddressDelivery":"aprobar"};
                                                  _scaffoldKey.currentState.showSnackBar(
                                        
                                                  new SnackBar(duration: new Duration(seconds: 4), 
                                                  content:
                                                  new Row(
                                                    children: <Widget>[
                                                      new CircularProgressIndicator(
                                                        backgroundColor: Colors.lightBlue,
                                                      ),
                                                      new Text("  Anulando la Solicitud..."),
                                                    ],
                                                  ),
                                                  ));
                                                  var result = await ApiService.updateStatusRequirement(body : requirementModel);
                                                      print(result);
                                                      if(result.success == true){
                                                         Fluttertoast.showToast(msg: 'La Solicitud fue Anulada',toastLength: Toast.LENGTH_SHORT);  
                                                       //Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rotate, duration: Duration(seconds: 1),  child: HomeProvider()));
                                                }

                                             }),
                                                ):Container(
                                                                            margin: EdgeInsets.only(left: 15),
                                                                            child: Text('',
                                                                                style: taglineText),
                                                                          )
                                                                      
                                                ),  
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
Widget buildProduct(BuildContext context, int iCategoryId) {

return Scaffold(  
     body: FutureBuilder(  
       future: ApiService.getServiciosXCategoria(iCategoryId),  
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
                  await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    print('2222222222222222');
                                    return new ProductPage(
                                      productData: employees[i],
                                    );
                                  },
                                ),
        )
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
    

/*Widget storeTab(BuildContext context) {

  // will pick it up from here
  // am to start another template
  List<Product> foods = [
    Product(
        name: "Hamburger",
        image: "images/3.png",
        price: "\$25.00",
        userLiked: true,
        discount: 10),
    Product(
        name: "Pasta",
        image: "images/5.png",
        price: "\$150.00",
        userLiked: false,
        discount: 7.8),
    Product(
      name: "Akara",
      image: 'images/2.png',
      price: '\$10.99',
      userLiked: false,
    ),
    Product(
        name: "Strawberry",
        image: "images/1.png",
        price: '\$50.00',
        userLiked: true,
        discount: 14)
  ];

  /*List<Product> drinks = [
    Product(
        name: "Coca-Cola",
        image: "images/6.png",
        price: "\$45.12",
        userLiked: true,
        discount: 2),
    Product(
        name: "Lemonade",
        image: "images/7.png",
        price: "\$28.00",
        userLiked: false,
        discount: 5.2),
    Product(
        name: "Vodka",
        image: "images/8.png",
        price: "\$78.99",
        userLiked: false),
    Product(
        name: "Tequila",
        image: "images/9.png",
        price: "\$168.99",
        userLiked: true,
        discount: 3.4)
  ];
*/
  return ListView(children: <Widget>[
    //headerTopCategories(),
    deals('',onViewMore: () {}, items: <Widget>[
      foodItem(foods[0], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: foods[0],
              );
            },
          ),
        );
      }, onLike: () {}),
      foodItem(foods[1], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: foods[1],
              );
            },
          ),
        );
      }, imgWidth: 250, onLike: () {
        
      }),
      foodItem(foods[2], onTapped: () {
         Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: foods[2],
              );
            },
          ),
        );
      }, imgWidth: 200, onLike: () {
       
      }),
      foodItem(foods[3], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: foods[3],
              );
            },
          ),
        );
      }, onLike: () {
        
      }),
    ]),
  /*deals('', onViewMore: () {}, items: <Widget>[
      foodItem(drinks[0], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: drinks[0],
              );
            },
          ),
        );
      }, onLike: () {}, imgWidth: 60),
      foodItem(drinks[1], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: drinks[1],
              );
            },
          ),
        );
      }, onLike: () {}, imgWidth: 75),
      foodItem(drinks[2], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: drinks[2],
              );
            },
          ),
        );
      }, imgWidth: 110, onLike: () {}),
      foodItem(drinks[3], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: drinks[3],
              );
            },
          ),
        );
      }, onLike: () {}),
    ])*/
  ]);
}*/

Widget sectionHeader(String headerTitle, {onViewMore}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 15, top: 10),
        child: Text(headerTitle, style: h4),
      ),
      Container(
        margin: EdgeInsets.only(left: 15, top: 2),
        child: FlatButton(
          onPressed: onViewMore,
          //child: Text('View all ›', style: contrastText),
        ),
      )
    ],
  );
}

// wrap the horizontal listview inside a sizedBox..
/*Widget headerTopCategories() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      sectionHeader('Categorias', onViewMore: () {}),
      SizedBox(
        height: 130,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            headerCategoryItem('Frieds', Fryo.dinner, onPressed: () {}),
            headerCategoryItem('Fast Food', Fryo.food, onPressed: () {}),
            headerCategoryItem('Creamery', Fryo.poop, onPressed: () {}),
            headerCategoryItem('Hot Drinks', Fryo.coffee_cup, onPressed: () {}),
            headerCategoryItem('Vegetables', Fryo.leaf, onPressed: () {})
          ],
        ),
      )
    ],
  );
}
*/
Widget headerCategoryItem(String name, IconData icon, {onPressed}) {
  return Container(
    margin: EdgeInsets.only(left: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 86,
            height: 86,
            child: FloatingActionButton(
              shape: CircleBorder(),
              heroTag: name,
              onPressed: onPressed,
              backgroundColor: white,
              child: Icon(icon, size: 35, color: Colors.black87),
            )),
        Text(name + ' ›', style: categoryText)
      ],
    ),
  );
}

Widget deals(String dealTitle, {onViewMore, List<Widget> items}) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        sectionHeader(dealTitle, onViewMore: onViewMore),
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: (items != null)
                ? items
                : <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text('No items available at this moment.',
                          style: taglineText),
                    )
                  ],
          ),
        )
      ],
    ),
  );
}
