import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_aplicacion_noticias/src/services/news_service.dart';

import '../widgets/lista_noticias.dart';

class Tab1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //instanciamos el provider
    final newsService = Provider.of<NewsService>(context);
    //newsService.headlines;

    return Scaffold(
      body: ListaNoticias(newsService.headlines),
      
    );
  }
}
