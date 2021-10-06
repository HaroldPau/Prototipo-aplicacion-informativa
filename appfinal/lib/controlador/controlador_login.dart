import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //Example code of how to sign in with Google.
  Future<void> signInWithGoogle() async {
    try {
      UserCredential userCredential;

      if (kIsWeb) {
        var googleProvider = GoogleAuthProvider();
        userCredential = await _auth.signInWithPopup(googleProvider);
      } else {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication googleAuth =
            await googleUser!.authentication;
        final googleAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        userCredential = await _auth.signInWithCredential(googleAuthCredential);
      }

      final user = userCredential.user;
      Get.snackbar(
        'BIENVENIDO',
        '${user!.displayName}',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackStyle: SnackStyle.GROUNDED,
      );
      print('ingreso bien');
      Future.delayed(
        Duration(seconds: 3),
        () {
          Get.toNamed("/calificarR");
        },
      );
    } catch (e) {
      print(e);
      Get.snackbar('Fallo', 'Fallo el inicio de sesion con google: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Example code of how to sign in with email and password.
  Future<void> signInWithEmailAndPassword() async {
    try {
      final User? user = (await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user;
      Get.snackbar('hola', 'Su ingreso a sido exitoso');
      print('ingreso bien');
      Future.delayed(
        Duration(seconds: 2),
        () {
          Get.toNamed("/");
        },
      );
    } catch (e) {
      Get.snackbar('FALLO', 'No se puede ingresar',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  //sign out
  void _signOut() async {
    await _auth.signOut();
  }

  void signOut() async {
    final User? user = await _auth.currentUser;
    if (user == null) {
      Get.snackbar('title', 'message', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    _signOut();
    final String uid = user.uid;
    Get.snackbar('Out', uid + ' cerraste sesion',
        snackPosition: SnackPosition.BOTTOM);
    Get.toNamed("/");
  }
}
