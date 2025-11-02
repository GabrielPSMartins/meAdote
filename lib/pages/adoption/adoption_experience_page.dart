import 'package:flutter/material.dart';
import '../../models/animal.dart';
import 'adoption_terms_page.dart';

class AdoptionExperiencePage extends StatelessWidget {
  final Animal animal;
  const AdoptionExperiencePage({required this.animal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Solicitação de Adoção')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(width: 56, height: 56, color: const Color(0xFF3A3A3A)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(animal.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text('Desconhecido | ${animal.age} | ${animal.size}',
                              style: const TextStyle(color: Color(0xFFB3B3B3))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView(
                  children: [
                    const Text('Experiência & Motivação', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const TextField(decoration: InputDecoration(hintText: 'Já teve animais antes?')),
                    const SizedBox(height: 8),
                    const TextField(decoration: InputDecoration(hintText: 'Possui quantos atualmente')),
                    const SizedBox(height: 8),
                    const TextField(decoration: InputDecoration(hintText: 'Experiência')),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Voltar'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => AdoptionTermsPage(animal: animal)),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context)
                                      .elevatedButtonTheme
                                      .style
                                      ?.backgroundColor
                                      ?.resolve({}) ??
                                  const Color(0xFFA0A0A0),
                              foregroundColor: Colors.black,
                            ),
                            child: const Text('Próximo: Termo'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Etapa 3 de 4',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFFB3B3B3)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
