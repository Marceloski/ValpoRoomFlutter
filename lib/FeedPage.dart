import 'package:flutter/material.dart';
import '../CRUD/CRUD.dart';
import 'Mensajes.dart';


class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  void _mostrarResidencia(Map<String, dynamic> arguments) {
      Navigator.pushNamed(
        context,
        '/mostrar',
        arguments: arguments,
      );
    }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('BIENVENIDO A VALPO ROOM'),
        ),
        body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/ascensor.jpg', // Ruta de la imagen, asegúrate de tenerla en la carpeta 'assets'
              width: 100,
              height: 100,
              
            ),
            
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Mensajes()),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 75,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue.withOpacity(0.5),
                      ),
                      child: const Icon(
                        Icons.message,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 0),
                    const Text(
                      'Mensajes',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                
              ),
            ),
          ),   
          Positioned(
            top: 0,
            right: 0,
            child: SizedBox(
              width: 100,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.exit_to_app, size: 50),
                    onPressed: () {
                      // Lógica para cerrar sesión
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Cerrar sesión',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(top: 100),
              child: FutureBuilder(                          
                future: getResidencia(),              
                builder: ((context,  snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Error al cargar los datos');
                  }
                
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }        
                
                  return ListView.builder(
                    
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      final document = snapshot.data?[index];
                      final descripcion = document['descripcion'];
                      final direccion = document['direccion'];
                      final valor = document['valor'];
                  
                      return ListTile(                        
                        title: Text(descripcion),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Dirección: $direccion'),
                            Text('Valor: \$$valor'),
                          ],
                        ),
                        onTap: (() async{
                          print(document['descripcion']);
                          print(document['direccion']);
                          print(document['valor']);
                          await Navigator.pushNamed(
                            context,
                            "/mostrar",
                            arguments: {
                            "descripcion": document['descripcion'],
                            "direccion": document['direccion'],
                            "valor": document['valor'],
                            //"uid": document['uid'],
                            },
                          );
                          setState(() {
                            
                          });
                        }),
                      );
                    },
                  );
                }),
                ),
            ) 
            
          ),
        ],
      ),
      );
  }
  
}


