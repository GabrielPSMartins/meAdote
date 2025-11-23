import 'package:flutter/material.dart';

// Shared pages
import 'pages/home/home_page.dart';
import 'pages/profile/profile_page.dart';

// Adopter pages
import 'pages/search/search_page.dart';
import 'pages/favorites/favorites_page.dart';
import 'pages/education/education_page.dart';

// ONG pages
import 'pages/campaign/campaign_page.dart';
import 'pages/dashboard/dashboard_page.dart';
import 'pages/explore/explore_page.dart';


// ADOPTER CONTAINER
class AdopterAppContainer extends StatefulWidget {
  const AdopterAppContainer({super.key});

  @override
  State<AdopterAppContainer> createState() => _AdopterAppContainerState();
}

class _AdopterAppContainerState extends State<AdopterAppContainer> {
  int index = 0;

  final pages = const [
    HomePage(),
    SearchPage(),
    FavoritesPage(),
    EducationPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1F1A17),
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        selectedItemColor: const Color(0xFFFFA74D),
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.school_outlined), label: "Education"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),
    );
  }
}


// ONG CONTAINER
class OngAppContainer extends StatefulWidget {
  const OngAppContainer({super.key});

  @override
  State<OngAppContainer> createState() => _OngAppContainerState();
}

class _OngAppContainerState extends State<OngAppContainer> {
  int index = 0;

  final pages = const [
    HomePage(),
    CampaignPage(),
    DashboardPage(),
    ExplorePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1F1A17),
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        selectedItemColor: const Color(0xFFFFA74D),
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.campaign_outlined), label: "Campaigns"),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),
    );
  }
}
