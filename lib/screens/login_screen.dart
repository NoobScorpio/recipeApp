import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/controllers/repo_controller.dart';
import 'package:recipe_app/models/myuser.dart';
import 'package:recipe_app/screens/home_screen.dart';
import 'package:recipe_app/screens/screen_handler.dart';
import 'package:recipe_app/screens/welcome_screen.dart';
import 'package:recipe_app/states/user_cubit.dart';
import 'package:recipe_app/states/user_state.dart';
import 'package:recipe_app/widgets/primary_button.dart';
import 'package:recipe_app/widgets/primary_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserRepository repo = UserRepositoryImpl();
  @override
  Widget build(BuildContext context) {
    String _email = "", _password = "";
    return Scaffold(
      backgroundColor: Constants.PRIMARY_COLOR,
      appBar: AppBar(
        backgroundColor: Constants.SECONDARY_COLOR,
        title: const Text("Login Screen"),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(15.0),
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.075,
          ),
          Center(
            child: Card(
              color: Constants.PRIMARY_COLOR,
              elevation: 8.0,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Constants.getLogo(height: 150, width: 150),
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
                      BlocBuilder<UserCubit, UserState>(
                          builder: (context, state) {
                        return PrimaryButton(
                          title: "Log In",
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              debugPrint("LOGGING IN");
                              await BlocProvider.of<UserCubit>(context)
                                  .loginUser(_email, _password)
                                  .then((value) {
                                debugPrint("LOGGING IN $value");
                                if (value) {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return BlocProvider(
                                        create: (context) => UserCubit(
                                            userRepository:
                                                UserRepositoryImpl()),
                                        child: const ScreenHandler(),
                                      );
                                    },
                                  ), (Route<dynamic> route) => false);
                                } else {}
                              });
                            }
                          },
                        );
                      }),
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
