// @dart=2.9

import 'package:appfinal/rutas/mis_rutas.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    navigatorKey: Get.key,
    getPages: routes(),
  ));
}
