import 'package:flutter/material.dart';
import 'package:rentmylove/text_style.dart';

class TextFieldWidget extends StatefulWidget {
  final double width;
  final TextInputType inputType;

  const TextFieldWidget({required this.width, required this.inputType});

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: TextField(
        style: RmlTextStyle.normalText,
        keyboardType: widget.inputType,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        ),
      ),
    );
  }
}
