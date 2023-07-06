import 'package:flutter/material.dart';
import 'package:project_app_1/theme/app_theme.dart';

class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  final List<int> idImages = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          (scrollController.position.maxScrollExtent)) {
        //addId5();
        FetchData();
      }
    });
    super.initState();
  }

  Future FetchData() async{
    if (isLoading) return; 
      isLoading = true;
      setState(() {});

      await Future.delayed(const Duration(seconds: 3));
      addId5();
      isLoading = false;
      setState(() {});

  }

  void addId5() {
    final lastId = idImages.last;
    idImages.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //con esta funcion nos da las propiedades para saber el ancho y el alto de la pantalla
    final size = MediaQuery.of(context).size;
    return Scaffold(
      //el media query sirve para remover el padding de siertos quipos que muestran el padding blanco o gris en un
      //listViewBuilder
      body: MediaQuery.removePadding(
        context: context,
        //removio el padding de arriba para aquellos celulares q tengan ese problema
        removeTop: true,
        child: Stack(
          children: [
            ListView.builder(
              controller: scrollController,
              //muestra el scroll cuando llega alo ultimo o al inicio que puede extenderlo o como si halara la pantalla
              physics: const BouncingScrollPhysics(),
              //es la cantidad de items que va a contener
              itemCount: idImages.length,
              itemBuilder: (BuildContext context, int index) {
                return FadeInImage(
                    //Toma todo el ancho disponible
                    width: double.infinity,
                    height: 300,
                    //toma todo el espacio disponible
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/images/giphy.gif'),
                    image: NetworkImage(
                        'https://picsum.photos/500/300?image=${idImages[index]}'));
              },
            ),
            Positioned(bottom: 10,
            //usamos la variable q le estamos reutilizando la funcion size de mediaquery
            right: size.width / 2 - 30,
            child: const _loadingIcon(),
            )
          ],
        ),
      ),
    );
  }
}

class _loadingIcon extends StatelessWidget {
  const _loadingIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: 50,
      height: 50,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        shape: BoxShape.circle,
      ),
      child: const CircularProgressIndicator(color: AppTheme.primary),
    );
  }
}
