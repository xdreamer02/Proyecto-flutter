import 'dart:io';
import 'package:flutter/material.dart';

class ImagePickerWidget extends StatelessWidget {
  final File? image;
  final Function()? onPressed;
  const ImagePickerWidget({super.key, this.image, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.file(
          image!,
          width: 400,
          height: 400,
          fit: BoxFit.cover,
        ),
        Positioned(
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: const Color.fromARGB(131, 255, 255, 255),
                child: IconButton(
                  color: Colors.black45,
                  icon: const Icon(Icons.close),
                  onPressed: () => onPressed!(),
                ),
              ),
            ))
      ],
    );
  }
}
