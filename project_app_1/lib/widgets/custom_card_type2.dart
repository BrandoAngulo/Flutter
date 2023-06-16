import 'package:flutter/material.dart';
import 'package:project_app_1/theme/app_theme.dart';

class CustomCardType2 extends StatelessWidget {
  //se crean las variables para darle argumentos al card cuando la llamamos en el card_screen
  final String imageUrl;
  final String? cardName;
  const CustomCardType2({super.key, required this.imageUrl, this.cardName});

  @override
  Widget build(BuildContext context) {
    return Card(
      //Forzar al card que muestre las puntas redondeadas
      clipBehavior: Clip.antiAlias,
      //darle mas tamaño a los bordes
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      //elevacion o sombra
      elevation: 10,
      //color de la sombra y que el color de la sombra no sea tan fuerte
      shadowColor: AppTheme.primary.withOpacity(0.5),
      child: Column(children: [
        //fadeInImage es un widget para que cargue mas rapido una imagen
        FadeInImage(
          image: NetworkImage(imageUrl),
          placeholder: const AssetImage('assets/images/giphy.gif'),
          //quitar bug de salto de imagen cuando tiene un cargando
          width: double.infinity,
          height: 230,
          //ajustar la imagen en todo el tamaño posible
          fit: BoxFit.cover,
          //tiempo en hacer el fadeinDuration osea q cargue mas rapido al entrar al modulo
          fadeInDuration: const Duration(milliseconds: 200),
        ),

        //se realiza esta condicion por si la variable no nada q no muestre ningun titulo
        if(cardName != null)
        //la idea de envolver el text() en un container es para darle estilos
        Container(
          //alinear del centro al final
          alignment: AlignmentDirectional.centerEnd,
          padding: const EdgeInsets.all(15),
          //?? significa q si no existe ningun nombre que me ponga por defecto nombre card
          child: Text(cardName ?? 'Nombre card'),
        ),
      ]),
    );
  }
}
