// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../controller/sintax_lab_controller.dart';

// class SyntaxStatsBar extends StatelessWidget {
//   const SyntaxStatsBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final ctrl = context.watch<SintaxLabController>();
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//       decoration: BoxDecoration(
//         color: Colors.white10,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           _statItem('${ctrl.currentLevel}', 'Level', Colors.amber),
//           _statItem('${ctrl.score}', 'Score', Colors.greenAccent),
//           _statItem('${ctrl.attempts}', 'Kesempatan', Colors.lightBlueAccent),
//         ],
//       ),
//     );
//   }

//   Widget _statItem(String value, String label, Color color) {
//     return Column(
//       children: [
//         Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
//         const SizedBox(height: 4),
//         Text(label, style: const TextStyle(fontSize: 12, color: Colors.white60)),
//       ],
//     );
//   }
// }
