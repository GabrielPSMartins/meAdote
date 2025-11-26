import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';   

import '../../models/user.dart';
import '../../models/animal.dart';
import '../../models/favorite.dart';
import '../../models/adoption_request.dart';

import '../../repositories/user_repository.dart';
import '../../repositories/favorite_repository.dart';
import '../../repositories/adoption_request_repository.dart';
import '../../repositories/pet_repository.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final userRepo = UserRepository();
  final favoriteRepo = FavoriteRepository();
  final adoptionRepo = AdoptionRequestRepository();
  final petRepo = PetRepository();

  bool loading = true;

  User? user;
  List<Favorite> favorites = [];
  List<AdoptionRequest> adoptionRequests = [];
  List<Animal> adoptedPets = [];
  List<Animal> helpedPets = [];

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }


  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('email');

    if (savedEmail == null) {
      setState(() {
        loading = false;
        user = User(id: 0, name: "Usuário", email: "email@exemplo.com", password: "");
      });
      return;
    }

    // Busca usuário real no banco
    user = await userRepo.getByEmail(savedEmail);

    // MOCKS continuam só para contadores
    favorites = [
      Favorite(id: "1", userId: "1", animalId: "10"),
      Favorite(id: "2", userId: "1", animalId: "11"),
    ];

    adoptionRequests = [
      AdoptionRequest(
        id: "1",
        userId: "1",
        animalId: "10",
        organizationName: "Resgate Pet",
        status: "pending",
        requestedAt: DateTime.now(),
      ),
    ];

    adoptedPets = [];
    helpedPets = [];

    await Future.delayed(const Duration(milliseconds: 300));

    setState(() {
      loading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1A17),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(color: Colors.white),
            )
          : SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _header(),
                    const SizedBox(height: 20),
                    _statsCard(context),
                    const SizedBox(height: 20),
                    _sectionTitle("AÇÕES RÁPIDAS"),
                    _actionTile(
                      icon: Icons.favorite,
                      text: "Meus Favoritos",
                      subtitle: "${favorites.length} animais salvos",
                      onTap: () {},
                    ),
                    _actionTile(
                      icon: Icons.list_alt,
                      text: "Solicitações de Adoção",
                      subtitle:
                          "${adoptionRequests.length} solicitações registradas",
                      onTap: () {
                        Navigator.pushNamed(context, '/user_requests');
                      },
                    ),
                    _actionTile(
                      icon: Icons.volunteer_activism,
                      text: "Apoiar agora",
                      subtitle: "Doe, ajude ONGs",
                      onTap: () {},
                    ),
                    const SizedBox(height: 20),
                    _sectionTitle("RECURSOS DO APP"),
                    _actionTile(
                      icon: Icons.school,
                      text: "Dicas e Educação",
                      subtitle: "Guarda responsável",
                      onTap: () {},
                    ),
                    _actionTile(
                      icon: Icons.notifications,
                      text: "Notificações",
                      subtitle: "Configure alertas",
                      onTap: () {},
                    ),
                    _actionTile(
                      icon: Icons.share,
                      text: "Compartilhar App",
                      subtitle: "Ajude a divulgar",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _header() {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF7F4AF2),
            Color(0xFF4A2A86),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.black.withOpacity(0.2),
            child: Text(
              user!.name.substring(0, 1).toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user!.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  user!.email,
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on,
                        color: Colors.white70, size: 16),
                    const SizedBox(width: 4),
                    const Text(
                      "Itajubá - MG",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
  },
  icon: const Icon(Icons.logout, color: Colors.white),
),
        ],
      ),
    );
  }

  Widget _statsCard(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * .88,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF27221F),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _statItem(Icons.favorite, favorites.length, "Favoritos"),
            _statItem(Icons.assignment, adoptionRequests.length, "Solicitações"),
            _statItem(Icons.pets, adoptedPets.length, "Adotados"),
            _statItem(Icons.handshake, helpedPets.length, "Ajudados"),
          ],
        ),
      ),
    );
  }

  Widget _statItem(IconData icon, int value, String title) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 26),
        const SizedBox(height: 4),
        Text(
          "$value",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: const TextStyle(color: Colors.white60),
        ),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 6),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _actionTile({
    required IconData icon,
    required String text,
    required String subtitle,
    required VoidCallback onTap,
  }) {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios,
                  color: Colors.white54, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
