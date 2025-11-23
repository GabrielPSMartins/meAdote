import 'package:flutter/material.dart';

class OnboardingInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const OnboardingInfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2420),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Color(0xFF3C342F)),
      ),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFFB89278), size: 26),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFFEFE3DB),
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFFAD9F94),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
