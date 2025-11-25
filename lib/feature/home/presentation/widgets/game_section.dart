import 'package:flutter/material.dart';
import '../../../../core/widgets/game_card.dart';
import '../../../../core/routes/app_routes.dart';

class GameSection extends StatelessWidget {
  const GameSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GameCard(
          icon: '.',
          title: 'SyntaxLab',
          description: 'Susun potongan kode sampe jalan. Biar keliatan lo tuh coder beneran',
          difficulty: 'SEDANG',
          difficultyColor: const Color(0xFFF59E0B),
          accentColor: const Color(0xFF6366F1),
          onTap: () {
            print('DIKLIK: SyntaxLab');
            print('Route: ${AppRoutes.syntaxLab}');
            Navigator.pushNamed(context, AppRoutes.syntaxLab);
          },
        ),
        const SizedBox(height: 24),
        GameCard(
          icon: '.',
          title: 'Syntax Showdown',
          description: 'Quiz bahasa pemrograman. Kadang gampang, kadang kayak mantra hitam',
          difficulty: 'SEDANG',
          difficultyColor: const Color(0xFFF59E0B),
          accentColor: const Color(0xFF10B981),
          onTap: () {
            print('DIKLIK: Syntax Showdown');
            print('Route: ${AppRoutes.syntaxShowdown}');
            Navigator.pushNamed(context, AppRoutes.syntaxShowdown);
          },
        ),
      ],
    );
  }
}