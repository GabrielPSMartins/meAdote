import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Theme Controller
import 'core/theme_controller.dart';

// Theme
import 'theme/app_theme.dart';

// Containers
import 'app_container.dart';

// Flow
import 'screens/onboarding_screen.dart';
import 'pages/login/login_page.dart';
import 'screens/register_screen.dart';
import 'screens/register_organization_screen.dart';

// Internal pages
import 'pages/profile/profile_page.dart';
import 'pages/profile/user_requests_page.dart';
import 'pages/home/home_page.dart';
import 'pages/home/interest_page.dart';
import 'pages/home/create_post_page.dart';

import 'pages/ong/ong_home_page.dart';
import 'pages/ong/ong_profile_page.dart';
import 'pages/ong/ong_campaigns_page.dart';
import 'pages/ong/ong_create_campaign_page.dart';

void main() {
  runApp(const MeAdoteApp());
}

class MeAdoteApp extends StatelessWidget {
  const MeAdoteApp({super.key});

  Future<Widget> _startup() async {
    final prefs = await SharedPreferences.getInstance();
    final role = prefs.getString('role');

    if (role == 'adopter') {
      return const AdopterAppContainer();
    } else if (role == 'ong') {
      return const OngAppContainer();
    }

    return const OnboardingScreen();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeController,
      builder: (_, mode, __) {
        return FutureBuilder(
          future: _startup(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return MaterialApp(home: Container(color: Colors.black));
            }

            return MaterialApp(
              title: 'MeAdote',
              debugShowCheckedModeBanner: false,
              darkTheme: AppTheme.darkTheme(),
              themeMode: mode,

              home: snapshot.data!,

              routes: {
                '/login': (_) => const LoginPage(),
                '/register': (_) => const RegisterScreen(),
                '/register_org': (_) => const RegisterOrganizationScreen(),

                '/profile': (_) => const ProfilePage(),
                '/interest': (_) => const InterestPage(),
                '/create_post': (_) => const CreatePostPage(),
                '/user_requests': (_) => const UserRequestsPage(),

                '/ong_home': (_) => const OngHomePage(),
                '/ong_profile': (_) => const OngProfilePage(),
                '/ong_campaigns': (_) => const OngCampaignsPage(),
                '/ong_create_campaign': (_) => const OngCreateCampaignPage(),
              },
            );
          },
        );
      },
    );
  }
}
