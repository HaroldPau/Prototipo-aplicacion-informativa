class RutasRepository {
  /*
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  getRutas(RutaNotifier rutasNotifier) async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('Rutas').get();

    List<Rutas> _rutasList = [];
    snapshot.docs.forEach((element) {
      Rutas rutas = Rutas.fromMap(element.data());
    });
  }
*/
  /*Stream<List<Rutas>> rutasStream() {
    return _firestore
        .collection('Rutas')
        .orderBy('id', descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<Rutas> retVal = [];
      query.docs.forEach((element) {
        retVal.add(Rutas.fromSnapshot(element));
      });
      return retVal;
    });
  }*/
}
