import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/custom_text_field.dart';

// Repositórios
import '../../repositories/user_repository.dart';
import '../../repositories/ong_repository.dart';

// Containers
import '../../app_container.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscure = true;

  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> login() async {
    final prefs = await SharedPreferences.getInstance();
    final emailStr = email.text.trim();
    final passwordStr = password.text.trim();

    if (emailStr.isEmpty || passwordStr.isEmpty) {
      _errorMessage("Preencha todos os campos");
      return;
    }

    // -------------------------------
    // TENTAR LOGIN COMO ONG
    // -------------------------------
    final ong = await OngRepository().login(emailStr, passwordStr);
    if (ong != null) {
      await prefs.setString('role', 'ong');
      await prefs.setString('email', ong.email);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OngAppContainer()),
      );
      return;
    }

    // -------------------------------
    // TENTAR LOGIN COMO ADOTANTE
    // -------------------------------
    final user = await UserRepository().login(emailStr, passwordStr);
    if (user != null) {
      await prefs.setString('role', 'adopter');
      await prefs.setString('email', user.email);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AdopterAppContainer()),
      );
      return;
    }

    // -------------------------------
    // NENHUM LOGIN FUNCIONOU
    // -------------------------------
    _errorMessage("Email ou senha incorretos.");
  }

  void _errorMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
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

              // Logo
              SizedBox(
                height: 140,
                child: Image.asset(
                  'assets/meadote/logo/Logo1.png',
                  fit: BoxFit.contain,
                ),
              ),

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
                  onPressed: () {},
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
                  onPressed: login,
                  child: const Text(
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
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
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
