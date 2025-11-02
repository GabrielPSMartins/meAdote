import 'package:flutter/material.dart';

/// Botão primário usado em telas principais e ações de confirmação.
class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool expanded;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onTap,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor:
            Theme.of(context).elevatedButtonTheme.style?.backgroundColor?.resolve({}) ??
                Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );

    return expanded ? SizedBox(width: double.infinity, child: button) : button;
  }
}
