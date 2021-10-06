import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final FirebaseFirestore database = FirebaseFirestore.instance;

class DetalleNoticias extends StatelessWidget {
  Widget build(BuildContext context) {
    SecondPageArguments? arg =
        ModalRoute.of(context)!.settings.arguments as SecondPageArguments?;
    return Scaffold(
        appBar: AppBar(title: Text(arg!.titulo)),
        body: Container(child: DetalleR()));
  }
}

class DetalleR extends StatelessWidget {
  final Stream<QuerySnapshot> stream = database
      .collection("Noticias")
      .orderBy("date", descending: true)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    SecondPageArguments? arg =
        ModalRoute.of(context)!.settings.arguments as SecondPageArguments?;
    return StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text("llorarrrrr");
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              DocumentSnapshot currentDocument = snapshot.data!.docs[arg!.id];
              return Container(
                  child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Image.network(currentDocument['imagen']),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(currentDocument['Titulo'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(currentDocument['Detalle'],
                          style: TextStyle(
                            fontSize: 18,
                            //fontWeight: FontWeight.bold,
                          )),
                    )
                  ],
                ),
              ));

            default:
              return Text("LOGIN DATA");
          }
        });
  }
}

class SecondPageArguments {
  int id;
  String titulo;
  SecondPageArguments({required this.id, required this.titulo});
}
