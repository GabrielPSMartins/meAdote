import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
          child: Column(
            children: [
              SizedBox(height: 24),
              CircleAvatar(radius: 40, backgroundColor: Colors.grey[700]),
              SizedBox(height: 12),
              Text('Bem vindo ao Me adote', style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 16),
              CustomTextField(hint: 'Email', controller: emailController),
              SizedBox(height: 12),
              CustomTextField(hint: 'Senha', obscure: true, controller: passController),
              Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () {}, child: Text('Esqueceu a senha?'))),
              SizedBox(height: 12),
              PrimaryButton(label: 'Entrar', onTap: () => Navigator.pushNamed(context, '/')),
              SizedBox(height: 12),
              OutlinedButton(onPressed: () => Navigator.pushNamed(context, '/register'), child: Text('ONG/ Protetor - Criar uma conta')),
            ],
          ),
        ),
      ),
    );
  }
}