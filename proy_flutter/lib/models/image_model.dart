import 'dart:convert';

class ImageModel {
  final String title;
  final String description;
  final String path;
  final String? date;
  final String? favorites;

  ImageModel(
      {required this.title,
      required this.description,
      required this.path,
      this.date,
      this.favorites});

  static String encode(List<ImageModel> images) => json.encode(
      images.map<Map<String, dynamic>>((e) => ImageModel.toMap(e)).toList());

  static Map<String, dynamic> toMap(ImageModel image) => {
        'title': image.title,
        'description': image.description,
        'path': image.path,
        'date': image.date,
        'favorites': image.favorites,
      };

  static List<ImageModel> decode(String images) =>
      (json.decode(images) as List<dynamic>)
          .map<ImageModel>((e) => ImageModel.fromJson(e))
          .toList();

  factory ImageModel.fromJson(Map<String, dynamic> jsonData) {
    return ImageModel(
        title: jsonData['title'],
        description: jsonData['description'],
        date: jsonData['date'],
        favorites: jsonData['favorites'],
        path: jsonData['path']);
  }
}
