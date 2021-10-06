import 'package:appfinal/constantes.dart';
import 'package:appfinal/pages/detalleRuta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Listaruta extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Lista de Rutas')),
        body: FutureBuilder(
            future: _initialization,
            builder: (BuildContext contex, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Text('Errrorrrrr');
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return RutasList();
              }
              return Text('cargando');
            }));
  }
}

final FirebaseFirestore database = FirebaseFirestore.instance;

class RutasList extends StatelessWidget {
  final Stream<QuerySnapshot> stream = database.collection("Rutas").snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text("llorarrrrr");

          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return Container(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                child: GridView.builder(
                    itemCount: snapshot.data!.docs.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: kDefaultPaddin,
                      crossAxisSpacing: kDefaultPaddin,
                      childAspectRatio: 0.7,
                    ),
                    
                    itemBuilder: (context, index) => ItemCard(
                        currentDocument: snapshot.data!.docs[index],
                        press: () => Navigator.of(context).pushNamed(
                            "/DetalleRutas",
                            arguments: SecondPageArguments(id: index)))),
              ));

            default:
              return Text('data');
          }
        });
  }
}

class ItemCard extends StatelessWidget {
  final DocumentSnapshot currentDocument;
  final Function press;
  const ItemCard({
    Key? key,
    required this.currentDocument,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              height: 180,
              width: 160,
              decoration: BoxDecoration(
                color: Colors.brown.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                  tag: "${currentDocument["id"]}",
                  child: Image.network(currentDocument["imagen"])),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              currentDocument["NombreLargo"],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            currentDocument["NombreCorto"],
            style: TextStyle(color: kTextLightColor),
          )
        ],
      ),
    );
  }
}
