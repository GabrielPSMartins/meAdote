import 'package:flutter/material.dart';
import '../models/animal.dart';

class CardAnimal extends StatelessWidget {
  final Animal animal;
  final VoidCallback onTap;

  const CardAnimal({required this.animal, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  animal.imagemUrl,
                  width: 84,
                  height: 84,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => 
                    Container(
                      width: 84,
                      height: 84,
                      color: const Color(0xFF2A2A2A),
                      child: const Icon(Icons.pets, color: Colors.white30, size: 36),
                    ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      animal.nome,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${animal.especie} • ${animal.raca}',
                      style: const TextStyle(color: Color(0xFFB3B3B3)),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${animal.idade} anos • ${animal.porte}',
                      style: const TextStyle(color: Color(0xFFB3B3B3)),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2A2A2A),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Ver detalhes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}
