import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';

class RegisterOrganizationScreen extends StatelessWidget {
  const RegisterOrganizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Organização')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Text(
                'Dados da Organização',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              const TextField(decoration: InputDecoration(hintText: 'Nome da Organização')),
              const SizedBox(height: 8),
              const TextField(decoration: InputDecoration(hintText: 'Site/Instagram (opcional)')),
              const SizedBox(height: 12),
              Text('Dados do Usuário', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              const TextField(decoration: InputDecoration(hintText: 'Nome Completo')),
              const SizedBox(height: 8),
              const TextField(decoration: InputDecoration(hintText: 'Email')),
              const SizedBox(height: 8),
              const TextField(obscureText: true, decoration: InputDecoration(hintText: 'Senha')),
              const SizedBox(height: 8),
              const TextField(obscureText: true, decoration: InputDecoration(hintText: 'Confirmar Senha')),
              const SizedBox(height: 12),
              Row(
                children: const [
                  Checkbox(value: false, onChanged: null),
                  Expanded(child: Text('Aceito os termos e condições')),
                ],
              ),
              const SizedBox(height: 12),
              PrimaryButton(
                label: 'Criar Conta',
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
