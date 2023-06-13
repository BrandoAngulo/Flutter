import 'package:flutter/material.dart';

class StateFullWidgetCounter extends StatefulWidget {
  const StateFullWidgetCounter({super.key});

  @override
  State<StateFullWidgetCounter> createState() => _StateFullWidgetCounterState();
}

class _StateFullWidgetCounterState extends State<StateFullWidgetCounter> {
  void increment() {
    counter++;
    setState(() {});
  }

  void reset() {
    counter = 0;
    setState(() {});
  }

  void decrement() {
    counter--;
    setState(() {});
  }

  int counter = 0;
  @override
  //El BuildContext sirve para saber el contexto en el cual nuestro widget esta siendo construido
  Widget build(BuildContext context) {
    //Se crea una variable para darle el valor del tamaño al texto
    const fontSize = TextStyle(fontSize: 25);

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
          //Usa MainAxisAlignment el widget de alineamiento para un column
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter', style: fontSize),
            Text('$counter', style: fontSize),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomWidgetFloatingButton(
        incrementFn:
            increment, // Se manda la referencia a la funcion(increment es la referencia) pero no se llama
        resetFn: reset,
        decrementFn: decrement,
      ),
    );
  }
}

//widget para los botones, se realizo la separacion de los botones para leer mejor el codigo
class CustomWidgetFloatingButton extends StatelessWidget {
  final Function incrementFn;
  final Function resetFn;
  final Function decrementFn;
  const CustomWidgetFloatingButton({
    super.key,
    required this.incrementFn,
    required this.resetFn,
    required this.decrementFn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      //usar el widget mainAxisAlignment para alinear el row
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //Boton de sumar counter
        FloatingActionButton.small(
          onPressed: () => {
            incrementFn(),
          },
          child: const Icon(Icons.plus_one),
        ),

        //Boton Reset counter, le asignamos a la variable counter el cero
        FloatingActionButton.small(
          onPressed: () => {
            resetFn(),
          },
          child: const Icon(Icons.restart_alt_outlined),
        ),

        //Boton reverse counter
        FloatingActionButton.small(
          onPressed: () => {
            decrementFn(),
          },
          child: const Icon(Icons.exposure_minus_1_outlined),
        ),
      ],
    );
  }
}
