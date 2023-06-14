import 'package:flutter/material.dart';
import 'package:project_app_1/screens/listview2_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        elevation: 0,
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView.separated(
        itemCount: 5,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) => ListTile(
          title: const Text('link'),
          trailing: const Icon(
            Icons.ads_click_rounded,
            color: Colors.deepOrange,
          ),
          onTap: () {
            //para navegar a la otra vista es el context y el nombre de la ruta que asignamos en el main
            Navigator.pushNamed(context, 'listView2');
          },
        ),
      ),
    );
  }
}
