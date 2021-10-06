import 'package:appfinal/constantes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

final FirebaseFirestore database = FirebaseFirestore.instance;

class DetalleRutas extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
            elevation: 0, backgroundColor: Colors.blue, title: Text('DETALLE')),
        body: DetalleR());
  }
}

class DetalleR extends StatelessWidget {
  final Stream<QuerySnapshot> stream = database.collection("Rutas").snapshots();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SecondPageArguments? arg =
        ModalRoute.of(context)!.settings.arguments as SecondPageArguments?;
    return StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text("llorarrrrr");
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              DocumentSnapshot currentDocument = snapshot.data!.docs[arg!.id];
              return SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  SizedBox(
                    height: size.height,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: size.height * 0.4),
                          padding: EdgeInsets.only(
                              top: size.height * 0.12,
                              left: kDefaultPaddin,
                              right: kDefaultPaddin),
                          //height: 500,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                              )),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(currentDocument["NombreLargo"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25)),
                                  SizedBox(
                                    width: kDefaultPaddin,
                                  ),
                                  Text(currentDocument["NombreCorto"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          color: kTextColor)),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(currentDocument["Recorrido"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: kTextLightColor)),
                                  Text('  -  '),
                                  Text(currentDocument["Recorrido2"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: kTextLightColor))
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Calificaciones(
                                  ranting: 4.5, texto: 'CALIDAD DE BUS'),
                              Calificaciones(ranting: 4, texto: 'PROTOCOLOS'),
                              Calificaciones(ranting: 3.5, texto: 'LIMPIEZA'),
                              Calificaciones(ranting: 4.5, texto: 'SEGURIDAD'),
                              Calificaciones(ranting: 4, texto: 'SERVICIO'),
                              SizedBox(
                                height: 20,
                              ),
                              RaisedButton(
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 59.0, vertical: 15.0),
                                      child: Text('Calificar',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ))),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 10.0,
                                  color: Colors.amber,
                                  onPressed: () {
                                    Navigator.of(context).pushNamed("/login");
                                  })
                            ],
                          ),
                        ),
                        CabezeraDetalle(
                            currentDocument: snapshot.data!.docs[arg.id])
                      ],
                    ),
                  ),
                ],
              ));

            default:
              return Text("LOGIN DATA");
          }
        });
  }
}

class Calificaciones extends StatelessWidget {
  final double ranting;
  final String texto;
  const Calificaciones({
    Key? key,
    required this.ranting,
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: Text(texto)),
        SmoothStarRating(
            rating: ranting,
            size: 45,
            filledIconData: Icons.star,
            halfFilledIconData: Icons.star_half,
            defaultIconData: Icons.star_border,
            starCount: 5,
            spacing: 2.0,
            isReadOnly: true)
      ],
    );
  }
}

class CabezeraDetalle extends StatelessWidget {
  const CabezeraDetalle({
    Key? key,
    required this.currentDocument,
  }) : super(key: key);

  final DocumentSnapshot<Object?> currentDocument;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Ruta:',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            currentDocument["NumeroRuta"],
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),

          Row(
            children: <Widget>[
              Center(
                  child: Text(
                'LIKE \n' + currentDocument["like"],
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              )),
              Image.network(
                'https://www.iconpacks.net/icons/2/free-instagram-like-icon-3507-thumb.png',
                height: 45,
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    tag: "${currentDocument["id"]}",
                    child: Image.network(currentDocument["imagen"],
                        fit: BoxFit.fill),
                  ),
                ),
              ),
            ],
          ) //)
        ],
      ),
    );
  }
}

class SecondPageArguments {
  int id;
  SecondPageArguments({required this.id});
}
