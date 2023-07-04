import 'dart:math' show Random;

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double _width = 100;
  double _height = 100;
  Color _color = Colors.blue;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(50);

  void changeShape() {
    final random =Random();
      _width = random.nextInt(300).toDouble()+70; 
      _height = random.nextInt(300).toDouble()+70;//se suma 70 por que es el minimo de ancho que deberia llegar la animacion
      _color = Color.fromRGBO(
      random.nextInt(250), //se pone el valor maximo hasta 250 por que es el limite de colores
      random.nextInt(250),
      random.nextInt(250),
      1);
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble() + 10);
    //redibuja el estado de los widget que se estan le estan volviendo a cambiar las propiedades
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated contain'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          width: _width,
          height: _height,
          decoration: BoxDecoration(color: _color, borderRadius: _borderRadius),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.play_circle_outlined),
          onPressed: changeShape),
    );
  }
}
