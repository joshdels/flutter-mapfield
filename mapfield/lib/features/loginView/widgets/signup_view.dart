import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Don't have an account"),
          SizedBox(height: 10),
          TextButtonItem(buttonText: "Sign up"),
        ],
      ),
    );
  }
}

class TextButtonItem extends StatelessWidget {
  final String buttonText;

  const TextButtonItem({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          foregroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          side: const BorderSide(color: Colors.grey, width: 2),
        ),
        onPressed: () {},
        child: Text(buttonText),
      ),
    );
  }
}
