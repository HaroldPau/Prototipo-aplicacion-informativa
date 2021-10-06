import 'package:appfinal/controlador/controlador_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CalificarRuta extends StatelessWidget {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calificar Ruta'),
          actions: <Widget>[
            Builder(
              builder: (BuildContext context) {
                return FlatButton(
                  child: const Text('Cerrar Sesion'),
                  textColor: Theme.of(context).buttonColor,
                  onPressed: () async {
                    controller.signOut();
                  },
                );
              },
            )
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 5),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Calificaciones(ranting: 0, texto: 'CALIDAD DEL BUS'),
                Calificaciones(ranting: 0, texto: 'PROTOCOLOS'),
                Calificaciones(ranting: 0, texto: 'LIMPIEZA'),
                Calificaciones(ranting: 0, texto: 'SEGURIDAD'),
                Calificaciones(ranting: 0, texto: 'SERVICIO'),
                SizedBox(
                  height: 50,
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
                      Navigator.of(context).pushNamed("");
                    })
              ],
            ),
          ),
        ));
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
        )
      ],
    );
  }
}
