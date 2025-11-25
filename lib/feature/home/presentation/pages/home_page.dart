import 'package:flutter/material.dart';
import '../widgets/home_header.dart';
import '../widgets/game_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const HomeHeader(),
                const SizedBox(height: 60),
                GameSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}