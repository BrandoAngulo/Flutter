import 'package:flutter/material.dart';

class StateFullWidgetCounter extends StatefulWidget {
  const StateFullWidgetCounter({super.key});

  @override
  State<StateFullWidgetCounter> createState() => _StateFullWidgetCounterState();
}

class _StateFullWidgetCounterState extends State<StateFullWidgetCounter> {
  @override
  //El BuildContext sirve para saber el contexto en el cual nuestro widget esta siendo construido
  Widget build(BuildContext context) {
    //Se crea una variable para darle el valor del tamaño al texto
    const fontSize = TextStyle(fontSize: 25);
    int counter = 0;
    //El escaffold es el lienzo en el cual ya tengo opciones para empezar a poner mis widgets dentro
    return Scaffold(
      //Barra de navegacion
      appBar: AppBar(
        title: const Text('StateFull Widget Counter'),
        elevation:
            10, //eleva la barra de navegacion o se ve como con una shadow
      ),
      //muestra el texto centrado del home
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter', style: fontSize),
            Text('$counter', style: fontSize),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          print('Hello world $counter');
          counter++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
