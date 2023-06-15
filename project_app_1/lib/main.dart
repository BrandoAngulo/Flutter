import 'package:flutter/material.dart';

import 'package:project_app_1/router/app_routes.dart';
import 'package:project_app_1/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        //se independiza initialRoute a app_routes
        initialRoute: AppRoutes.initialRoute,
        //se independiza routes a app_routes
        routes: AppRoutes.getAppRoutes(),
        //se llama el ongenerate de app_routes que se independizo
        onGenerateRoute: AppRoutes.onGenerateRote,
        //tema global o color global
        theme: AppTheme.themeLight  
      );
  }
}
