import 'package:flutter/material.dart';
import '../widgets/onboarding_info_card.dart';
import '../widgets/primary_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

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

              // LOGO
              SizedBox(
                height: 140,
                child: Image.asset(
                  'assets/meadote/logo/Logo1.png',
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 20),

              // TÍTULO
              const Text(
                "MeAdote",
                style: TextStyle(
                  color: Color(0xFFEFE3DB),
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                "Adoção responsável, laços eternos.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFAD9F94),
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 26),

              // ---- 3 CARDS ----
              const OnboardingInfoCard(
                icon: Icons.search,
                title: "Encontre seu companheiro",
                subtitle: "Explore animais disponíveis perto de você.",
              ),

              const OnboardingInfoCard(
                icon: Icons.verified_user,
                title: "Adoção segura",
                subtitle: "ONGs e protetores verificados.",
              ),

              const OnboardingInfoCard(
                icon: Icons.volunteer_activism,
                title: "Suporte completo",
                subtitle: "Acompanhamento pós-adoção garantido.",
              ),

              const SizedBox(height: 22),

              // BOTÃO COMEÇAR
              PrimaryButton(
                label: "Começar Jornada",
                onTap: () => Navigator.pushNamed(context, '/register'),
              ),

              const SizedBox(height: 20),

              // ÍCONES SOCIAIS
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.facebook, color: Colors.white70, size: 30),
                  SizedBox(width: 25),
                  Icon(Icons.g_mobiledata, color: Colors.white70, size: 35),
                  SizedBox(width: 25),
                  Icon(Icons.apple, color: Colors.white70, size: 30),
                ],
              ),

              const SizedBox(height: 20),

              // LOGIN 
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/login_page'),
                child: const Text(
                  "Já tem uma conta? Fazer login",
                  style: TextStyle(
                    color: Color(0xFFB89278),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
