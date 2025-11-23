import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF1F1A17),
      body: Center(
        child: Text(
          "Explore Page",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
