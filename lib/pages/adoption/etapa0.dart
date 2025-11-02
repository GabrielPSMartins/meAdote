import 'package:flutter/material.dart';
import '../../models/animal.dart';
import 'etapa1.dart';

class Etapa0Page extends StatelessWidget {
  final Animal animal;
  Etapa0Page({required this.animal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Solicitação de Adoção')),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
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
                          image: NetworkImage(animal.imagemUrl), // ou AssetImage(animal.imagem)
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(animal.nome,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(
                            'Desconhecido | ${animal.idade} | ${animal.porte}',
                            style: TextStyle(color: Color(0xFFB3B3B3)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12),
              Expanded(
                child: ListView(
                  children: [
                    Text('Dados Pessoais',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    TextField(decoration: InputDecoration(hintText: 'Nome Completo *')),
                    SizedBox(height: 8),
                    TextField(decoration: InputDecoration(hintText: 'CPF *')),
                    SizedBox(height: 8),
                    TextField(decoration: InputDecoration(hintText: 'Telefone *')),
                    SizedBox(height: 8),
                    TextField(decoration: InputDecoration(hintText: 'Email')),
                    SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Etapa1Page(animal: animal)),
                      ),
                      child: Text('Próximo: Residência'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 48),
                        backgroundColor: Theme.of(context)
                                .elevatedButtonTheme
                                .style
                                ?.backgroundColor
                                ?.resolve({}) ??
                            Color(0xFFA0A0A0),
                        foregroundColor: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Etapa 1 de 4',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFFB3B3B3)),
                    ),
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
