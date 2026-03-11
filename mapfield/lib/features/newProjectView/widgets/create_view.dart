import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mapfield/features/newProjectView/controller/project_controller.dart";
import 'package:mapfield/core/routing/route_names.dart';

class CreateProjectView extends ConsumerWidget {
  const CreateProjectView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(projectControllerProvider);
    final isLoading = status == ProjectSaveStatus.loading;

    void handlePress() async {
      final String? newId = await ref
          .read(projectControllerProvider.notifier)
          .createProject();

      if (newId != null && context.mounted) {
        Navigator.pushNamed(context, RouteNames.map, arguments: newId);
      }
    }

    return BottomAppBar(
      child: TextButton(
        onPressed: isLoading ? null : handlePress,
        child: isLoading
            ? const CircularProgressIndicator()
            : const Text("Create Project"),
      ),
    );
  }
}
