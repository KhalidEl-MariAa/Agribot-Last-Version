import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.obscureText,
      this.keyboardType,
      required this.label,
      required this.prefixIcon,
      this.suffixIcon});
  final bool obscureText;
  final TextInputType? keyboardType;
  final String label;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText, //--
      keyboardType: TextInputType.visiblePassword, //--
      decoration: InputDecoration(
          //hintText: 'Enter your email or Passward',
          label: Text(label), //
          prefixIcon: Icon(prefixIcon), //
          suffixIcon: Icon(suffixIcon), //
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.black)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.teal))),
    );
  }
}
