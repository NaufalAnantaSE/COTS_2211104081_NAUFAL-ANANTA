import 'package:flutter/material.dart';

Widget customTextField({
  required String hintText,
  required IconData prefixIcon,
  bool obscureText = false,
  required Function(String) onChanged,
}) {
  return TextField(
    obscureText: obscureText,
    onChanged: onChanged,
    decoration: InputDecoration(
      prefixIcon: Icon(prefixIcon),
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
