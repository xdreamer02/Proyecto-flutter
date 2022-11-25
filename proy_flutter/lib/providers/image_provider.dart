import 'package:flutter/cupertino.dart';

class ImageProvider extends ChangeNotifier {
  String title = '';
  String category = '';
  String description = '';
  String date = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
