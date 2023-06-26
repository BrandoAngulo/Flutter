import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_aplicacion_noticias/src/services/news_service.dart';

import '../widgets/lista_noticias.dart';

class Tab1Page extends StatefulWidget {
  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    //instanciamos el provider
    final headlines = Provider.of<NewsService>(context).headlines;
    //newsService.headlines;
    //ListaNoticias(newsService.headlines)
    return Scaffold(
        body: (headlines.length == 0)
            ? const Center(child: CircularProgressIndicator())
            : ListaNoticias(headlines));
  }
  
  @override
  bool get wantKeepAlive => true;
}
