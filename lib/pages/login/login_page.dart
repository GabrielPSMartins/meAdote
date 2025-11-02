import 'package:flutter/material.dart';
import '../../widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const CircleAvatar(radius: 44, backgroundColor: Color(0xFF3A3A3A)),
              const SizedBox(height: 12),
              const Text(
                'Bem vindo ao MeAdote',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Acesse sua conta para continuar',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFFB3B3B3)),
              ),
              const SizedBox(height: 12),
              CustomTextField(
                hint: 'Email',
                controller: email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 8),
              CustomTextField(
                hint: 'Senha',
                controller: password,
                obscure: true,
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Esqueceu a senha?'),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  backgroundColor: Theme.of(context)
                          .elevatedButtonTheme
                          .style
                          ?.backgroundColor
                          ?.resolve({}) ??
                      const Color(0xFFA0A0A0),
                  foregroundColor: Colors.black,
                ),
                child: const Text('Entrar'),
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Criar conta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
