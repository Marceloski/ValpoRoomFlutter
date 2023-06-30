import 'package:flutter/material.dart';

void main() => runApp(const MostrarResidencia());

class MostrarResidencia extends StatelessWidget {
  const MostrarResidencia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DOCUMENTO EN ESPECIFICO'),
        ),
        body: const Center(
          child: Text('ACA DEBERIAN APARECER UN DOCUMENTO EN ESPECIFICO'),
        ),
      ),
    );
  }
}