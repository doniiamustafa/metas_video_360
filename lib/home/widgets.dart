import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?) validator,
  required String label,
  required IconData? prefixIcon,
  Function()? onTap,
  IconData? suffixIcon,
  Function()? onSuffixPressed,
  String? hint,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: const TextStyle(color: Colors.black45),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.orangeAccent,
            width: 1,
          ),
        ),
      ),
    ),
  );
}
