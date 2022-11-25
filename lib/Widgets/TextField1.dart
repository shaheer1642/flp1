import 'package:flutter/material.dart';

class TextField1 extends StatelessWidget {
  const TextField1({super.key, required this.hintText, required this.controller, required this.onChanged});

  final String hintText;
  final TextEditingController controller;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.pink)),
        hintText: hintText,
      ),
      controller: controller,
      onChanged: onChanged,
    );
  }
}
