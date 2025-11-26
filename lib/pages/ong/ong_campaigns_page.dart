import 'package:flutter/material.dart';

class OngCampaignsPage extends StatelessWidget {
  const OngCampaignsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> mockCampaigns = [
      {
        "title": "Ração para resgatados",
        "raised": 850.0,
        "goal": 1500.0,
      },
      {
        "title": "Campanha de castração",
        "raised": 3120.0,
        "goal": 5000.0,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF1F1A17),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1A17),
        elevation: 0,
        title: const Text(
          "Campanhas",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF7F4AF2),
        onPressed: () => Navigator.pushNamed(context, "/ong_create_campaign"),
        child: const Icon(Icons.add, color: Colors.white),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: mockCampaigns.length,
        itemBuilder: (context, index) {
          final c = mockCampaigns[index];

          final double raised = c["raised"];
          final double goal = c["goal"];

          final double percent = raised / goal;
          final String percentText = (percent * 100).toStringAsFixed(0);

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF27221F),
              borderRadius: BorderRadius.circular(16),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  c["title"],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                LinearProgressIndicator(
                  value: percent,
                  color: const Color(0xFF7F4AF2),
                  backgroundColor: Colors.white12,
                ),

                const SizedBox(height: 8),

                Text(
                  "Arrecadado: R\$ ${raised.toStringAsFixed(0)} de ${goal.toStringAsFixed(0)}",
                  style: const TextStyle(color: Colors.white70),
                ),

                Text(
                  "$percentText% concluído",
                  style: const TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
