import 'package:flutter/material.dart';

class OngCreateCampaignPage extends StatefulWidget {
  const OngCreateCampaignPage({super.key});

  @override
  State<OngCreateCampaignPage> createState() => _OngCreateCampaignPageState();
}

class _OngCreateCampaignPageState extends State<OngCreateCampaignPage> {
  final title = TextEditingController();
  final goal = TextEditingController();
  final description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1A17),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1A17),
        elevation: 0,
        title: const Text(
          "Criar Campanha",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            _inputField("Título", title),
            const SizedBox(height: 14),
            _inputField("Meta (ex: 1500)", goal, keyboard: TextInputType.number),
            const SizedBox(height: 14),
            _inputField("Descrição", description, maxLines: 6),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7F4AF2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Campanha criada (mock)."),
                    ),
                  );

                  Navigator.pop(context);
                },
                child: const Text(
                  "Criar Campanha",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField(
    String label,
    TextEditingController controller, {
    TextInputType keyboard = TextInputType.text,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          keyboardType: keyboard,
          maxLines: maxLines,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF27221F),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
