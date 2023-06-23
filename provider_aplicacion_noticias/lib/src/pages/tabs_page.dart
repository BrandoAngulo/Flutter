import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_aplicacion_noticias/src/pages/tab1_page.dart';
import 'package:provider_aplicacion_noticias/src/services/news_service.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavegacionModel(),
      child: Scaffold(
        //widget extraido
        body: _Paginas(),
        //widget extraido
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //relizamos la busqueda de la instancia de la clase que queremos utilizar para redibujar  los widgets que se necesitan
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
        //selecciona y pinta automaticamente uno de los iconos de la barra de navegacion
        currentIndex: navegacionModel.paginaAcual,
        //cambio el valor de navegacion y al cambiar el valor dispara al notyfierlistener y este dibuja los lugares donde sea necesario
        onTap: (i) => navegacionModel.paginaAcual = i,
        //pone los iconos con la barra de navegacion en el footer
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_search_rounded),
            label: 'Personas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'World',
          )
        ]);
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //instanciamos la clase y usamos el Provider de NavegacionModel
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    //con el widget PageView podemos deslizar con el dedo de derecha a izquierda entre containers
    return PageView(
      //A este controlador le estamos estableciendo por referencia el get pageController
      controller: navegacionModel.pageController,
      //quita o pone el desliz entre los containers o tabs
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Tab1Page(),
        Container(
          color: Colors.blue,
        ),
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  //inicializamos nuestro pageController para darle control entre paginas
  final PageController _pageController = PageController();

  int get paginaAcual => _paginaActual;

  set paginaAcual(int valor) {
    _paginaActual = valor;
    //disparar un metodo del pageController para que haga el cambio de tab
    //el valor es la pagina actual
    _pageController.animateToPage(valor,
        duration: const Duration(milliseconds: 255), curve: Curves.easeOut);
    notifyListeners();
  }

  //hacemos nuestro get de pageController por que mediante este getter lo estamos estableciendo al controller de PageView
  PageController get pageController => _pageController;
}
