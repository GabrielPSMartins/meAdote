import 'package:flutter/material.dart';

// Tema e controladores
import 'nucleo/theme.dart';
import 'nucleo/control_tema.dart';
import 'theme/app_theme.dart';

// Telas principais
import 'pages/begin/begin.dart';
//import 'pages/buscar/buscar.dart';
//import 'pages/favoritos/favoritos.dart';
//import 'paginas/educacao/educacao.dart';
import 'pages/profile/profile.dart';

// Telas de entrada
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
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: temaController,
      builder: (_, mode, __) {
        return MaterialApp(
          title: 'MeAdote',
          debugShowCheckedModeBanner: false,
          theme: temaClaro,                // tema claro do seu núcleo
          darkTheme: temaEscuro,           // tema escuro do seu núcleo
          themeMode: mode,                 // alterna conforme controlador
          initialRoute: '/',
          routes: {
            // fluxo inicial
            '/': (context) => const OnboardingScreen(),
            '/login': (context) => const LoginScreen(),
            '/register': (context) => const RegisterScreen(),
            '/register_org': (context) => const RegisterOrganizationScreen(),
            '/profile': (context) => const ProfilePage(),

            // núcleo principal
            '/home': (context) => const HomeShell(),
          },
        );
      },
    );
  }
}

class HomeShell extends StatefulWidget {
  const HomeShell({Key? key}) : super(key: key);

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _idx = 0;

  final pages = [
    BeginPage(),
    //BuscarPage(),
    //FavoritosPage(),
    //EducacaoPage(),
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
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favoritos'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Educação'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
     ),
);
}
}
