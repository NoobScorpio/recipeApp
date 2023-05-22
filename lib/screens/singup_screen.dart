import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/controllers/repo_controller.dart';
import 'package:recipe_app/screens/welcome_screen.dart';
import 'package:recipe_app/widgets/primary_button.dart';
import 'package:recipe_app/widgets/primary_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserRepository repo = UserRepositoryImpl();
  @override
  Widget build(BuildContext context) {
    String _email = "", _password = "", _userName = "";
    return Scaffold(
      backgroundColor: Constants.PRIMARY_COLOR,
      appBar: AppBar(
        backgroundColor: Constants.SECONDARY_COLOR,
        title: const Text("Signup Screen"),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(15.0),
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.075,
          ),
          Center(
            child: Form(
              key: _formKey,
              child: Card(
                color: Constants.PRIMARY_COLOR,
                elevation: 8.0,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Constants.getLogo(height: 150, width: 150),
                      PrimaryTextField(
                        title: "Name",
                        iconData: Icons.person,
                        validator: (input) {
                          if (input!.length < 3) {
                            return "Username too short";
                          }
                        },
                        onSaved: (input) => _userName = input ?? "",
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      PrimaryTextField(
                        title: "Email",
                        iconData: Icons.person,
                        validator: (input) {
                          if (!Constants.isEmail(email: input ?? "")) {
                            return "Please Type an email";
                          }
                        },
                        onSaved: (input) => _email = input ?? "",
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      PrimaryTextField(
                        title: "Password",
                        iconData: Icons.lock,
                        obscure: true,
                        validator: (input) {
                          if (input!.length < 6) {
                            return "Password too small";
                          }
                        },
                        onSaved: (input) => _password = input ?? "",
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      PrimaryButton(
                        title: "Sign Up",
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            bool signedIn = await repo.signUp(
                                email: _email,
                                password: _password,
                                userName: _userName);
                            if (signedIn) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WelcomeScreen()),
                              );
                            } else {}
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
