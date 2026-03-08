import 'package:flutter/material.dart';

class BasemapView extends StatelessWidget {
  const BasemapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: <Widget>[
              Icon(Icons.location_city),
              SizedBox(width: 8),
              Text("BaseMap", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                basemapCard("Satellite"),
                basemapCard("Street"),
                basemapCard("Terrain"),
                basemapCard("Hybrid"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget basemapCard(String name) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Text(name),
    );
  }
}
