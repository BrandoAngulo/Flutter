import 'package:flutter/material.dart';
import 'package:project_app_1/widgets/widgets.dart';


class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
      ),
      body: ListView(
        //hacer padding horizontal y vertical
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
       children: const [
        CustomCardType1(),
        SizedBox(height: 10),
        CustomCardType2(cardName: 'Paso a paso, simplemente es ser constante', imageUrl: 'https://cdn.pixabay.com/photo/2023/02/21/07/18/brain-7803659_1280.jpg',),
        SizedBox(height: 10),
        CustomCardType2(cardName: 'En sus marcas...', imageUrl: 'https://cdn11.bigcommerce.com/s-nq6l4syi/images/stencil/1280x1280/products/142602/298437/192473-1024__32799.1617867069.jpg?c=2?imbypass=on',),
        SizedBox(height: 10),
        //a esta card no se le puso el argumento cardName por que se le deja el nombre por defecto cuando no le ponen 
        CustomCardType2(imageUrl: 'https://en.casacol.co/wp-content/uploads/sites/3/2022/05/paragliding-2-1024x768.jpg',),
        SizedBox(height: 50,)
       ],
      )
    );
  }
}