import 'package:flutter/material.dart';
import 'package:meadote_inicio/app_container.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              CircleAvatar(radius: 40, backgroundColor: Colors.grey[700]),
              const SizedBox(height: 12),
              Text(
                'Bem-vindo ao MeAdote',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                hint: 'Email',
                controller: emailController,
              ),
              const SizedBox(height: 12),
              CustomTextField(
                hint: 'Senha',
                obscure: true,
                controller: passwordController,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Esqueceu a senha?'),
                ),
              ),
              const SizedBox(height: 12),
              PrimaryButton(
                label: 'Entrar',
                onTap: () {
                  Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AppContainer()),
                );
                },
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () => Navigator.pushNamed(context, '/register'),
                child: const Text('ONG / Protetor - Criar uma conta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
