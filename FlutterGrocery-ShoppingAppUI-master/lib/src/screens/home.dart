import 'package:flutter/material.dart';
import 'package:fryo/src/models/User.dart';
import 'package:fryo/src/screens/category.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  final User userData;
  Home({Key key, this.title, this.iCategoryId,this.userData}) : super(key: key);

  final String title;
  final String iCategoryId;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 String vNormalizedusername = '';
  String vEmail = '';

  var categories = [
    {
      'iCategoryId' : 201,
      'title': 'Hogar',
      'img': 'images/categorys/ama-casa.png',
    },
    {
      'iCategoryId' : 202,
      'title': 'Carpinteria & Melamina',
      'img': 'images/categorys/carpenter.png',
    },
    {
      'iCategoryId' : 203,
      'title': 'Catering',
      'img': 'images/categorys/catering.png',
    },
    {
      'iCategoryId' : 204,
      'title': 'Cerrajería',
      'img': 'images/categorys/cerrajero.png',
    },
    {
      'iCategoryId' : 205,
      'title': 'Albañileria & Construcción',
      'img': 'images/categorys/Construccion.png',
    },
    {
      'iCategoryId' : 206,
      'title': 'Electricos',
      'img': 'images/categorys/electricista.png',
    },
    {
      'iCategoryId' : 207,
      'title': 'Organización Eventos',
      'img': 'images/categorys/eventos.png',
    },
    {
      'iCategoryId' : 208,
      'title': 'Gasfiteria',
      'img': 'images/categorys/gasfitero.png',
    },
    {
      'iCategoryId' : 209,
      'title': 'Remolques & Gruas',
      'img': 'images/categorys/grua.png',
    },
    {
      'iCategoryId' : 210,
      'title': 'Jardinería',
      'img': 'images/categorys/jardinero.png',
    },
    {
      'iCategoryId' : 211,
      'title': 'Belleza, Estética & Otros',
      'img': 'images/categorys/peluquero.png',
    },
    {
      'iCategoryId' : 212,
      'title': 'Automotriz',
      'img': 'images/categorys/mecanico.png',
    },
    {
      'iCategoryId' : 213,
      'title': 'Servicios Médicos',
      'img': 'images/categorys/medical.png',
    },
    {
      'iCategoryId' : 214,
      'title': 'Movilidad Escolar',
      'img': 'images/categorys/movilidad_escolar.png',
    },
    {
      'iCategoryId' : 215,
      'title': 'Mudanza',
      'img': 'images/categorys/mudanza.png',
    },
    {
      'iCategoryId' : 216,
      'title': 'Guarderia',
      'img': 'images/categorys/niñera.png',
    },
    {
      'iCategoryId' : 217,
      'title': 'Fotografia & Video',
      'img': 'images/categorys/photographer.png',
    },
    {
      'iCategoryId' : 218,
      'title': 'Pintura & Acabados',
      'img': 'images/categorys/pintor.png',
    },
    {
      'iCategoryId' : 219,
      'title': 'Academicos & Coach',
      'img': 'images/categorys/profesor.png',
    },
    {
      'iCategoryId' : 220,
      'title': 'Tecnológicos',
      'img': 'images/categorys/programmer.png',
    },
    {
      'iCategoryId' : 221,
      'title': 'Sastrería',
      'img': 'images/categorys/sastre.png',
    },
    {
      'iCategoryId' : 222,
      'title': 'Artísticos & Entretenimiento',
      'img': 'images/categorys/show-animacion.png',
    },
    {
      'iCategoryId' : 223,
      'title': 'Soldadura',
      'img': 'images/categorys/soldador.png',
    },
    {
      'iCategoryId' : 224,
      'title': 'Reparaciones Técnicas',
      'img': 'images/categorys/tecnico_repair.png',
    },
    {
      'iCategoryId' : 225,
      'title': 'Trainers',
      'img': 'images/categorys/trainer.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categorias"),
      ),
      drawer: buildDrawer(),
      body: buildBody(),
    );
  }

  Widget buildBody() {
  
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.7),
        itemCount: 25,
        itemBuilder: (context, i) {
          return InkWell(
            child: Container(
              margin: EdgeInsets.all(18),
              child: Card(
                elevation: 2,
                child: Container(
                  child: Container(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    child: buildTitle(categories[i]['title']),
                  ),
                  decoration: BoxDecoration                              
                  (
                    image: DecorationImage(
                        image: AssetImage(categories[i]['img']),                     
                        fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
            onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Category(
                                iCategoryId: categories[i]['iCategoryId'],
                                title: categories[i]['title'],
                              )))
                },
          );
        });
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
                title: new Text('Are you sure?'),
                content: new Text('Do you want to exit an App'),
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
                  buildSeparators("Perfil : Cliente"),
                  buildTile(
                    "Cerrar Sessión",
                    "/signin",
                    'images/img/login.png',
                  ),
                  buildTile(
                    "Editar Usuario",
                    "/signup",
                    'images/img/registeration_ico.png',
                  ),
                  Divider(),
                  buildSeparators("Información"),
                  /*buildTile(
                    "Feedback",
                    "/feedback",
                    'images/img/feedback.png',
                  ),
                  buildTile(
                    "How to order",
                    "/feedback",
                    'images/img/info.png',
                  ),*/
                  buildTile(
                    "Mis Solicitudes",
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

  Widget buildTile(String name, String path, String imgPath) {
    return ListTile(
      leading: Image.asset(
        imgPath,
        scale: 1.2,
      ),
      title: Text(name),
      onTap: (){
        if (path != '/signin' && path != '/signup' )
          Navigator.pop(context);
        else{
          Navigator.pushNamed(context, path);
          //SharedPreferences preferences = await SharedPreferences.getInstance();
          //preferences.clear();
          print('salir');
        }
      },
    );
  }
  Future getvNormalizedusername(String key) async {
   final prefs = await SharedPreferences.getInstance(); 
   setState(() {
     vNormalizedusername = prefs.getString(key);
   });

 }
 Future getvEmail(String key) async {
   final prefs = await SharedPreferences.getInstance(); 
   setState(() {
     vEmail = prefs.getString(key);
   });
 }
  
}
