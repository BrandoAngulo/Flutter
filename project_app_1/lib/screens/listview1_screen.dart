import 'package:flutter/material.dart';
import 'package:project_app_1/theme/app_theme.dart';

class ListView1Screen extends StatelessWidget {
  const ListView1Screen({Key? key}) : super(key: key);
  final options = const ['Zelda', 'Super Smash Bros', '007'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListView Tipo 1'),
        ),
        body: ListView(
          children: [
            //El operador expred ... extrae uno de los elementos de una lista y mostrar el widget
            ...options
                .map((game) => ListTile(
                      title: Text(game),
                      trailing: const Icon(
                          Icons.arrow_circle_right_outlined, color: AppTheme.primary,), //agrega un icono
                    ))
                .toList(), //convierte a una lista de string
          ],
        ));
  }
}
