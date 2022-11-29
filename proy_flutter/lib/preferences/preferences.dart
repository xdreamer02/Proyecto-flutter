import 'package:flutter/cupertino.dart';
import 'package:proy_flutter/models/image_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static bool _theme = false;

  static String _newImages = '[]';

  static String _email = '';
  static String _name = 'User';
  static String _country = 'Faltan datos';
  static String _profession = 'Faltan datos';
  static String _image = '';

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

  // email

  static String get email {
    return _prefs.getString('email') ?? _email;
  }

  static set email(String email) {
    _email = email;
    _prefs.setString('email', email);
  }

  // name
  static String get name {
    return _prefs.getString('name') ?? _name;
  }

  static set name(String name) {
    _name = name;
    _prefs.setString('name', name);
  }

  // profession
  static String get profession {
    return _prefs.getString('profession') ?? _profession;
  }

  static set profession(String profession) {
    _profession = profession;
    _prefs.setString('profession', profession);
  }

  // country
  static String get country {
    return _prefs.getString('country') ?? _country;
  }

  static set country(String country) {
    _country = country;
    _prefs.setString('country', country);
  }

  // image
  static String get image {
    return _prefs.getString('image') ?? _image;
  }

  static set image(String image) {
    _image = image;
    _prefs.setString('image', image);
  }

  static String get emailShort {
    final emailLarge = email;

    final indexArroba = emailLarge.indexOf('@');

    final short = '@${emailLarge.substring(0, indexArroba)}';

    return short;
  }

  static String get initialCharacters {
    return email.substring(0, 2).toUpperCase();
  }

  static void logout() {
    name = 'User';
    profession = '';
    image = '';
    country = '';
  }
}
