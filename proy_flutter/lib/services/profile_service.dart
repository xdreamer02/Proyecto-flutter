import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:proy_flutter/preferences/preferences.dart';

class ProfileService extends ChangeNotifier {
  Future<String?> edit(
      {required String email,
      String? name,
      String? image,
      String? profession,
      String? country}) async {
    final db = FirebaseFirestore.instance;

    final profile = <String, dynamic>{
      "name": name,
      "image": image,
      "profession": profession,
      "country": country,
    };

    try {
      final docRef = await db.collection('profiles').doc(email);

      final doc = await docRef.get();

      if (doc.exists) {
        final docUpdate = await docRef.update(profile);

        return 'Su perfil fue actualizado';
      } else {
        final docSet = await docRef.set(profile);

        return 'Su perfil fue actualizado';
      }
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>?> loadData({required String email}) async {
    final db = FirebaseFirestore.instance;

    try {
      final docRef = await db.collection('profiles').doc(email);

      final doc = await docRef.get();

      return doc.exists ? doc.data() : null;
    } catch (e) {
      return null;
    }
  }
}
