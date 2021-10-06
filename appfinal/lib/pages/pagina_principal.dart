import 'package:flutter/material.dart';

import '../utils.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
      ),
      body: Builderappbar(),
    );
  }

  void _showQuejasUsuarios(BuildContext context) {
    Navigator.of(context).pushNamed("/quejas");
  }

  void _showListaRutas(BuildContext context) {
    Navigator.of(context).pushNamed("/ListaRutas");
  }

  void _showListaNoticias(BuildContext context) {
    Navigator.of(context).pushNamed("/ListaNoticias");
  }
}

class Builderappbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          height: size.height * 0.2,
          child: Stack(
            children: <Widget>[
              Container(
                height: size.height * 0.1 - 27,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: <Widget>[
                      Text('APPIT',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FlatButton(
                      //color: Colors.white,
                      child: Image.network(
                          'https://www.admenergy.com.mx/wp-content/uploads/complaints.png',
                          height: 150),
                      onPressed: () {
                        Navigator.of(context).pushNamed("/quejas");
                      }),
                  Text('CANAL DE QUEJAS'),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FlatButton(
                      //color: Colors.white,
                      child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7rlInPJ4CPlg7lbLR48cq5mTtJaWZXCjAg14FmBc1PisUOEuSG7cM1UOLVIS4lSHR-no&usqp=CAU',
                          height: 150),
                      onPressed: () {
                        Navigator.of(context).pushNamed("/ListaNoticias");
                      }),
                  Text('NOTICIAS'),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          children: <Widget>[
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FlatButton(
                      //color: Colors.white,
                      child: Image.network(
                          'https://paselaboral.servicios.gob.pe/assets/coronavirus/pnp-dde2c583d70ac721663eaf15c6cbae142df27e3f5af7a2465f645c392c0e859e.png',
                          height: 150),
                      onPressed: () {
                        Utils.openLink(
                            url:
                                'https://paselaboral.servicios.gob.pe/paselaboral/request_new');
                      }),
                  Text('PASE LABORAL'),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FlatButton(
                      //color: Colors.white,
                      child: Image.network(
                          'https://e7.pngegg.com/pngimages/155/136/png-clipart-prairie-bus-lines-limited-computer-icons-san-diego-metropolitan-transit-system-bus-rapid-transit-bus-school-bus-public-transport.png',
                          height: 150),
                      onPressed: () {
                        Navigator.of(context).pushNamed("/ListaRutas");
                      }),
                  Text('CALIFICACIONES'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
