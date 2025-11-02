import 'package:flutter/material.dart';

/// Campo de texto simples usado em telas secundárias e formulários diretos.
class TextFieldWidget extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final bool obscure;
  final TextInputType? keyboardType;

  const TextFieldWidget({
    super.key,
    required this.hint,
    this.controller,
    this.obscure = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      decoration: InputDecoration(hintText: hint),
    );
  }
}
