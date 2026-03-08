import "package:flutter/material.dart";
import 'package:mapfield/shared/widgets/logo_view.dart';
import 'package:mapfield/features/loginView/widgets/signin_view.dart';
import 'package:mapfield/features/loginView/widgets/userinput_view.dart';
import 'package:mapfield/features/loginView/widgets/forgot_view.dart';
import 'package:mapfield/features/loginView/widgets/signup_view.dart';

class LoginSection extends StatelessWidget {
  const LoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cloud Projects"),
        centerTitle: true,
        leading: BackButton(),
        // actions: [IconButton(onPressed: () {}, icon: Icon(Icons.abc))],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(30),
        child: Center(
          child: Column(
            children: [
              LogoView(),
              UserInputView(),
              ForgotView(),
              SignInView(),
              SignupView(),
            ],
          ),
        ),
      ),
    );
  }
}
