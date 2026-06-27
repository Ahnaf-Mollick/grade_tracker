import 'package:flutter/material.dart';
import 'package:grade_tracker/providers/subject_provider.dart';
import 'package:grade_tracker/theme/app_theme.dart';
import 'package:grade_tracker/widgets/grade_badge.dart';
import 'package:provider/provider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<SubjectProvider>(
      builder: (context, provider, _) {
        final passing = provider.passingSubjects;
        final allGrades = provider.allGrades;

        // Count grade distribution using .map() output
        final gradeCounts = <String, int>{};
        for (final g in allGrades) {
          gradeCounts[g] = (gradeCounts[g] ?? 0) + 1;
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 28, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Result Summary', style: theme.textTheme.headlineMedium),
              const SizedBox(height: 6),
              Text(
                'Live overview of your academic performance.',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),

              // Overall Grade Hero
              _HeroCard(
                grade: provider.overallGrade,
                average: provider.averageMark,
                total: provider.totalSubjects,
              ),
              const SizedBox(height: 16),

              // Stats row
              Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      label: 'Subjects',
                      value: '${provider.totalSubjects}',
                      icon: Icons.library_books_outlined,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _StatCard(
                      label: 'Passing',
                      value: '${passing.length}',
                      icon: Icons.check_circle_outline,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _StatCard(
                      label: 'Failing',
                      value: '${provider.totalSubjects - passing.length}',
                      icon: Icons.highlight_off_outlined,
                      isNegative: (provider.totalSubjects - passing.length) > 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Grade distribution
              if (provider.totalSubjects > 0) ...[
                Text('Grade Distribution',
                    style: theme.textTheme.headlineSmall),
                const SizedBox(height: 12),
                ...['A', 'B', 'C', 'F'].map((g) {
                  final count = gradeCounts[g] ?? 0;
                  final fraction = provider.totalSubjects > 0
                      ? count / provider.totalSubjects
                      : 0.0;
                  return _GradeBar(
                    grade: g,
                    count: count,
                    fraction: fraction,
                  );
                }),
                const SizedBox(height: 16),

                // Passing subjects list (uses .where())
                if (passing.isNotEmpty) ...[
                  Text('Passing Subjects',
                      style: theme.textTheme.headlineSmall),
                  const SizedBox(height: 10),
                  ...passing.map((s) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surface,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xFF27AE60)
                                  .withValues(alpha: 0.3),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.check_circle,
                                  size: 16, color: Color(0xFF27AE60)),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(s.name,
                                    style: theme.textTheme.titleMedium),
                              ),
                              GradeBadge(grade: s.grade, size: 30),
                            ],
                          ),
                        ),
                      )),
                ],
              ] else
                _EmptyState(),
            ],
          ),
        );
      },
    );
  }
}

class _HeroCard extends StatelessWidget {
  final String grade;
  final double average;
  final int total;

  const _HeroCard(
      {required this.grade, required this.average, required this.total});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primary.withValues(alpha: 0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Overall Grade',
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: theme.colorScheme.onPrimary.withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  total == 0
                      ? 'No data yet'
                      : 'Average: ${average.toStringAsFixed(1)} / 100',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Text(
              grade,
              style: TextStyle(
                color: theme.colorScheme.secondary,
                fontSize: 34,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final bool isNegative;

  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    this.isNegative = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color =
        isNegative ? theme.colorScheme.error : theme.colorScheme.primary;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.15)),
      ),
      child: Column(
        children: [
          Icon(icon, size: 22, color: color),
          const SizedBox(height: 6),
          Text(value,
              style: theme.textTheme.headlineSmall?.copyWith(color: color)),
          Text(label, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _GradeBar extends StatelessWidget {
  final String grade;
  final int count;
  final double fraction;

  const _GradeBar(
      {required this.grade, required this.count, required this.fraction});

  Color _color() => AppTheme.gradeColor(grade);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = _color();
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            child: Text(
              grade,
              style: TextStyle(
                  color: color, fontWeight: FontWeight.w800, fontSize: 13),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: fraction,
                minHeight: 10,
                backgroundColor: color.withValues(alpha: 0.12),
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            '$count',
            style: theme.textTheme.titleSmall?.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: [
            Icon(
              Icons.bar_chart_outlined,
              size: 64,
              color: theme.colorScheme.primary.withValues(alpha: 0.15),
            ),
            const SizedBox(height: 12),
            Text('No data to summarise yet',
                style: theme.textTheme.headlineSmall),
            const SizedBox(height: 6),
            Text(
              'Add at least one subject to see your summary.',
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
