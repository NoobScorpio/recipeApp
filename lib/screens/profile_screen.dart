import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/controllers/repo_controller.dart';
import 'package:recipe_app/models/myuser.dart';
import 'package:recipe_app/screens/welcome_screen.dart';
import 'package:recipe_app/states/user_cubit.dart';
import 'package:recipe_app/states/user_state.dart';
import 'package:recipe_app/widgets/primary_button.dart';
import 'package:recipe_app/widgets/primary_textfield.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late String image;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    image = "";
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.PRIMARY_COLOR,
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Constants.PRIMARY_COLOR),
        ),
        actions: [
          InkWell(
            onTap: () async {
              EasyLoading.show();
              await FirebaseAuth.instance.signOut().then((value) {
                EasyLoading.dismiss();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => MultiBlocProvider(providers: [
                              BlocProvider<UserCubit>(
                                  create: (context) => UserCubit(
                                      userRepository: UserRepositoryImpl())),
                            ], child: const WelcomeScreen())),
                    (Route<dynamic> route) => false);
              });
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 18.0, right: 12),
              child: Text(
                "Logout",
                style: TextStyle(
                    color: Constants.PRIMARY_COLOR,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
        backgroundColor: Constants.SECONDARY_COLOR,
      ),
      body: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
        if (state is UserLoadedState) {
          MyUser user = state.user;
          debugPrint("${user.toJson()}");
          _emailController.text = user.email!;
          _nameController.text = user.name!;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () async {
                    EasyLoading.instance.loadingStyle = EasyLoadingStyle.light;
                    EasyLoading.show(
                      status: 'loading...',
                    );
                    Future.delayed(Duration(seconds: 3), () {
                      EasyLoading.dismiss();
                    });
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Constants.SECONDARY_COLOR,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              user.image == "" || user.image == null
                                  ? Constants.dummyImage
                                  : user.image!),
                          radius: 48,
                        ),
                      ),
                      Positioned(
                        right: MediaQuery.of(context).size.width / 2.8,
                        bottom: 0,
                        child: const CircleAvatar(
                          radius: 18,
                          backgroundColor: Constants.SECONDARY_COLOR,
                          child: Icon(
                            Icons.edit,
                            color: Constants.PRIMARY_COLOR,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Name",
                  style: TextStyle(
                      fontSize: 18,
                      color: Constants.SECONDARY_COLOR,
                      fontWeight: FontWeight.bold),
                ),
                PrimaryTextField(
                  controller: _nameController,
                  iconData: Icons.account_circle_outlined,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Email",
                  style: TextStyle(
                      fontSize: 18,
                      color: Constants.SECONDARY_COLOR,
                      fontWeight: FontWeight.bold),
                ),
                PrimaryTextField(
                  controller: _emailController,
                  iconData: Icons.email_outlined,
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                    child: PrimaryButton(
                        title: "Save",
                        onPressed: () {
                          if (_nameController.text.length < 3) {
                          } else if (!Constants.isEmail(
                              email: _emailController.text)) {
                          } else if (image == "") {
                          } else {}
                        }))
              ],
            ),
          );
        } else {
          return SizedBox(
              height: 50, width: 50, child: CircularProgressIndicator());
        }
      }),
    );
  }
}
