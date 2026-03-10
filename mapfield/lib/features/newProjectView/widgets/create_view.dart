import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mapfield/features/newProjectView/controller/project_controller.dart";

class CreateProjectView extends ConsumerWidget {
  const CreateProjectView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(projectControllerProvider);
    final isLoading = status == ProjectSaveStatus.loading;

    void handlePress() async {
      await ref.read(projectControllerProvider.notifier).createProject();
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
