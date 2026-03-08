import 'package:flutter/material.dart';

class ForgotView extends StatelessWidget {
  const ForgotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: TextButton(
          onPressed: () {},
          child: const Text("Forgot Password"),
        ),
      ),
    );
  }
}
