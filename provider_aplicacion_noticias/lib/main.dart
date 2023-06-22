import 'package:flutter/material.dart';
import 'package:provider_aplicacion_noticias/src/pages/tabs_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: TabsPage(),
    );
  }
}
