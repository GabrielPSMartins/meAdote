import 'package:flutter/material.dart';

class HomeFilterBar extends StatelessWidget {
  final String selected;
  final Function(String) onChanged;

  const HomeFilterBar({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  Widget _chip(String label, String value) {
    final active = selected == value;

    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: active ? const Color(0xFFB89278) : Colors.white12,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: active ? Colors.white : Colors.white70,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _chip("Todos", "todos"),
        const SizedBox(width: 10),
        _chip("Cachorros", "cachorro"),
        const SizedBox(width: 10),
        _chip("Gatos", "gato"),
        const SizedBox(width: 10),
        _chip("Outros", "outros"),
      ],
    );
  }
}
