
import 'package:flutter/material.dart';

class ElevatedButton1 extends StatelessWidget {
  const ElevatedButton1({
    super.key,
    required this.text,
    required this.fontSize,
    required this.onPressed
  });
  
  final String text;
  final double fontSize;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.pink),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(20))),
                onPressed: onPressed,
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: fontSize),
                ),
              );
  }
}