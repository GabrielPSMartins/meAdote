import 'package:flutter/material.dart';
import '../../models/animal.dart';
import 'etapa2.dart';

class Etapa1Page extends StatelessWidget {
  final Animal animal;
  Etapa1Page({required this.animal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Solicitação de Adoção')),
      body: SafeArea(child: Padding(padding: EdgeInsets.all(16), child: Column(children: [
        Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(12)), child: Row(children: [Container(width:56,height:56,color: Color(0xFF3A3A3A)), SizedBox(width:12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(animal.nome, style: TextStyle(fontWeight: FontWeight.bold)), Text('Desconhecido | ${animal.idade} | ${animal.porte}', style: TextStyle(color: Color(0xFFB3B3B3)))]))])),
        SizedBox(height:12),
        Expanded(child: ListView(children: [
          Text('Residência', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height:8),
          TextField(decoration: InputDecoration(hintText: 'Endereço')),
          SizedBox(height:8),
          Row(children: [Expanded(child: TextField(decoration: InputDecoration(hintText: 'Cidade'))), SizedBox(width:8), Expanded(child: TextField(decoration: InputDecoration(hintText: 'Estado')))]),
          SizedBox(height:8),
          TextField(decoration: InputDecoration(hintText: 'CEP')),
          SizedBox(height:12),
          Row(children: [Expanded(child: OutlinedButton(onPressed: () => Navigator.pop(context), child: Text('Voltar'))), SizedBox(width:8), Expanded(child: ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Etapa2Page(animal: animal))), child: Text('Próximo: Experiência'), style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).elevatedButtonTheme.style?.backgroundColor?.resolve({}) ?? Color(0xFFA0A0A0), foregroundColor: Colors.black)))]),
          SizedBox(height:8),
          Text('Etapa 2 de 4', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFFB3B3B3))),
        ]))
      ]))),
    );
  }
}
