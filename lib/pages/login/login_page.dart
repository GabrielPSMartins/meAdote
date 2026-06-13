import 'package:flutter/material.dart';

import '../../widgets/custom_text_field.dart';
import '../../widgets/app_logo.dart';
import '../../app_container.dart';
import '../../repositories/user_repository.dart';
import '../../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscure = true;
  bool loading = false;

  final email = TextEditingController();
  final password = TextEditingController();
  final userRepo = UserRepository();

  Future<void> login() async {
    if (email.text.trim().isEmpty || password.text.isEmpty) {
      _showSnack('Preencha email e senha.', isError: true);
      return;
    }

    setState(() => loading = true);

    try {
      final user = await userRepo.login(
        email.text.trim(),
        password.text.trim(),
      );

      if (!mounted) return;

      if (user == null) {
        _showSnack('Email ou senha incorretos.', isError: true);
        return;
      }

      await AuthService.saveSession(user);

      if (!mounted) return;

      final container = user.role == 'ong'
          ? const OngAppContainer()
          : const AdopterAppContainer();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => container),
      );
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  void _showSnack(String msg, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: isError ? Colors.redAccent : Colors.green.shade600,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1A17),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const AppLogo(),
              const SizedBox(height: 20),
              const Text(
                "Bem-vindo ao MeAdote",
                style: TextStyle(
                  color: Color(0xFFEFE3DB),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Acolha vidas, transforme histórias.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFAD9F94),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 28),
              CustomTextField(
                hint: "Email",
                controller: email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 14),
              CustomTextField(
                hint: "Senha",
                controller: password,
                obscure: obscure,
                suffixIcon: IconButton(
                  icon: Icon(
                    obscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white54,
                  ),
                  onPressed: () => setState(() => obscure = !obscure),
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => _showSnack(
                    'Entre em contato com o suporte para recuperar sua senha.',
                  ),
                  child: const Text(
                    "Esqueceu a senha?",
                    style: TextStyle(color: Color(0xFFB89278)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB89278),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: loading ? null : login,
                  child: loading
                      ? const SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          "Entrar",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFB89278)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                ),
                onPressed: () => Navigator.pushNamed(context, "/register_org"),
                child: const Text(
                  "ONG / Protetor - Criar uma conta",
                  style: TextStyle(color: Color(0xFFB89278)),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, "/register"),
                child: const Text(
                  "Criar uma conta",
                  style: TextStyle(
                    color: Color(0xFFEFE3DB),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
