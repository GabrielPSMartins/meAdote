import 'package:flutter/material.dart';

// Controlador de tema correto
import 'core/theme_controller.dart';

// Tema REAL do projeto (somente darkTheme())
import 'theme/app_theme.dart';

// Container principal (barra inferior)
import 'app_container.dart';

// Telas do fluxo inicial
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/register_organization_screen.dart';

// Páginas internas
import 'pages/profile/profile_page.dart';

void main() {
  runApp(const MeAdoteApp());
}

class MeAdoteApp extends StatelessWidget {
  const MeAdoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeController,
      builder: (_, mode, __) {
        return MaterialApp(
          title: 'MeAdote',
          debugShowCheckedModeBanner: false,

          darkTheme: AppTheme.darkTheme(),
          themeMode: mode,

          initialRoute: '/',
          routes: {
            '/': (context) => const OnboardingScreen(),
            '/login': (context) => const LoginScreen(),
            '/register': (context) => const RegisterScreen(),
            '/register_org': (context) => const RegisterOrganizationScreen(),

            // Entrada no app
            '/home': (context) => const AppContainer(),

            // Internas
            '/profile': (context) => const ProfilePage(),
          },
        );
      },
    );
  }
}
