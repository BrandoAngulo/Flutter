import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
       children: const [
        Card(
          child: Text('Titilo'),
        )
       ],
      )
    );
  }
}
