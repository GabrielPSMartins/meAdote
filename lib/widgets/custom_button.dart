import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;

  const CustomButton({required this.label, this.onPressed, this.icon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: icon != null ? Icon(icon, size: 18) : SizedBox.shrink(),
      label: Text(label, style: TextStyle(fontWeight: FontWeight.w600)),
      onPressed: onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 48),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}