import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_aplicacion_noticias/src/models/category_model.dart';
import 'package:provider_aplicacion_noticias/src/models/news_models.dart';
import 'package:provider_aplicacion_noticias/src/services/news_service.dart';
import 'package:provider_aplicacion_noticias/src/services/news_service.dart';
import 'package:provider_aplicacion_noticias/src/theme/tema.dart';
import 'package:provider_aplicacion_noticias/src/widgets/lista_noticias.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewsService>(context);

    return SafeArea(
        child: Scaffold(
      body: Column(
        children: <Widget>[
          _ListaCategorias(),
          Expanded(
              child:
                  ListaNoticias(newService.getArticulosCategoriaSeleccionada))
        ],
      ),
    ));
  }
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          //variable para poner en mayuscula la primera letra de cada palabra en el array
          final cName = categories[index].name;
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                _CategoryButton(categories[index]),
                const SizedBox(height: 5),
                //entramos al array cName al indice 0 y se convierte en mayuscula,
                //Luego entramos de nuevo al array cName y se hace un subtring desde la posicion 1
                //concatenandolo todo
                Text('${cName[0].toUpperCase()}${cName.substring(1)}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  //creamos variable solo para seleccionar una sola categoria
  final Category categoria;

  const _CategoryButton(this.categoria);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    //detector de gestos
    return GestureDetector(
      //click en cualquier icono
      onTap: () {
        //print('${categoria.name}');
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = categoria.name;
      },
      child: Container(
          width: 40,
          height: 40,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
              shape: BoxShape.rectangle, color: Colors.white),
          child: Icon(
            categoria.icon,
            color: (newsService.selectedCategory == this.categoria.name)
                ? miTema.colorScheme.secondary
                : Colors.black54,
          )),
    );
  }
}
