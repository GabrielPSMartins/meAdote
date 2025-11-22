import 'package:flutter/material.dart';

// Controlador de tema
import 'core/theme_controller.dart';

// Tema real do app
import 'theme/app_theme.dart';

// Container principal 
import 'app_container.dart';

// Fluxo inicial
import 'screens/onboarding_screen.dart';
import 'pages/login/login_page.dart';
import 'screens/register_screen.dart';
import 'screens/register_organization_screen.dart';

// Paginas internas
import 'pages/profile/profile_page.dart';
import 'pages/home/home_page.dart';
import 'pages/home/interest_page.dart';
import 'pages/home/create_post_page.dart';


void main() {
  runApp(const MeAdoteApp());
}

class MeAdoteApp extends StatelessWidget {
  const MeAdoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeController,
      builder: (_, mode, __) {
        return MaterialApp(
          title: 'MeAdote',
          debugShowCheckedModeBanner: false,

          darkTheme: AppTheme.darkTheme(),
          themeMode: mode,

          initialRoute: '/',
          routes: {
            '/': (_) => const OnboardingScreen(),
            '/login': (_) => const LoginPage(),
            '/register': (_) => const RegisterScreen(),
            '/register_org': (_) => const RegisterOrganizationScreen(),

            // entrada no app
            '/home': (_) => const AppContainer(),

            // internas
            '/profile': (_) => const ProfilePage(),
            '/interest': (_) => const InterestPage(),
            '/create_post': (_) => const CreatePostPage(),
          },
        );
      },
    );
  }
}
