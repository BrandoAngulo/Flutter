import 'package:flutter/material.dart';
import 'package:project_app_1/models/menu_option.dart';
import 'package:project_app_1/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOption = <MenuOption>[
    MenuOption(route: 'home',icon: Icons.home_outlined,name: 'Home Screen',screen: const HomeScreen()),
    MenuOption(route: 'listView1',icon: Icons.local_play,name: 'vista 1',screen: const ListView1Screen()),
    MenuOption(route: 'listView2',icon: Icons.playlist_play_rounded,name: 'vista 2',screen: const ListView2Screen()),
    MenuOption(route: 'cards',icon: Icons.add_card_sharp,name: 'cartas',screen: const CardScreen()),
    MenuOption(route: 'alerts',icon: Icons.notification_important,name: 'alertas',screen: const AlertScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final option in menuOption) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

/*   
  static Map<String, Widget Function(BuildContext)> routes = {
    'home': (BuildContext context) => const HomeScreen(),
    'listView1': (BuildContext context) => const ListView1Screen(),
    'listView2': (BuildContext context) => const ListView2Screen(),
    'cards': (BuildContext context) => const CardScreen(),
    'alerts': (BuildContext context) => const AlertScreen(),
  }; */

//la funcion ongenerate nos pone una ruta opcional cuando no existe dicha ruta
  static Route<dynamic> onGenerateRote(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }
}
