import 'package:flutter/material.dart';
import 'package:grade_tracker/providers/subject_provider.dart';
import 'package:grade_tracker/widgets/grade_badge.dart';
import 'package:provider/provider.dart';

class SubjectListScreen extends StatelessWidget {
  const SubjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<SubjectProvider>(
      builder: (context, provider, _) {
        final subjects = provider.subjects;

        if (subjects.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.school_outlined,
                  size: 72,
                  color: theme.colorScheme.primary.withOpacity(0.18),
                ),
                const SizedBox(height: 16),
                Text('No subjects yet', style: theme.textTheme.headlineSmall),
                const SizedBox(height: 6),
                Text(
                  'Add your first subject on the Add tab.',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('All Subjects', style: theme.textTheme.headlineMedium),
                  Chip(
                    label: Text('${subjects.length} total'),
                    avatar: Icon(
                      Icons.list_alt_rounded,
                      size: 14,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
              child: Text(
                'Swipe left to remove a subject.',
                style: theme.textTheme.bodyMedium,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 16),
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  final subject = subjects[index];
                  return Dismissible(
                    key: ValueKey('${subject.name}_$index'),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 24),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.error.withOpacity(0.85),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(Icons.delete_outline,
                          color: Colors.white, size: 26),
                    ),
                    onDismissed: (_) {
                      provider.removeSubject(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${subject.name} removed'),
                          behavior: SnackBarBehavior.floating,
                          duration: const Duration(seconds: 2),
                          backgroundColor: theme.colorScheme.error,
                        ),
                      );
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        child: Row(
                          children: [
                            GradeBadge(grade: subject.grade, size: 44),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(subject.name,
                                      style: theme.textTheme.titleMedium),
                                  const SizedBox(height: 3),
                                  Text(
                                    'Mark: ${subject.mark} / 100',
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                            _MarkBar(mark: subject.mark),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _MarkBar extends StatelessWidget {
  final int mark;
  const _MarkBar({required this.mark});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 48,
      child: Column(
        children: [
          Text(
            '$mark',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.secondary,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: mark / 100,
            backgroundColor: theme.colorScheme.secondary.withOpacity(0.15),
            valueColor:
                AlwaysStoppedAnimation<Color>(theme.colorScheme.secondary),
            borderRadius: BorderRadius.circular(4),
            minHeight: 4,
          ),
        ],
      ),
    );
  }
}
