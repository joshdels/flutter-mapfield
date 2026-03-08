import 'package:flutter/material.dart';

class RefreshView extends StatelessWidget{
  const RefreshView({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: TextButton(onPressed: () {}, child: Text("Refresh Cloud Project List"))
    );
  }
}