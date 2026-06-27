// lib/widgets/grade_badge.dart

import 'package:flutter/material.dart';

class GradeBadge extends StatelessWidget {
  final String grade;
  final double size;

  const GradeBadge({super.key, required this.grade, this.size = 36});

  Color _gradeColor(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return switch (grade) {
      'A' => const Color(0xFF27AE60),
      'B' => const Color(0xFF2980B9),
      'C' => const Color(0xFFF39C12),
      _   => cs.error,
    };
  }

  @override
  Widget build(BuildContext context) {
    final color = _gradeColor(context);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.4), width: 1.4),
      ),
      alignment: Alignment.center,
      child: Text(
        grade,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w800,
          fontSize: size * 0.45,
        ),
      ),
    );
  }
}
