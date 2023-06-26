import 'package:flutter/material.dart';
import 'package:provider_aplicacion_noticias/src/models/news_models.dart';
import 'package:provider_aplicacion_noticias/src/theme/tema.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;
  //dejando las noticias como posicional y siempre voy a necesitar trabajar con noticias
  const ListaNoticias(this.noticias);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        //para saber en que posicion esta si 0 1 ...
        return _Noticia(noticia: this.noticias[index], index: index);
      },
      itemCount: this.noticias.length,
    );
  }
}

class _Noticia extends StatelessWidget {
  //recibe dos argumentos
  final Article noticia;
  final int index;

  const _Noticia({required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //extraemos este container en un nuevo widget para que sea mas facil de ver
        _TarjetaTopBar(noticia, index),
        _TarjetaTitulo(noticia),
        _TarjetaImagen(noticia),
        _TarjetaBody(noticia),
        _TarjetaBotones(noticia),
        const SizedBox(),
        const Divider(),
      ],
    );
  }
}


//_TarjetaTopBar(noticia, index)
class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;
  const _TarjetaTopBar(this.noticia, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text(
            '${index + 1}. ',
            style: TextStyle(color: miTema.colorScheme.secondary),
          ),
          Text(noticia.author),
        ],
      ),
    );
  }
}

//_TarjetaTitulo(noticia)
class _TarjetaTitulo extends StatelessWidget {
  final Article noticia;

  const _TarjetaTitulo(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        noticia.title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
      ),
    );
  }
}

//_TarjetaBody(noticia)
class _TarjetaBody extends StatelessWidget {
  final Article noticia;

  const _TarjetaBody(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
          //Se realiza un operador ternario, si noticia.description es != de null : 'pasa esto'
          (noticia.description != null)
              ? noticia.description
              : 'No hay contenido disponible'),
    );
  }
}

//_TarjetaImagen(noticia)
class _TarjetaImagen extends StatelessWidget {
  final Article noticia;

  const _TarjetaImagen(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      //hace recortes a la imagen
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            //operador ternario si la noticia es doferente de null ? entonces muestro el fadeiInImage
            child: (noticia.urlToImage != null)
                ? FadeInImage(
                    placeholder: const AssetImage('assets/img/giphy_xp.gif'),
                    image: NetworkImage(noticia.urlToImage),
                  )
                //caso contrario esto va con el operador ternario
                : const Image(image: AssetImage('assets/img/no-image.png'))),
      ),
    );
  }
}

//_TarjetaBotones(noticia)
class _TarjetaBotones extends StatelessWidget {
  final Article noticia;

  const _TarjetaBotones(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RawMaterialButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          fillColor: miTema.colorScheme.secondary,
          child: const Icon(Icons.star_border),
        ),
        const SizedBox(width: 5),
        RawMaterialButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          fillColor: Colors.blue,
          child: const Icon(Icons.more),
        ),
      ],
    );
  }
}
