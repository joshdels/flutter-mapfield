import 'package:flutter/material.dart';

class CloudProjectsView extends StatelessWidget {
  const CloudProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("My Projects", textAlign: TextAlign.left),
        Divider(),
        Expanded(
          child: ListView(
            children: [
              CloudProjectItem(),
              CloudProjectItem(),
              CloudProjectItem(),
            ],
          ),
        ),
      ],
    );
  }
}

class CloudProjectItem extends StatelessWidget {
  const CloudProjectItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.grey.shade200,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        title: Text("Project Title"),
        subtitle: Text("Updated naba?"),
        trailing: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
      ),
    );
  }
}
