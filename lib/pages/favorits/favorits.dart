import 'package:flutter/material.dart';
import '../../models/animal.dart';
import '../../widgets/animal_card.dart';
import '../details_animal/details_animal_page.dart';

class FavoritosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Padding(padding: EdgeInsets.all(16), child: Column(children: [
      Text('Favoritos', style: TextStyle(fontSize:18,fontWeight: FontWeight.bold)),
      SizedBox(height:12),
      Expanded(child: ListView(children: [ for (var a in mockAnimals) AnimalCard(animal: a, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailsAnimalPage(animal: a)))) ]))
    ])));
  }
}
