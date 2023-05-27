import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:recipe_app/controllers/repo_controller.dart';
import 'package:recipe_app/models/myuser.dart';
import 'package:recipe_app/states/user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;
  UserCubit({required this.userRepository}) : super(UserInitialState());

  Future<bool> loginUser(String email, String password) async {
    try {
      var user = await userRepository.logIn(email: email, password: password);
      if (user.id == "") {
        emit(UserErrorState(message: "Could not Log in "));
        return false;
      }
      emit(UserLoadedState(user: user));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signUpUser(
      String email, String password, String userName) async {
    try {
      var user = await userRepository.signUp(
          email: email, password: password, userName: userName);
      if (user.id == "") {
        emit(UserErrorState(message: "Could not Log in "));
        return false;
      }
      emit(UserLoadedState(user: user));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> getUser() async {
    try {
      var user = await userRepository.getUser();
      if (user.id == "") {
        emit(UserErrorState(message: "Could not Log in "));
      } else {
        emit(UserLoadedState(user: user));
      }
    } catch (e) {
      debugPrint("USERCUBIT GETUSER $e");
    }
  }

  Future<bool> updateUser({required MyUser user}) async {
    try {
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> logoutUser() async {
    try {
      return false;
    } catch (e) {
      return false;
    }
  }
}
