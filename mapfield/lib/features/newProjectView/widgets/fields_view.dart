import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/fields_provider.dart';
import '../../../data/models/project_field_models.dart';

class FieldsView extends StatelessWidget {
  const FieldsView({super.key});

  final List<String> fieldTypes = const [
    "Photo",
    "Field",
    "Text",
    "Video",
    "Number",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Fields",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 10),
        FieldsList(types: fieldTypes),
      ],
    );
  }
}

class FieldsList extends ConsumerWidget {
  final List<String> types;
  const FieldsList({super.key, required this.types});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fields = ref.watch(fieldsProvider);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: fields.length,
      itemBuilder: (context, index) {
        return FieldRow(field: fields[index], types: types);
      },
    );
  }
}

class FieldRow extends ConsumerStatefulWidget {
  final ProjectField field;
  final List<String> types;

  const FieldRow({super.key, required this.field, required this.types});

  @override
  ConsumerState<FieldRow> createState() => _FieldRowState();
}

class _FieldRowState extends ConsumerState<FieldRow> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.field.name);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: TextField(
              controller: _controller,
              onChanged: (val) {
                ref
                    .read(fieldsProvider.notifier)
                    .updateField(widget.field.id, name: val);
              },
              decoration: InputDecoration(
                hintText: "Field Name",
                isDense: true,
                contentPadding: const EdgeInsets.all(12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: DropdownButtonFormField<String>(
              initialValue: widget.field.type,
              isDense: true,
              items: widget.types
                  .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                  .toList(),
              onChanged: (val) {
                if (val != null) {
                  ref
                      .read(fieldsProvider.notifier)
                      .updateField(widget.field.id, type: val);
                }
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
            onPressed: () =>
                ref.read(fieldsProvider.notifier).removeField(widget.field.id),
          ),
        ],
      ),
    );
  }
}
