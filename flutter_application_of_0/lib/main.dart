import 'package:flutter/material.dart';
import 'package:flutter_application_of_0/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

//siempre debe llevar el constructor para que no tenga el warning
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //como el materialApp nunca cambia ponerlo en una constante
    return const MaterialApp(
        //quita la etiqueta debug de la vista en el lado superior derecho
        debugShowCheckedModeBanner: false,
        //esta Center(child:Text('Hello World'))) es mi primera vista
        home: HomeScreen());
  }
}
