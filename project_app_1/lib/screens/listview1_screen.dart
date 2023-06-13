import 'package:flutter/material.dart';

class ListView1_screen extends StatelessWidget {
  const ListView1_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListView Tipo 1'),
          elevation: 10,
        ),
        body: ListView(
          children: const [
            Text('Hello world'),
          ],
        ));
  }
}
