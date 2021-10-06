import 'dart:collection';

import 'package:appfinal/Modelo/modelo_ruta.dart';
import 'package:flutter/foundation.dart';

class RutaNotifier with ChangeNotifier {
  List<Rutas> _rutasList = [];
  late Rutas _currentRutas;
  UnmodifiableListView<Rutas> get rutasList => UnmodifiableListView(_rutasList);

  Rutas get currentRutas => _currentRutas;

  set rutasList(List<Rutas> rutasList) {
    _rutasList = rutasList;
    notifyListeners();
  }

  set currentRutas(Rutas rutas) {
    _currentRutas = rutas;
    notifyListeners();
  }
}
