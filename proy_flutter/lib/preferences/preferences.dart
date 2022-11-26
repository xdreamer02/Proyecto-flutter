import 'package:flutter/cupertino.dart';
import 'package:proy_flutter/models/image_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static bool _theme = false;

  static String _newImages = '[]';

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // theme
  static bool get theme {
    return _prefs.getBool('theme') ?? _theme;
  }

  static set theme(bool theme) {
    _theme = theme;
    _prefs.setBool('theme', theme);
  }

  // theme
  static List<ImageModel> get imageNews {
    String imagesString = _prefs.getString('imageNews') ?? _newImages;

    List<ImageModel> images = ImageModel.decode(imagesString);

    return images;
  }

  static set imageNews(List<ImageModel> imageNews) {
    String encodedData = ImageModel.encode(imageNews);

    _newImages = encodedData;

    _prefs.setString('imageNews', encodedData);
  }
}
