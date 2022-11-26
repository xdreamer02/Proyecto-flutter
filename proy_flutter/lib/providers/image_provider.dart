import 'package:flutter/material.dart';
import 'package:proy_flutter/models/image_model.dart';

class ImageAppProvider extends ChangeNotifier {
  String title = '';
  String category = '';
  String description = '';
  String date = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<ImageModel> images = [];

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
