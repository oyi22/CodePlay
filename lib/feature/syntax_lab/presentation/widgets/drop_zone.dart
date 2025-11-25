import 'package:flutter/material.dart';

class DropZoneArea extends StatelessWidget {
  final List<String> droppedBlocks;
  final Function(String) onAccept;
  final Function(int) onRemove;

  const DropZoneArea({
    Key? key,
    required this.droppedBlocks,
    required this.onAccept,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      onAccept: onAccept,
      builder: (context, candidateData, rejectedData) {
        final isHovering = candidateData.isNotEmpty;
        
        return Container(
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 200),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B).withOpacity(0.3),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isHovering 
                  ? const Color(0xFF3B82F6) 
                  : const Color(0xFF475569),
              width: 2,
              style: BorderStyle.solid,
            ),
          ),
          child: droppedBlocks.isEmpty
              ? Center(
                  child: Text(
                    'Seret blok kode ke sini untuk menyusun jawaban',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF64748B),
                      fontSize: 14,
                    ),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(droppedBlocks.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: GestureDetector(
                        onTap: () => onRemove(index),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E3A8A),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xFF3B82F6),
                            ),
                          ),
                          child: Text(
                            droppedBlocks[index],
                            style: const TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 13,
                              color: Color(0xFF10B981),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
        );
      },
    );
  }
}