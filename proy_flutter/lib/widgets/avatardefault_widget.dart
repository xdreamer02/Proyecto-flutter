import 'package:flutter/material.dart';

class AvatarDefaultWidget extends StatelessWidget {
  const AvatarDefaultWidget({
    Key? key,
    required this.initialCharacters,
    required this.radius,
  }) : super(key: key);

  final String initialCharacters;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: radius,
        child: Text(
          initialCharacters,
          style: const TextStyle(fontSize: 40),
        ));
  }
}
