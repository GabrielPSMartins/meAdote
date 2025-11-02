import 'package:flutter/material.dart';
import '../../models/animal.dart';
import 'adoption_residence_page.dart';

class AdoptionPersonalDataPage extends StatelessWidget {
  final Animal animal;
  const AdoptionPersonalDataPage({required this.animal});

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
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(animal.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(animal.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text(
                            'Desconhecido | ${animal.age} | ${animal.size}',
                            style: const TextStyle(color: Color(0xFFB3B3B3)),
                          ),
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
                    const Text('Dados Pessoais', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const TextField(decoration: InputDecoration(hintText: 'Nome Completo *')),
                    const SizedBox(height: 8),
                    const TextField(decoration: InputDecoration(hintText: 'CPF *')),
                    const SizedBox(height: 8),
                    const TextField(decoration: InputDecoration(hintText: 'Telefone *')),
                    const SizedBox(height: 8),
                    const TextField(decoration: InputDecoration(hintText: 'Email')),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => AdoptionResidencePage(animal: animal)),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                        backgroundColor: Theme.of(context)
                                .elevatedButtonTheme
                                .style
                                ?.backgroundColor
                                ?.resolve({}) ??
                            const Color(0xFFA0A0A0),
                        foregroundColor: Colors.black,
                      ),
                      child: const Text('Próximo: Residência'),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Etapa 1 de 4',
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
