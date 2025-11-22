import 'package:flutter/material.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  String selectedType = "disponivel";

  final titleController = TextEditingController();
  final descController = TextEditingController();
  final speciesController = TextEditingController();
  final breedController = TextEditingController();
  final locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFF1F1A17);
    const card = Color(0xFF1D1D1D);
    const input = Color(0xFF121212);
    const primary = Color(0xFFB89278);

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Nova Publicação",
            style: TextStyle(color: Colors.white)),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white12),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Tipo de Publicação",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),

              _postTypeButtons(),

              const SizedBox(height: 20),

              _input("Título", "Descreva brevemente...", titleController),
              const SizedBox(height: 14),

              _input("Descrição", "Conte mais detalhes sobre o animal...",
                  descController,
                  maxLines: 3),
              const SizedBox(height: 14),

              Row(
                children: [
                  Expanded(
                    child: _input("Espécie", "Ex: Cachorro", speciesController),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child:
                        _input("Raça", "Ex: Vira-lata", breedController),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              _input("Localização", "Cidade - Estado", locationController),

              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: input,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white12),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.camera_alt,
                        color: Colors.white54, size: 32),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Escolher Fotos",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                  },
                  child: const Text(
                    "Publicar",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- INPUT PADRÃO ----------------
  Widget _input(
    String label,
    String hint,
    TextEditingController controller, {
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white70)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          maxLines: maxLines,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white38),
            filled: true,
            fillColor: const Color(0xFF121212),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white12),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          ),
        )
      ],
    );
  }

  // ---------------- BOTÕES DE TIPO ----------------
  Widget _postTypeButtons() {
    final selected = selectedType;

    Widget button(String label, String key) {
      final active = selected == key;
      return Expanded(
        child: InkWell(
          onTap: () => setState(() => selectedType = key),
          child: Container(
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: active ? const Color(0xFFB89278) : const Color(0xFF3A3A3A),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white30),
            ),
            child: Text(
              label,
              style: TextStyle(
                color: active ? Colors.white : Colors.white70,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );
    }

    return Row(
      children: [
        button("Disponível", "disponivel"),
        const SizedBox(width: 8),
        button("Perdido", "perdido"),
        const SizedBox(width: 8),
        button("Encontrado", "encontrado"),
      ],
    );
  }
}
