import 'package:flutter/material.dart';
import 'package:meadote_inicio/pages/dicas.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFFB89278);
    const bg = Color(0xFF1F1A17);
    const card = Color(0xFF121212);

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
                "Educação",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 16),
              Row(
                children: [
                  _tabButton("Educação", 0),
                  const SizedBox(width: 10),
                  _tabButton("Dicas", 1, onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const DicasPage()),
                    );
                  }),

                ],
              ),

              const SizedBox(height: 26),
              const Text(
                "Educação e Cuidados",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: card,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade700,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.menu_book,
                          color: Colors.white, size: 28),
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
                            "Conteúdo educativo para uma adoção consciente e cuidados adequados.",
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
              ),

              const SizedBox(height: 20),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _category("Preparação", Icons.home_repair_service,
                      const Color(0xFF1E88E5)),
                  _category("Alimentação", Icons.restaurant_menu,
                      const Color(0xFFE65100)),
                  _category("Saúde", Icons.health_and_safety,
                      const Color(0xFFC62828)),
                  _category("Comportamento", Icons.pets,
                      const Color(0xFF2E7D32)),
                ],
              ),
              const SizedBox(height: 26),
              const Text(
                "Artigos em Destaque",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              _articleCard(
                image: "assets/meadote/animais/Cachorro-vira-lata.jpg",
                tag: "Preparação",
                title: "Adaptação do Pet: Como Preparar o Ambiente da Nova Casa",
                time: "5 min",
              ),

              const SizedBox(height: 14),

              _articleCard(
                image: "assets/meadote/animais/Rectangle 2780.png",
                tag: "Comportamento",
                title: "Primeiros Cuidados e Socialização com Gatos",
                time: "4 min",
              ),

              const SizedBox(height: 26),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabButton(String label, int index, {VoidCallback? onTap}) {
  final bool active = selectedTab == index;
  return GestureDetector(
    onTap: onTap ?? () => setState(() => selectedTab = index),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: active ? const Color(0xFFB89278) : Colors.transparent,
        border: Border.all(color: const Color(0xFFB89278)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: active ? Colors.white : const Color(0xFFB89278),
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

  Widget _category(String text, IconData icon, Color color) {
    return Container(
      width: 150,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
        color: Colors.transparent,
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 6),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _articleCard({
    required String image,
    required String tag,
    required String title,
    required String time,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF121212),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade900,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              tag,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),

          const SizedBox(height: 6),

          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14),
          ),

          const SizedBox(height: 6),

          Row(
            children: [
              const Icon(Icons.schedule, color: Colors.white38, size: 16),
              const SizedBox(width: 4),
              Text(
                time,
                style: const TextStyle(color: Colors.white54, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
