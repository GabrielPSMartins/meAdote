import 'package:flutter/material.dart';
import 'nucleo/theme.dart';
import 'nucleo/control_tema.dart';
import 'theme/app_theme.dart';
import 'pages/begin/begin.dart';
import 'pages/profile/profile.dart';
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/register_organization_screen.dart';

void main() {
  runApp(MeAdoteApp());
}

class MeAdoteApp extends StatelessWidget {
  MeAdoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: temaController,
      builder: (_, mode, __) {
        return MaterialApp(
          title: 'MeAdote',
          debugShowCheckedModeBanner: false,
          theme: temaClaro,
          darkTheme: temaEscuro,
          themeMode: mode,
          initialRoute: '/',
          routes: {
            '/': (context) => OnboardingScreen(),
            '/login': (context) => LoginScreen(),
            '/register': (context) => RegisterScreen(),
            '/register_org': (context) => RegisterOrganizationScreen(),
            '/profile': (context) => ProfilePage(),
            '/home': (context) => HomeShell(),
          },
        );
      },
    );
  }
}

class HomeShell extends StatefulWidget {
  HomeShell({Key? key}) : super(key: key);

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _idx = 0;

  final pages = [
    BeginPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_idx],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _idx,
        onTap: (i) => setState(() => _idx = i),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedItemColor: Theme.of(context).iconTheme.color,
        unselectedItemColor:
            Theme.of(context).iconTheme.color?.withOpacity(0.6),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
