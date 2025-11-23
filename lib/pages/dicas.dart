import 'package:flutter/material.dart';

class DicasPage extends StatelessWidget {
  const DicasPage({super.key});

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFF1F1A17);
    const card = Color(0xFF121212);
    const primary = Color(0xFFB89278);

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 16),
              const Text(
                "Dicas",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  _tab("Educação", false, () => Navigator.pop(context)),
                  const SizedBox(width: 10),
                  _tab("Dicas", true, () {}),
                ],
              ),

              const SizedBox(height: 26),

              _highlightCard(),

              const SizedBox(height: 26),

              _tipItem(
                icon: Icons.shield,
                color: Colors.blue,
                title: "Guarda Responsável",
                badge: "Essencial",
              ),

              _tipItem(
                icon: Icons.pets,
                color: Colors.brown,
                title: "Adoção Consciente",
                badge: "Conscientização",
              ),

              _tipItem(
                icon: Icons.warning,
                color: Colors.green,
                title: "Prevenção do Abandono",
                badge: "Microchip",
              ),

              _tipItem(
                icon: Icons.campaign,
                color: Colors.lightBlue,
                title: "Tendências e Campanhas",
                badge: "Inovação",
              ),

              _tipItem(
                icon: Icons.people,
                color: Colors.yellow.shade700,
                title: "Geração Z e Adoção",
                badge: "Público",
              ),

              _tipItem(
                icon: Icons.favorite,
                color: Colors.red,
                title: "Saúde e Bem-estar",
                badge: "Cuidados",
              ),

              const SizedBox(height: 26),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tab(String text, bool active, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: active ? const Color(0xFFB89278) : Colors.transparent,
          border: Border.all(color: const Color(0xFFB89278)),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: active ? Colors.white : const Color(0xFFB89278),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _highlightCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF121212),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.amber.shade700),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.amber.shade700,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.lightbulb, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Aprenda mais sobre Adoção Responsável",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "Guias e dicas para preparar você e seu pet",
                  style: TextStyle(
                    color: Colors.white70,
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

  Widget _tipItem({
    required IconData icon,
    required Color color,
    required String title,
    required String badge,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF121212),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              badge,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          const SizedBox(width: 6),
          const Icon(Icons.chevron_right, color: Colors.white38),
        ],
      ),
    );
  }
}
