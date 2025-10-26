import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/register_organization_screen.dart';

void main() {
  runApp(const MeAdoteApp());
}

class MeAdoteApp extends StatelessWidget {
  const MeAdoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeAdote_inicio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/register_org': (context) => const RegisterOrganizationScreen(),
      },
    );
  }
}