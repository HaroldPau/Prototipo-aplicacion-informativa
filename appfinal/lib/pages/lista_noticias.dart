import 'package:appfinal/pages/detalle_noticia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ListaNocitias extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Noticias')),
        body: FutureBuilder(
            future: _initialization,
            builder: (BuildContext contex, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Text('Errrorrrrr');
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return ListaN();
              }

              return Text('cargando');
            }));
  }
}

final FirebaseFirestore database = FirebaseFirestore.instance;

class ListaN extends StatelessWidget {
  var condts = {
    0: Image.network(
        'https://www.ptosanjose.com/colegio/wp-content/uploads/2015/11/icono-noticias.png',
        width: 100,
        fit: BoxFit.fitHeight),
    1: Image.network(
        'https://www.skymsen.com/uploads/blog/nociones-generales-de-seguridad.png',
        width: 100,
        fit: BoxFit.fitHeight),
    2: Image.network(
        'https://www.clipartmax.com/png/middle/168-1688476_salud-icono-gratis-cross.png',
        width: 100,
        fit: BoxFit.fitHeight),
    3: Image.network(
        'https://image.flaticon.com/icons/png/512/2926/2926659.png',
        width: 100,
        fit: BoxFit.fitHeight),
  };
  final Stream<QuerySnapshot> stream = database
      .collection("Noticias")
      .orderBy("date", descending: true)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text("llorarrrrr");

          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return Container(
                  child: ListView(
                children: List.generate(snapshot.data!.docs.length, (index) {
                  DocumentSnapshot currentDocument = snapshot.data!.docs[index];
                  return ListTile(
                    //leading: Image.network(                      currentDocument["imagen"],
                    leading: condts[currentDocument["tipo"]],
                    title: Text(currentDocument["Titulo"]),
                    subtitle: Text(currentDocument["fecha"]),
                    onTap: () {
                      Navigator.of(context).pushNamed("/DetalleNoticias",
                          arguments: SecondPageArguments(
                              id: index, titulo: currentDocument["Titulo"]));
                    },
                  );
                }),
              ));
            default:
              return Text("LOGIN DATA");
          }
        });
  }
}
