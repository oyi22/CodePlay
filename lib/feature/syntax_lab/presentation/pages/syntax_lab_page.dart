import 'package:flutter/material.dart';
import '../../data/syntax_lab_levels.dart';
import '../widgets/level_header.dart';
import '../widgets/draggable_code_block.dart';
import '../widgets/drop_zone.dart';
import '../widgets/success_dialog.dart';

class SyntaxLabPage extends StatefulWidget {
  const SyntaxLabPage({Key? key}) : super(key: key);

  @override
  State<SyntaxLabPage> createState() => _SyntaxLabPageState();
}

class _SyntaxLabPageState extends State<SyntaxLabPage> {
  int currentLevel = 0;
  int score = 0;
  int attempts = 3;
  List<String> droppedBlocks = [];
  List<String> usedBlocks = [];
  List<String> shuffledBlocks = [];

  @override
  void initState() {
    super.initState();
    _loadLevel();
  }

  void _loadLevel() {
    final level = SyntaxLabData.levels[currentLevel];
    final allBlocks = [...level.correctBlocks, ...level.wrongBlocks];
    shuffledBlocks = List.from(allBlocks)..shuffle();
    droppedBlocks.clear();
    usedBlocks.clear();
  }

  void _onBlockDropped(String code) {
    setState(() {
      droppedBlocks.add(code);
      usedBlocks.add(code);
    });
  }

  void _onBlockRemoved(int index) {
    setState(() {
      final removedBlock = droppedBlocks[index];
      droppedBlocks.removeAt(index);
      usedBlocks.remove(removedBlock);
    });
  }

  void _checkAnswer() {
    if (droppedBlocks.isEmpty) {
      _showSnackBar('Silakan susun beberapa blok kode terlebih dahulu', Colors.orange);
      return;
    }

    final level = SyntaxLabData.levels[currentLevel];
    final isCorrect = droppedBlocks.length == level.correctBlocks.length &&
        droppedBlocks.asMap().entries.every((entry) {
          return entry.value == level.correctBlocks[entry.key];
        });

    if (isCorrect) {
      final scoreGained = (currentLevel + 1) * 100;
      setState(() {
        score += scoreGained;
      });
      _showSuccessDialog(scoreGained);
    } else {
      setState(() {
        attempts--;
      });
      if (attempts <= 0) {
        _showGameOverDialog();
      } else {
        _showSnackBar('Salah! Periksa urutan kode. Kesempatan tersisa: $attempts', Colors.red);
      }
    }
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _showSuccessDialog(int scoreGained) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => SuccessDialog(
        level: currentLevel + 1,
        scoreGained: scoreGained,
        isLastLevel: currentLevel >= SyntaxLabData.levels.length - 1,
        onNextLevel: () {
          Navigator.pop(context);
          if (currentLevel >= SyntaxLabData.levels.length - 1) {
            _restartGame();
          } else {
            setState(() {
              currentLevel++;
              attempts = 3;
              _loadLevel();
            });
          }
        },
      ),
    );
  }

  void _showGameOverDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameOverDialog(
        onRestart: () {
          Navigator.pop(context);
          _restartGame();
        },
      ),
    );
  }

  void _restartGame() {
    setState(() {
      currentLevel = 0;
      score = 0;
      attempts = 3;
      _loadLevel();
    });
  }

  void _resetLevel() {
    setState(() {
      _loadLevel();
    });
  }

  void _showHint() {
    final level = SyntaxLabData.levels[currentLevel];
    _showSnackBar('Hint: ${level.hint}', Colors.blue);
  }

  @override
  Widget build(BuildContext context) {
    final level = SyntaxLabData.levels[currentLevel];

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        title: const Text(
          'SyntaxLab',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LevelHeader(
                currentLevel: currentLevel + 1,
                score: score,
                attempts: attempts,
              ),
              const SizedBox(height: 24),
              
              // Level Info
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      level.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      level.description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF94A3B8),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1F2937),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Target Output:',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF64748B),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            level.expectedOutput,
                            style: const TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 14,
                              color: Color(0xFF10B981),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              
              // Drop Zone
              const Text(
                'Area Jawaban',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              DropZoneArea(
                droppedBlocks: droppedBlocks,
                onAccept: _onBlockDropped,
                onRemove: _onBlockRemoved,
              ),
              const SizedBox(height: 24),
              
              // Code Blocks
              const Text(
                'Blok Kode',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              ...shuffledBlocks.asMap().entries.map((entry) {
                final code = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: DraggableCodeBlock(
                    code: code,
                    index: entry.key,
                    isUsed: usedBlocks.contains(code),
                  ),
                );
              }).toList(),
              const SizedBox(height: 24),
              
              // Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _checkAnswer,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF10B981),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Periksa Jawaban',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _resetLevel,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEF4444),
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Icon(Icons.refresh, color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _showHint,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B82F6),
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Icon(Icons.lightbulb, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}