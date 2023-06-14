import 'package:flutter/material.dart'
    show IconData, Widget; //al darle show escoge solo lo que vamos a mostrar

//Con esta clase crea los campos para las rutas
class MenuOption {
  final String route; //la ruta de la vista
  final IconData icon; //el icono a mostrar
  final String name; //el nombre que voy a mostrar de la vista
  final Widget screen; //la vista que quiero mostrar

  MenuOption(
      //Se pone required y entre {} para darle la flexibilidad al usuario que ponga cualquier campo
      {required this.route,
      required this.icon,
      required this.name,
      required this.screen});
}
