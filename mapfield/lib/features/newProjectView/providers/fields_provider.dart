import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/project_field_models.dart';

class FieldsNotifier extends Notifier<List<ProjectField>> {
  @override
  List<ProjectField> build() {
    return [
      ProjectField(id: 'initial_name', name: 'Project Name', type: 'Text'),
      ProjectField(id: 'initial_photo', name: 'Site Photo', type: 'Photo'),
    ];
  }

  void addField() {
    final newField = ProjectField(id: DateTime.now().toString());
    state = [...state, newField];
  }

  void removeField(String id) {
    state = state.where((field) => field.id != id).toList();
  }

  void updateField(String id, {String? name, String? type}) {
    state = [
      for (final field in state)
        if (field.id == id) field.copyWith(name: name, type: type) else field,
    ];
  }
}

final fieldsProvider = NotifierProvider<FieldsNotifier, List<ProjectField>>(
  FieldsNotifier.new,
);
