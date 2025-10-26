import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';

class RegisterOrganizationScreen extends StatelessWidget {
  const RegisterOrganizationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastrar Organização')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Text('Dados da Organização', style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: 8),
              TextField(decoration: InputDecoration(hintText: 'Nome da Organização')),
              SizedBox(height: 8),
              TextField(decoration: InputDecoration(hintText: 'Site/Instagram (opcional)')),
              SizedBox(height: 12),
              Text('Dados Usuário', style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: 8),
              TextField(decoration: InputDecoration(hintText: 'Nome Completo')),
              SizedBox(height: 8),
              TextField(decoration: InputDecoration(hintText: 'Email')),
              SizedBox(height: 8),
              TextField(obscureText: true, decoration: InputDecoration(hintText: 'Senha')),
              SizedBox(height: 8),
              TextField(obscureText: true, decoration: InputDecoration(hintText: 'Confirmar Senha')),
              SizedBox(height: 12),
              Row(children: [Checkbox(value: false, onChanged: (_) {}), Expanded(child: Text('Aceito os termos e condições'))]),
              SizedBox(height: 12),
              PrimaryButton(label: 'Criar Conta', onTap: () => Navigator.pop(context)),
            ],
          ),
        ),
      ),
    );
  }
}