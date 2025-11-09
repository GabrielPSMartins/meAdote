import 'package:flutter/material.dart';

// Core
import 'core/core_theme.dart';
import 'core/theme_controller.dart';

// App theme
import 'theme/app_theme.dart';
import 'nucleo/control_theme.dart';  
import 'nucleo/theme.dart';

// Pages
import 'pages/begin/begin_page.dart';
import 'pages/profile/profile_page.dart';
import 'pages/login/login_page.dart';  
import 'pages/education/education.dart';  
import 'pages/favorits/favorits.dart';
import 'pages/search/search.dart';    

// Screens
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/register_organization_screen.dart';

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
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: mode,
          initialRoute: '/',
          routes: {
            '/': (context) => const OnboardingScreen(), 
            '/home': (context) =>  HomeShell(),
            '/login': (context) => const LoginScreen(),
            '/register': (context) => const RegisterScreen(),
            '/register_org': (context) => const RegisterOrganizationScreen(),
            '/profile': (context) => const ProfilePage(),
            '/login_page': (context) => LoginPage(),
          },
        );
      },
    );
  }
}

class HomeShell extends StatefulWidget {
  @override
  _HomeShellState createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  final pages = [
    BeginPage(),
    ProfilePage(),
    BuscarPage(),  
    FavoritosPage(),
    EducacaoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedItemColor: Theme.of(context).iconTheme.color,
        unselectedItemColor:
            Theme.of(context).iconTheme.color?.withOpacity(0.6),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favoritos'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Educação'),
        ],
      ),
    );
  }
}
