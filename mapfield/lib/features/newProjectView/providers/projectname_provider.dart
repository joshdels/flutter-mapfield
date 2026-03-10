import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectnameProvider extends Notifier<String> {
  @override
  String build() => '';

  void updateName(String newName) {
    state = newName;
  }
}

final projectnameProvider = NotifierProvider<ProjectnameProvider, String>(
  ProjectnameProvider.new,
);
