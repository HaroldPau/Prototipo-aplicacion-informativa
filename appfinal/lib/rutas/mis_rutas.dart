import 'package:appfinal/pages/calificar_ruta.dart';
import 'package:appfinal/pages/detalleRuta.dart';
import 'package:appfinal/pages/detalle_noticia.dart';
import 'package:appfinal/pages/listaRutas.dart';
import 'package:appfinal/pages/lista_noticias.dart';

import 'package:appfinal/pages/login.dart';
import 'package:appfinal/pages/pagina_principal.dart';
import 'package:appfinal/pages/quejas_usuario.dart';
import 'package:get/route_manager.dart';

routes() => [
      GetPage(name: "/", page: () => MyHomePage()),
      GetPage(name: "/quejas", page: () => Quejas()),
      GetPage(name: "/login", page: () => Login()),
      GetPage(name: "/calificarR", page: () => CalificarRuta()),
      GetPage(name: "/ListaRutas", page: () => Listaruta()),
      GetPage(name: "/DetalleRutas", page: () => DetalleRutas()),
      GetPage(name: "/ListaNoticias", page: () => ListaNocitias()),
      GetPage(name: "/DetalleNoticias", page: () => DetalleNoticias()),
    ];
