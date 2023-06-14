import 'package:flutter/material.dart';
import 'package:project_app_1/models/menu_option.dart';
import 'package:project_app_1/screens/screens.dart';

class AppRoutes {
  static final menuOption = <MenuOption>[
    MenuOption(
        route: 'home',
        icon: Icons.home_outlined,
        name: 'Home Screen',
        screen: const HomeScreen()),
    MenuOption(
        route: 'listView1',
        icon: Icons.local_play,
        name: 'vista 1',
        screen: const ListView1Screen()),
    MenuOption(
        route: 'listView12',
        icon: Icons.playlist_play_rounded,
        name: 'vista 2',
        screen: const ListView2Screen()),
    MenuOption(
        route: 'cards',
        icon: Icons.home_outlined,
        name: 'Home Screen',
        screen: const CardScreen()),
    MenuOption(
        route: 'alerts',
        icon: Icons.home_outlined,
        name: 'Home Screen',
        screen: const AlertScreen()),
  ];

  static const initialRoute = 'home';
  static Map<String, Widget Function(BuildContext)> routes = {
    'home': (BuildContext context) => const HomeScreen(),
    'listView1': (BuildContext context) => const ListView1Screen(),
    'listView2': (BuildContext context) => const ListView2Screen(),
    'cards': (BuildContext context) => const CardScreen(),
    'alerts': (BuildContext context) => const AlertScreen(),
  };

//la funcion ongenerate nos pone una ruta opcional cuando no existe dicha ruta
  static Route<dynamic> onGenerateRote(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }
}
