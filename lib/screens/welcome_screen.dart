import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/screens/login_screen.dart';
import 'package:recipe_app/screens/singup_screen.dart';
import 'package:recipe_app/widgets/primary_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.PRIMARY_COLOR,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  const Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 24,
                        color: Constants.SECONDARY_COLOR,
                        fontWeight: FontWeight.bold),
                  ),
                  Constants.getLogo(),
                ],
              ),
            ),
          ),
          Column(
            children: [
              PrimaryButton(
                title: "Log In",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
              ),
              const SizedBox(
                height: 12,
              ),
              PrimaryButton(
                title: "Sign Up",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignupScreen()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
