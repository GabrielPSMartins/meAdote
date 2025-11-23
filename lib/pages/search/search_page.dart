import 'package:flutter/material.dart';
import '../../models/animal.dart';
import '../details_animal/details_animal_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Search Animals',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            
            const TextField(
              decoration: InputDecoration(hintText: 'Search'),
            ),

            const SizedBox(height: 8),

            Wrap(
              spacing: 8,
              children: const [
                Chip(label: Text('All')),
                Chip(label: Text('Dogs')),
                Chip(label: Text('Cats')),
                Chip(label: Text('Needing Help')),
              ],
            ),

            const SizedBox(height: 12),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  for (var a in mockAnimals)
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailsAnimalPage(animal: a),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Container(
                              height: 90,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: NetworkImage(a.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(a.name,
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                            Text(
                              '${a.species} | ${a.breed}',
                              style: const TextStyle(color: Color(0xFFB3B3B3)),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
