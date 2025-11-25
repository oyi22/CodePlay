import 'package:flutter/material.dart';

class LevelHeader extends StatelessWidget {
  final int currentLevel;
  final int score;
  final int attempts;

  const LevelHeader({
    Key? key,
    required this.currentLevel,
    required this.score,
    required this.attempts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B).withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('Level', currentLevel.toString(), const Color(0xFFFBBF24)),
          _buildStatItem('Score', score.toString(), const Color(0xFF10B981)),
          _buildStatItem('Kesempatan', attempts.toString(), const Color(0xFF3B82F6)),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF94A3B8),
          ),
        ),
      ],
    );
  }
}