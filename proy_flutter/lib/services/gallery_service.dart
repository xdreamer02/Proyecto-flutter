import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:proy_flutter/models/image_model.dart';
import 'package:proy_flutter/preferences/preferences.dart';

class GalleryService extends ChangeNotifier {
  Future<String?> saveLocal(ImageModel image) async {
    List<ImageModel> newImages = Preferences.imageNews;

    newImages.add(image);

    Preferences.imageNews = newImages;

    return 'La imagen fue subido correctamente';
  }

  Future<String?> save(
      {required ImageModel imageModel, required String email}) async {
    final db = FirebaseFirestore.instance;

    final image = <String, dynamic>{
      "title": imageModel.title,
      "description": imageModel.description,
      "path": imageModel.path,
      "favorites": imageModel.favorites,
      "date": imageModel.date,
      "email": email,
    };

    final doc = await db.collection("images").add(image);

    final fullPath = await _saveImage(imageModel.path, doc.id);

    image["path"] = fullPath;

    db.collection('images').doc(doc.id).update(image);

    print('image fullpath: $fullPath');

    return doc.id;
  }

  Future<String?> _saveImage(String filePath, String id) async {
    final file = File(filePath);

    final metadata = SettableMetadata(contentType: 'image/jpeg');

    final storageRef = FirebaseStorage.instance.ref();

    final uploadTask =
        await storageRef.child('images/$id.jpg').putFile(file, metadata);

    final fullPath = await uploadTask.ref.getDownloadURL();

    return fullPath;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> read() async {
    final db = FirebaseFirestore.instance;

    final images = db.collection('images').get();

    return images;
  }
}
