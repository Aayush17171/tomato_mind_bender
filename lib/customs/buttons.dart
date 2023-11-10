// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.deepPurple,
          ),
          shape: MaterialStateProperty.all(StadiumBorder())),
    );
  }
}
