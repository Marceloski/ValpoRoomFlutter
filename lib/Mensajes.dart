import 'package:flutter/material.dart';

void main() => runApp(const Mensajes());

class Mensajes extends StatefulWidget {
  const Mensajes({super.key});

  @override
  State<Mensajes> createState() => _MensajesState();
}

class _MensajesState extends State<Mensajes> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('BIENVENIDO A VALPO ROOM'),
        ),
        body: const Center(
          child: Text('PROXIMAMENTE'),
        ),
      );
    }
}