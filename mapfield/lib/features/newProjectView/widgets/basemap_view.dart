import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/basemap_provider.dart';

final selectedBasemapProvider =
    NotifierProvider<SelectedBasemapNotifier, String>(
      SelectedBasemapNotifier.new,
    );

class BasemapView extends ConsumerWidget {
  const BasemapView({super.key});

  final List<Map<String, String>> basemaps = const [
    {"name": "Satellite", "image": "assets/basemap/satellite.jpg"},
    {"name": "Dark", "image": "assets/basemap/black.jpg"},
    {"name": "Streets", "image": "assets/basemap/streets.jpg"},
    {"name": "Hybrid", "image": "assets/basemap/Basemap.png"},
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedValue = ref.watch(selectedBasemapProvider);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: <Widget>[
              Icon(Icons.map),
              SizedBox(width: 4),
              Text("BaseMap"),
            ],
          ),

          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: basemaps.length,
              itemBuilder: (context, index) {
                final item = basemaps[index];
                final name = item['name']!;
                final isSelected = selectedValue == name;
                return GestureDetector(
                  onTap: () => ref
                      .read(selectedBasemapProvider.notifier)
                      .setBasemap(name),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: BasemapCard(
                      name: item['name']!,
                      imagePath: item['image']!,
                      isSelected: isSelected,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BasemapCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final bool isSelected;

  const BasemapCard({
    super.key,
    required this.name,
    required this.imagePath,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected ? Colors.green : Colors.grey.shade300,
              width: 2,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    width: double.infinity,
                    child: Image.asset(imagePath, fit: BoxFit.cover),
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      name,
                      style: TextStyle(
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontSize: 12,
                        color: isSelected ? Colors.green : Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        if (isSelected)
          Positioned(
            top: 6,
            right: 6,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, color: Colors.white, size: 16),
            ),
          ),
      ],
    );
  }
}
