import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  //Realizar la alerta para IOS con la libreria cupertino
  void displayDialogIos(BuildContext context) {
    showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Tu zona de anime'),
          content: Column(
            children: [
              SizedBox.fromSize(
                size: const Size(20, 20),
              ),
              //Text('CuerpoCard'),
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 10,
                child: const Image(
                  image: AssetImage('assets/images/logoCrunchyRoll.gif'),
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancelar'))
          ],
        );
      },
    );
  }

  void displayDialogAndroid(BuildContext context) {
    //mostrar como un tipo de alerta al tocar el boton
    showDialog(
      //sirve para poder cerrar la alerta o dialogo tocando por fuera
      barrierDismissible: true,
      traversalEdgeBehavior: TraversalEdgeBehavior.closedLoop,
      context: context,
      //el builder es el que construye un widget y lo devuelve osea que debe llevar un return
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: const Text('Tu zona de anime'),
          content: Column(
            //le da el minimo size o tamaño de la columna
            mainAxisSize: MainAxisSize.min,
            children: [
              /* const Text('CrunchyRoll'),
              const SizedBox(
                width: 20,
              ), */
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: const Image(
                  image: AssetImage('assets/images/logoCrunchyRoll.gif'),
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          //acciones de la alerta
          actions: [
            TextButton(
                child: const Text('Cancelar'),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //Se crea un metodo que no regrese nada osea un void para llamarlo en ElevationButton con la funcion onPressed

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Alerta'),
          //Realizando alertas en este boton de presionar, cuando se realiza con funcion flecha ahi q pasarle el
          //context como referencia a la funcion
          //con platform podemos decidir si la accion esta en un sistema op android o ios y se realiza un
          //operador ternario
          onPressed: () => Platform.isAndroid //si la plataforma es android
              ? displayDialogAndroid(context) // que se muestre esta funcion
              : displayDialogIos(context), //si no se muestra esta funcion
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}
