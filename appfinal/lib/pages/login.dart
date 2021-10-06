import 'package:appfinal/controlador/controlador_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (_) {
          return Container(
              child: Form(
            key: controller.formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Image.network(
                    'https://i.pinimg.com/originals/52/2b/3d/522b3d222081dca8f190f65782029c3e.png',
                    height: 250,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                _userTextFiled(),
                SizedBox(
                  height: 15,
                ),
                _passwordTextField(),
                SizedBox(
                  height: 20.0,
                ),
                _bottonLogin(),
                SizedBox(
                  height: 10.0,
                ),
                _bottonGoogle(),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    print('JAAAAAAAAAAAA');
                  },
                  child: new Text('REGISTRARSE',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                )
                /*Text('REGISTRARSE',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)
                        )*/
              ],
            ),
          ));
        },
      ),
    ));
  }

  Widget _userTextFiled() {
    return StreamBuilder(builder: (BuildContext context, AsyncSnapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          controller: controller.emailController,
          decoration: InputDecoration(
            icon: Icon(Icons.email),
            hintText: 'ejemplo@correo.com',
            labelText: 'Correo electronico',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _passwordTextField() {
    return StreamBuilder(builder: (BuildContext context, AsyncSnapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          controller: controller.passwordController,
          decoration: InputDecoration(
            icon: Icon(Icons.lock),
            hintText: 'Contraseña',
            labelText: 'Contraseña',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _bottonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 59.0, vertical: 15.0),
              child: Text('Iniciar Sesion',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ))),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 10.0,
          color: Colors.amber,
          onPressed: () async {
            controller.signInWithEmailAndPassword();
          });
    });
  }

  Widget _bottonGoogle() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text('Google',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ))),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 10.0,
          color: Colors.white,
          onPressed: () async {
            controller.signInWithGoogle();
          });
    });
  }
}
