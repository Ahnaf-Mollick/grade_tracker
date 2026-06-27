import 'package:flutter/material.dart';
import 'package:grade_tracker/theme/app_theme.dart';

class GradeBadge extends StatelessWidget {
  final String grade;
  final double size;

  const GradeBadge({super.key, required this.grade, this.size = 36});

  Color _gradeColor(BuildContext context) => AppTheme.gradeColor(grade);

  @override
  Widget build(BuildContext context) {
    final color = _gradeColor(context);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
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
