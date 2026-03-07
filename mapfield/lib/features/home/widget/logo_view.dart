import 'package:flutter/material.dart';

class LogoView extends StatelessWidget {
  const LogoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Image.asset("logo.png", width: 200),
    );
  }
}
