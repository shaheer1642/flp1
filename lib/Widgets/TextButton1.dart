
import 'package:flutter/material.dart';

class TextButton1 extends StatelessWidget {
  const TextButton1({
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
    return 
              TextButton(
                style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colors.pink.shade50),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(20))),
                onPressed: onPressed,
                child: Text(
                  text,
                  style: TextStyle(color: Colors.pink, fontSize: fontSize),
                ),
              );
  }
}