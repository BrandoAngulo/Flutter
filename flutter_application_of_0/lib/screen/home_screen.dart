import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  //El BuildContext sirve para saber el contexto en el cual nuestro widget esta siendo construido
  Widget build(BuildContext context) {
    //El escaffold es el lienzo en el cual ya tengo opciones para empezar a poner mis widgets dentro
    return Scaffold(
      //Barra de navegacion
      appBar: AppBar(
        title: const Text('NavBar'),
        elevation:
            10, //eleva la barra de navegacion o se ve como con una shadow
      ),
      //muestra el texto centrado del home
      body: const Center(
        child: Text('from homeScreen'),
      ),
    );
  }
}
