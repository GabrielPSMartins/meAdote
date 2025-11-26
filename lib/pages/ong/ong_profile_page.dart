import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/ong.dart';
import '../../repositories/ong_repository.dart';

class OngProfilePage extends StatefulWidget {
  const OngProfilePage({super.key});

  @override
  State<OngProfilePage> createState() => _OngProfilePageState();
}

class _OngProfilePageState extends State<OngProfilePage> {
  Ong? ong;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadOngData();
  }

  Future<void> _loadOngData() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('ong_id');

    if (id == null) {
      setState(() => loading = false);
      return;
    }

    final repo = OngRepository();
    final data = await repo.getOngById(id);

    setState(() {
      ong = data;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1A17),

      body: loading
          ? const Center(child: CircularProgressIndicator(color: Colors.white))
          : ong == null
              ? const Center(
                  child: Text("Erro ao carregar dados.", style: TextStyle(color: Colors.white)),
                )
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _header(),
                        const SizedBox(height: 20),
                        _statsCard(),
                        const SizedBox(height: 30),

                        _sectionTitle("AÇÕES RÁPIDAS"),
                        _actionTile(Icons.dashboard, "Dashboard", onTap: () {}),

                        _actionTile(Icons.message, "Mensagens",
                            badge: "4", onTap: () {}),

                        const SizedBox(height: 20),

                        _sectionTitle("RECURSOS DO APP"),
                        _actionTile(Icons.school, "Dicas e Educação", onTap: () {}),
                        _actionTile(Icons.notifications, "Notificações", onTap: () {}),
                        _actionTile(Icons.share, "Compartilhar App", onTap: () {}),

                        const SizedBox(height: 20),

                        _sectionTitle("CONFIGURAÇÕES"),
                        _darkModeToggle(),
                      ],
                    ),
                  ),
                ),
    );
  }

  Widget _header() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF0518E), Color(0xFFFE8C00)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          // FOTO DA ONG
          CircleAvatar(
            radius: 45,
            backgroundImage:
                (ong!.imageUrl.isNotEmpty) ? NetworkImage(ong!.imageUrl) : null,
            backgroundColor: Colors.white24,
            child: ong!.imageUrl.isEmpty
                ? const Icon(Icons.pets, color: Colors.white, size: 40)
                : null,
          ),
          const SizedBox(width: 18),

          // INFOS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ong!.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  ong!.email,
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.white70, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      ong!.city.isEmpty ? "Local não informado" : ong!.city,
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                )
              ],
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit, color: Colors.white),
          ),
        ],
      ),
    );
  }


  Widget _statsCard() {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * .88,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: const Color(0xFF27221F),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _statItem(Icons.pets, 38, "Animais"),
            _statItem(Icons.favorite, 29, "Adoções"),
            _statItem(Icons.campaign, 24, "Publicações"),
            _statItem(Icons.bar_chart, 67, "Respostas"),
          ],
        ),
      ),
    );
  }

  Widget _statItem(IconData icon, int value, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 6),
        Text(
          "$value",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }

  Widget _sectionTitle(String t) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 6),
      child: Text(
        t,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _actionTile(IconData icon, String title,
      {VoidCallback? onTap, String? badge}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xFF27221F),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.white, size: 26),
              const SizedBox(width: 18),

              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              if (badge != null)
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    badge,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),

              const SizedBox(width: 10),
              const Icon(Icons.arrow_forward_ios,
                  color: Colors.white54, size: 18),
            ],
          ),
        ),
      ),
    );
  }


  Widget _darkModeToggle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: const Color(0xFF27221F),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            const Icon(Icons.dark_mode, color: Colors.white, size: 26),
            const SizedBox(width: 18),
            const Expanded(
              child: Text(
                "Modo Escuro",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Switch(
              value: true,
              onChanged: (_) {},
              activeColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
