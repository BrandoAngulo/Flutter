import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_aplicacion_noticias/src/pages/tabs_page.dart';
import 'package:provider_aplicacion_noticias/src/services/news_service.dart';
import 'package:provider_aplicacion_noticias/src/theme/tema.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //envolvemos el materialApp en un widget para llamar multiples providers para cualquier parte de mi app
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewsService(),
        )
      ],
      child: MaterialApp(
        title: 'Material App',
        theme: miTema,
        debugShowCheckedModeBanner: false,
        home: const TabsPage(),
      ),
    );
  }
}
