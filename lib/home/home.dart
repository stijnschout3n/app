import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:app/login/login.dart';
import 'package:app/services/auth.dart';
import 'package:app/landing/landing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Error"),
          );
        } else if (snapshot.hasData) {
          return const LandingScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
