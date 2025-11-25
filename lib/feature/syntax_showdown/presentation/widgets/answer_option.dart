import 'package:flutter/material.dart';

class AnswerOption extends StatelessWidget {
  final String option;
  final VoidCallback onTap;
  final bool? isCorrect;
  final bool isSelected;

  const AnswerOption({
    Key? key,
    required this.option,
    required this.onTap,
    this.isCorrect,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = const Color(0xFF1E293B);
    Color borderColor = const Color(0xFF475569);

    if (isSelected) {
      if (isCorrect == true) {
        backgroundColor = const Color(0xFF065F46);
        borderColor = const Color(0xFF10B981);
      } else if (isCorrect == false) {
        backgroundColor = const Color(0xFF7F1D1D);
        borderColor = const Color(0xFFEF4444);
      }
    }

    return GestureDetector(
      onTap: isCorrect == null ? onTap : null,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Text(
          option,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}