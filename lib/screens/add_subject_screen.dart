import 'package:flutter/material.dart';
import 'package:grade_tracker/models/subject.dart';
import 'package:grade_tracker/providers/subject_provider.dart';
import 'package:provider/provider.dart';

class AddSubjectScreen extends StatefulWidget {
  const AddSubjectScreen({super.key});

  @override
  State<AddSubjectScreen> createState() => _AddSubjectScreenState();
}

class _AddSubjectScreenState extends State<AddSubjectScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _markController = TextEditingController();
  bool _submitted = false;

  @override
  void dispose() {
    _nameController.dispose();
    _markController.dispose();
    super.dispose();
  }

  void _submit() {
    _submitted = true;
    if (_formKey.currentState!.validate()) {
      final subject = Subject(
        name: _nameController.text.trim(),
        mark: int.parse(_markController.text.trim()),
      );
      context.read<SubjectProvider>().addSubject(subject);
      _nameController.clear();
      _markController.clear();
      _submitted = false;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${subject.name} added — Grade ${subject.grade}'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Theme.of(context).colorScheme.primary,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 28, 20, 20),
        child: Form(
          key: _formKey,
          autovalidateMode:
              _submitted ? AutovalidateMode.always : AutovalidateMode.disabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Add Subject', style: theme.textTheme.headlineMedium),
              const SizedBox(height: 6),
              Text(
                'Enter a subject name and mark out of 100.',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 32),

              // Subject name field
              TextFormField(
                controller: _nameController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Subject Name',
                  hintText: 'e.g. Mathematics',
                  prefixIcon: Icon(Icons.book_outlined),
                ),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Subject name cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Mark field
              TextFormField(
                controller: _markController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Mark',
                  hintText: '0 – 100',
                  prefixIcon: Icon(Icons.edit_outlined),
                  suffixText: '/ 100',
                ),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Mark cannot be empty';
                  }
                  final n = int.tryParse(v.trim());
                  if (n == null) return 'Enter a valid number';
                  if (n < 0 || n > 100) return 'Mark must be between 0 and 100';
                  return null;
                },
              ),
              const SizedBox(height: 32),

              // Grade preview
              if (_nameController.text.isNotEmpty ||
                  _markController.text.isNotEmpty)
                _GradePreviewCard(
                    mark: int.tryParse(_markController.text.trim())),

              SizedBox(height: MediaQuery.of(context).size.height * 0.01),

              ElevatedButton.icon(
                onPressed: _submit,
                icon: const Icon(Icons.add_circle_outline, size: 20),
                label: const Text('Add Subject'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GradePreviewCard extends StatelessWidget {
  final int? mark;
  const _GradePreviewCard({this.mark});

  String _grade() {
    if (mark == null || mark! < 0 || mark! > 100) return '?';
    if (mark! >= 80) return 'A';
    if (mark! >= 65) return 'B';
    if (mark! >= 50) return 'C';
    return 'F';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final grade = _grade();
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(10),
        border:
            Border.all(color: theme.colorScheme.secondary.withOpacity(0.25)),
      ),
      child: Row(
        children: [
          Icon(Icons.auto_awesome,
              size: 18, color: theme.colorScheme.secondary),
          const SizedBox(width: 10),
          Text(
            mark != null && grade != '?'
                ? 'Predicted grade: $grade  (${_gradeDesc(grade)})'
                : 'Enter a valid mark to preview grade',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.secondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  String _gradeDesc(String g) => switch (g) {
        'A' => '80–100',
        'B' => '65–79',
        'C' => '50–64',
        _ => 'Below 50',
      };
}
