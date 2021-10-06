import 'package:cloud_firestore/cloud_firestore.dart';

class Rutas {
  late String id, nombreC, nombreL, numeroRuta, recorrido, recorrido2, image;

  Rutas(this.id, this.nombreC, this.nombreL, this.numeroRuta, this.recorrido,
      this.recorrido2, this.image);

  static Rutas fromSnapshot(DocumentSnapshot snapshot) {
    return Rutas(
        snapshot.id,
        snapshot.get('NombreCorto'),
        snapshot.get('NombreLargo'),
        snapshot.get('NumeroRuta'),
        snapshot.get('Recorrido'),
        snapshot.get('Recorrido2'),
        snapshot.get('image'));
  }
  /*Rutas.fromMap(Map<String, dynamic>data){
    id= data[''];
    nombreC= data[''];
    nombreL= data[''];
    numeroRuta= data[''];
    recorrido= data[''];
    recorrido2= data[''];
    image= data[''];
  }*/

}
