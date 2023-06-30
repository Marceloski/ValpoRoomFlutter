import 'package:flutter/material.dart';
import 'package:valporoom/MostrarResidencia.dart';
import 'package:valporoom/main.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const Home());
    case '/mostrar':
      return MaterialPageRoute(builder: (_) => const MostrarResidencia());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold(body: Text('Error: Route not found')));
  }
}
