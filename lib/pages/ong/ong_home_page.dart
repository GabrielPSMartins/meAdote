import 'package:flutter/material.dart';

class OngHomePage extends StatelessWidget {
  const OngHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1A17),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1A17),
        elevation: 0,
        title: const Text(
          "Visão da ONG",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Meus números",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                _statCard("Adoções", "12"),
                const SizedBox(width: 12),
                _statCard("Animais ativos", "8"),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                _statCard("Campanhas", "3"),
                const SizedBox(width: 12),
                _statCard("Doações", "R\$ 2.150"),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              "Ações rápidas",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            _actionButton(
              context,
              "Gerenciar Campanhas",
              Icons.campaign,
              "/ong_campaigns",
            ),

            const SizedBox(height: 12),

            _actionButton(
              context,
              "Criar Nova Campanha",
              Icons.add_circle,
              "/ong_create_campaign",
            ),

            const SizedBox(height: 12),

            _actionButton(
              context,
              "Perfil da ONG",
              Icons.account_circle,
              "/ong_profile",
            ),
          ],
        ),
      ),
    );
  }

  Widget _statCard(String title, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: const Color(0xFF27221F),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionButton(
    BuildContext context,
    String label,
    IconData icon,
    String route,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF27221F),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 26),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 18),
          ],
        ),
      ),
    );
  }
}
