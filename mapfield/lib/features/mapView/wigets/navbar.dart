import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mapfield/data/utility/seeding_provider.dart";
import "package:mapfield/features/mapView/provider/gislayer_provider.dart";
import "package:mapfield/features/mapView/wigets/modal/layer_modal.dart";
import "package:mapfield/features/mapView/wigets/modal/more_modal.dart";

class NavbarView extends ConsumerWidget {
  final String projectId;
  const NavbarView({super.key, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Map<String, dynamic>> navigationButtons = [
      {
        "icon": Icons.arrow_back,
        "label": "Back",
        "onPressed": () => Navigator.pop(context),
      },
      {
        "icon": Icons.sync,
        "label": "Sync",
        "onPressed": () async {
          await setupInitialLayer(projectId);
          ref.invalidate(gisLayerProvider(projectId));
        },
      },
      {
        "icon": Icons.add_circle,
        "label": "Add",
        "onPressed": () => print("test"),
      },
      {
        "icon": Icons.layers,
        "label": "Layers",
        "onPressed": () => openLayerModal(context),
      },
      {
        "icon": Icons.more_horiz,
        "label": "More",
        "onPressed": () => openMoreModal(context),
      },
    ];

    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navigationButtons.map((button) {
          return NavbarButton(
            iconSymbol: Icon(button["icon"]),
            text: button["label"],
            onPressed: button["onPressed"],
          );
        }).toList(),
      ),
    );
  }
}

class NavbarButton extends StatelessWidget {
  final Icon iconSymbol;
  final String text;
  final VoidCallback onPressed;

  const NavbarButton({
    super.key,
    required this.iconSymbol,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: onPressed, icon: iconSymbol),
        Text(text),
      ],
    );
  }
}
