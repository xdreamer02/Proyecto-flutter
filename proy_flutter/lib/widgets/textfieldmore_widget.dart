import 'package:flutter/material.dart';
import 'package:proy_flutter/preferences/preferences.dart';
import 'package:proy_flutter/widgets/utils.dart';

class TextFieldWidget extends StatelessWidget {
  final int? maxLines;
  final TextInputType? keyboardType;
  final String? hintText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? initialValue;
  final Widget? suffixIcon;

  const TextFieldWidget({
    Key? key,
    this.maxLines,
    this.keyboardType,
    this.hintText,
    this.onChanged,
    this.validator,
    this.initialValue = '',
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      maxLines: maxLines ?? 1,
      onChanged: ((value) => onChanged!(value)),
      validator: (value) => validator!(value),
      keyboardType: keyboardType,
      style: TextStyle(
          color: Preferences.theme ? Colors.grey : Colors.black54,
          fontSize: 18),
      decoration: decorationField(hintText: hintText, suffixIcon: suffixIcon),
    );
  }
}
