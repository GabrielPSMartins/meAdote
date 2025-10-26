import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool expanded;

  const PrimaryButton({Key? key, required this.label, required this.onTap, this.expanded = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = ElevatedButton(
      onPressed: onTap,
      child: Text(label),
    );

    return expanded ? SizedBox(width: double.infinity, child: child) : child;
  }
}