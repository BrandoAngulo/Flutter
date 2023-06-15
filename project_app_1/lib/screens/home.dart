import 'package:flutter/material.dart';
import 'package:project_app_1/router/app_routes.dart';
import 'package:project_app_1/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuRoutes = AppRoutes.menuOption;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.separated(
        itemCount: menuRoutes.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) => ListTile(
          title: Text(menuRoutes[index].name),
          trailing: Icon(menuRoutes[index].icon, color: AppTheme.primary,),
          onTap: () {
            //para navegar a la otra vista es el context y el nombre de la ruta que asignamos en el main
            Navigator.pushNamed(context, menuRoutes[index].route);
          },
        ),
      ),
    );
  }
}
