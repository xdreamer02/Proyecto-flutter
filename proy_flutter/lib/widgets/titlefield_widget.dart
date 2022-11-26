import 'package:flutter/material.dart';

class TitleFieldWidget extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const TitleFieldWidget({
    Key? key,
    this.title = '',
    this.subTitle = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!,
          style: const TextStyle(fontSize: 18, color: Colors.purple),
        ),
        Text(subTitle!)
      ],
    );
  }
}
