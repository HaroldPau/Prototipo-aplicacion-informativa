import 'package:appfinal/utils.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void _mensajeWsp({@required numero, @required mensaje}) async {
  String url = 'whatsapp://send?phone=$numero&text=$mensaje';
  await canLaunch(url) ? launch(url) : print('no');
}

class Quejas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CANAL DE QUEJAS')),
      body: GridView.count(crossAxisCount: 2, children: <Widget>[
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FlatButton(
                  //color: Colors.white,
                  child: Image.network(
                      'https://www.personal-trainer.cl/wp-content/uploads/2013/11/personal-trainer-wsp.png',
                      height: 150),
                  onPressed: () {
                    _mensajeWsp(
                        numero: '+51939305141',
                        mensaje: 'Quisiera reportar un incidente');
                  }),
              Text('WHATSAPP'),
            ],
          ),
        ),
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FlatButton(
                  child: Image.network(
                      'https://rincondelatecnologia.com/wp-content/uploads/2014/10/iconos-referencia-correo.gif',
                      height: 150),
                  onPressed: () {
                    Utils.abrirEmail(
                        toEmail: 'alogtu@munlima.gob.pe',
                        subject: 'RECLAMO',
                        body: 'Hola, quisiera reportar una queja ');
                  }),
              Text('CORREO'),
            ],
          ),
        ),
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FlatButton(
                  child: Image.network(
                      'https://cdn.icon-icons.com/icons2/2248/PNG/512/phone_in_talk_icon_137309.png',
                      height: 150),
                  onPressed: () {
                    Utils.llamarNumero(numeroCelular: '016324400');
                  }),
              Text('TELEFONO'),
            ],
          ),
        ),
      ]),
    );
  }
}
