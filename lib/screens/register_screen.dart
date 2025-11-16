import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';
import '../repositories/user_repository.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final userRepo = UserRepository();

  void register() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final city = cityController.text.trim();
    final state = stateController.text.trim();
    final pass = passwordController.text.trim();
    final confirmPass = confirmPasswordController.text.trim();

    // validação básica
    if (name.isEmpty ||
        email.isEmpty ||
        city.isEmpty ||
        state.isEmpty ||
        pass.isEmpty ||
        confirmPass.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha todos os campos.'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    // senha diferente
    if (pass != confirmPass) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('As senhas não coincidem.'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    // salvar no banco
    final ok = await userRepo.register(name, email, pass);

    if (!ok) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro ao criar conta. Email já cadastrado.'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Conta criada com sucesso!'),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Conta')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: 'Nome Completo'),
              ),
              const SizedBox(height: 8),

              TextField(
                controller: emailController,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(height: 8),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: cityController,
                      decoration: const InputDecoration(hintText: 'Cidade'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: stateController,
                      decoration: const InputDecoration(hintText: 'Estado'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(hintText: 'Senha'),
              ),
              const SizedBox(height: 8),

              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration:
                    const InputDecoration(hintText: 'Confirmar Senha'),
              ),
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
                onTap: register,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
