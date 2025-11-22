import 'package:flutter/material.dart';
import '../../widgets/custom_text_field.dart'; 

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscure = true;

  final email = TextEditingController();
  final password = TextEditingController();

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

              /// ---- LOGO ----
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

              /// ---- EMAIL ----
              CustomTextField(
                hint: "Email",
                controller: email,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 14),

              /// ---- SENHA ----
              CustomTextField(
                hint: "Senha",
                controller: password,
                obscure: obscure,
                suffixIcon: IconButton(
                  icon: Icon(
                    obscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white54,
                  ),
                  onPressed: () {
                    setState(() => obscure = !obscure);
                  },
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

              /// ---- BOTÃO LOGIN ----
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
                  onPressed: () {},
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

              /// ---- OPÇÃO ONG / PROTETOR ----
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
