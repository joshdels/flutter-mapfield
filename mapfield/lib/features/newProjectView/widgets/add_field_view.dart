import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/fields_provider.dart';

class AddField extends ConsumerWidget {
  const AddField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton.icon(
      onPressed: () => ref.read(fieldsProvider.notifier).addField(),
      icon: const Icon(Icons.add),
      label: const Text("Add Field"),
    );
  }
}
