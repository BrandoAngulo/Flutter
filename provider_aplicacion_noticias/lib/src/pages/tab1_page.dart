import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_aplicacion_noticias/src/services/news_service.dart';

class Tab1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //instanciamos el provider
    final newsService = Provider.of<NewsService>(context);

    return const Scaffold(
      body: Center(
        child: Text('Tab1Page'),
      ),
    );
  }
}
