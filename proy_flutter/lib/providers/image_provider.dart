import 'package:flutter/material.dart';

class ImageAppProvider extends ChangeNotifier {
  String title = '';
  String category = '';
  String description = '';
  String date = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void clear() {
    title = '';
    category = '';
    description = '';
    date = '';
  }
}
