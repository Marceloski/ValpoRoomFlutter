import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getResidencia() async{
  List residencia = [];

  CollectionReference coleccionDB = db.collection('residencia');

  QuerySnapshot queryResidencia = await coleccionDB.get();

  for (var element in queryResidencia.docs) { 
    
    Map<String, dynamic> data = element.data()! as Map<String,dynamic>;
    Map residencial = {
      "descripcion": data["descripcion"],
      "direccion": data["direccion"],
      "valor": data["valor"],
      //"image_url": await _getImageUrl(data['image_url']),
      "uid": element.id,
    };
    residencia.add(residencial);
  }

  return residencia;
}
Future<String?> _getImageUrl(String? imagePath) async {
  if (imagePath == null) {
    return null;
  }

  Reference storageRef = FirebaseStorage.instance.ref().child(imagePath);
  String downloadURL = await storageRef.getDownloadURL();
  return downloadURL;
}