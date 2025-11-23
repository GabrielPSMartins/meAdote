import 'package:flutter/material.dart';

import '../../models/adoption_request.dart';
import '../../repositories/adoption_request_repository.dart';

import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserRequestsPage extends StatefulWidget {
  const UserRequestsPage({super.key});

  @override
  State<UserRequestsPage> createState() => _UserRequestsPageState();
}

class _UserRequestsPageState extends State<UserRequestsPage> {
  final adoptionRepo = AdoptionRequestRepository();

  bool loading = true;

  List<AdoptionRequest> allRequests = [];

  String selectedFilter = "all";

  @override
  void initState() {
    super.initState();
    _loadMock();
  }

  Future<void> _loadMock() async {
    allRequests = [
      AdoptionRequest(
        id: "1",
        userId: "1",
        animalId: "10",
        organizationName: "Amigos dos Animais",
        status: "pending",
        requestedAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      AdoptionRequest(
        id: "2",
        userId: "1",
        animalId: "11",
        organizationName: "Resgate Pet",
        status: "approved",
        requestedAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
      AdoptionRequest(
        id: "3",
        userId: "1",
        animalId: "12",
        organizationName: "Amparo Animal",
        status: "pending",
        requestedAt: DateTime.now().subtract(const Duration(days: 5)),
      ),
    ];

    await Future.delayed(const Duration(milliseconds: 400));

    setState(() => loading = false);
  }

  List<AdoptionRequest> get filteredRequests {
    if (selectedFilter == "pending") {
      return allRequests.where((r) => r.status == "pending").toList();
    }
    if (selectedFilter == "approved") {
      return allRequests.where((r) => r.status == "approved").toList();
    }
    return allRequests;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1A17),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1A17),
        elevation: 0,
        title: const Text(
          "Minhas Solicitações",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(color: Colors.white),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _filters(),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: filteredRequests.length,
                    itemBuilder: (context, index) {
                      final req = filteredRequests[index];
                      return _requestCard(req);
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Widget _filters() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _filterButton("Todos", "all"),
          _filterButton("Pendentes", "pending"),
          _filterButton("Aprovados", "approved"),
        ],
      ),
    );
  }

  Widget _filterButton(String label, String value) {
    final bool active = selectedFilter == value;

    return GestureDetector(
      onTap: () {
        setState(() => selectedFilter = value);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: active ? const Color(0xFF7F4AF2) : const Color(0xFF27221F),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: active ? Colors.white : Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _requestCard(AdoptionRequest req) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF27221F),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título
          Text(
            "Solicitação #${req.id}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            "ONG: ${req.organizationName}",
            style: const TextStyle(color: Colors.white70),
          ),

          const SizedBox(height: 6),

          Text(
            "Enviado em: ${_formatDate(req.requestedAt)}",
            style: const TextStyle(color: Colors.white54),
          ),

          const SizedBox(height: 14),

          _statusChip(req.status),

          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _contactButton(Icons.email, "Email", () {}),
              _contactButton(PhosphorIcons.whatsappLogo(), "WhatsApp", () {}),
            ],
          )
        ],
      ),
    );
  }

  Widget _statusChip(String status) {
    Color color;
    String text;

    switch (status) {
      case "approved":
        color = Colors.green;
        text = "Aprovado";
        break;
      case "pending":
        color = Colors.orange;
        text = "Pendente";
        break;
      default:
        color = Colors.grey;
        text = status;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _contactButton(IconData icon, String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF1F1A17),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 18),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
}
