import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF1F1A17),
      body: Center(
        child: Text(
          "Dashboard Page",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
