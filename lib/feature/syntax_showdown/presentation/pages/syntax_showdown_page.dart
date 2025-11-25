import 'package:flutter/material.dart';
import '../../data/quiz_questions.dart' as quiz_data;
import '../widgets/question_card.dart';
import '../widgets/answer_option.dart';
import '../widgets/score_display.dart';
import '../widgets/result_dialog.dart';

class SyntaxShowdownPage extends StatefulWidget {
  const SyntaxShowdownPage({Key? key}) : super(key: key);

  @override
  State<SyntaxShowdownPage> createState() => _SyntaxShowdownPageState();
}

class _SyntaxShowdownPageState extends State<SyntaxShowdownPage> {
  int currentQuestion = 0;
  int score = 0;
  String? selectedAnswer;
  bool hasAnswered = false;

  void _checkAnswer(String selected) {
    if (hasAnswered) return;

    setState(() {
      selectedAnswer = selected;
      hasAnswered = true;

      final question = quiz_data.QuizData.questions[currentQuestion];
      if (selected == question.answer) {
        score += 10;
      } else {
        score -= 5;
      }
    });
  }

  void _nextQuestion() {
    if (currentQuestion < quiz_data.QuizData.questions.length - 1) {
      setState(() {
        currentQuestion++;
        selectedAnswer = null;
        hasAnswered = false;
      });
    } else {
      _showResultDialog();
    }
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ResultDialog(
        finalScore: score,
        totalQuestions: quiz_data.QuizData.questions.length,
        onPlayAgain: () {
          Navigator.pop(context);
          setState(() {
            currentQuestion = 0;
            score = 0;
            selectedAnswer = null;
            hasAnswered = false;
          });
        },
      ),
    );
  }

  String? _getFeedbackMessage() {
    if (!hasAnswered) return null;

    final question = quiz_data.QuizData.questions[currentQuestion];
    if (selectedAnswer == question.answer) {
      return 'Bener cuy! +10 poin';
    } else {
      return 'Salah woy... belajar lagi -5 poin';
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = quiz_data.QuizData.questions[currentQuestion];

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        title: const Text(
          'Syntax Showdown',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(child: ScoreDisplay(score: score)),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              QuestionCard(
                language: question.language,
                code: question.code,
                currentQuestion: currentQuestion + 1,
                totalQuestions: quiz_data.QuizData.questions.length,
              ),
              const SizedBox(height: 24),
              const Text(
                'Pilih jawaban yang benar:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.separated(
                  itemCount: question.options.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final option = question.options[index];
                    bool? isCorrect;
                    bool isSelected = option == selectedAnswer;

                    if (hasAnswered && isSelected) {
                      isCorrect = option == question.answer;
                    }

                    return AnswerOption(
                      option: option,
                      onTap: () => _checkAnswer(option),
                      isCorrect: isCorrect,
                      isSelected: isSelected,
                    );
                  },
                ),
              ),
              if (_getFeedbackMessage() != null) ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: selectedAnswer == question.answer
                        ? const Color(0xFF065F46)
                        : const Color(0xFF7F1D1D),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _getFeedbackMessage()!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: hasAnswered ? _nextQuestion : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6366F1),
                  disabledBackgroundColor: const Color(0xFF475569),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  currentQuestion < quiz_data.QuizData.questions.length - 1
                      ? 'Next'
                      : 'Selesai',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}