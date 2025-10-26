import 'package:flutter/material.dart';
import '../../models/animal.dart';
import '../../widgets/card_animal.dart';
import '../details_animal/details_animal.dart';

class BeginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('MeAdote', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Row(children: [Icon(Icons.search), SizedBox(width:8), Icon(Icons.notifications)]),
        ]),
        SizedBox(height: 12),
        Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(12)), child: Row(children: [
          Expanded(child: TextField(decoration: InputDecoration.collapsed(hintText: 'Encontre um amigo'))),
          ElevatedButton(onPressed: (){}, child: Text('Favoritar'), style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).cardColor, foregroundColor: Theme.of(context).textTheme.bodyLarge?.color)),
          SizedBox(width:8),
          CircleAvatar(radius:18, backgroundColor: Color(0xFF3A3A3A)),
        ])),
        SizedBox(height:12),
        Expanded(child: ListView(
          children: [
            Text('Campanha Destaque', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height:8),
            Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(12)), child: Column(children: [
              Row(children: [Icon(Icons.pets, size:36), SizedBox(width:8), Expanded(child: Text('Animais que precisam de cuidados especiais'))]),
              SizedBox(height:8),
              Align(alignment: Alignment.centerRight, child: ElevatedButton(onPressed: (){}, child: Text('Saiba mais'), style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).cardColor, foregroundColor: Theme.of(context).textTheme.bodyLarge?.color)))
            ])),
            SizedBox(height:12),
            Text('Animais Destaque', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height:8),
            for (var a in mockAnimals) CardAnimal(animal: a, onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => DetailsAnimalPage(animal: a)));
            }),
          ],
        ))
      ]),
    ));
  }
}
