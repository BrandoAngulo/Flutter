import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {
  const ListView2Screen({Key? key}) : super(key: key);
  final options = const ['Zelda', 'Super Smash Bros', 'Bond 007'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListView Tipo 2'),
        ),
        body: ListView.separated(
          itemCount: options.length, //tamaño del array
          //recorre cada item dentro del array y devolvemos un texto
          itemBuilder: (context, index) => ListTile(
              title: Text(options[index]),
              trailing: const Icon(
                Icons.arrow_circle_right_outlined,
              ),
              onTap: () {
                /* final game = options[index];
                print(game); */
              }),
          //como no necesitamos el conext ni el index ponemos _ , __ y devolvemos el separador Divider()
          separatorBuilder: (_, __) => const Divider(),
        ));
  }
}
