import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Conta')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const TextField(decoration: InputDecoration(hintText: 'Nome Completo')),
              const SizedBox(height: 8),
              const TextField(decoration: InputDecoration(hintText: 'Email')),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Expanded(
                    child: TextField(decoration: InputDecoration(hintText: 'Cidade')),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(decoration: InputDecoration(hintText: 'Estado')),
                  ),
                ],
              ),
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
              const SizedBox(height: 8),
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
