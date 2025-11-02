import 'package:flutter/material.dart';
import '../../models/animal.dart';
import '../../pages/adoption/etapa0.dart';

class DetailsAnimalPage extends StatelessWidget {
  final Animal animal;
  DetailsAnimalPage({required this.animal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(animal.nome)),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(animal.imagemUrl), 
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(animal.nome,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(
                            'Desconhecido • ${animal.idade} meses • ${animal.porte}',
                            style: TextStyle(color: Color(0xFFB3B3B3))),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text('4 Kg', style: TextStyle(color: Color(0xFFB3B3B3))),
                      SizedBox(height: 6),
                      Icon(Icons.pets)
                    ],
                  )
                ],
              ),
              SizedBox(height: 12),
              Expanded(
                child: ListView(
                  children: [
                    Text('Sobre', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet.'),
                    SizedBox(height: 12),
                    Text('Saúde', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('- Vacinação em dia\n- Vermifugado'),
                    SizedBox(height: 12),
                    Text('Contato', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('ONG ANIMAIS\nContato'),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text('Ligar'),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Etapa0Page(animal: animal),
                              ),
                            ),
                            child: Text('Quero adotar'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).cardColor,
                              foregroundColor:
                                  Theme.of(context).textTheme.bodyLarge?.color,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
