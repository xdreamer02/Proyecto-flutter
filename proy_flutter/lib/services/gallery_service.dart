import 'package:flutter/material.dart';
import 'package:proy_flutter/models/image_model.dart';
import 'package:proy_flutter/preferences/preferences.dart';

class GalleryService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseKey = 'AIzaSyBlou9QCyI3LoflP21stc0rv-l9zPX-OVo';

  Future<String?> saveLocal(ImageModel image) async {
    List<ImageModel> newImages = Preferences.imageNews;

    newImages.add(image);

    Preferences.imageNews = newImages;

    return 'La imagen fue subido correctamente';
  }
}
