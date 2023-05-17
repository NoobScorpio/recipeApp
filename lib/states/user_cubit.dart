import 'package:bloc/bloc.dart';
import 'package:recipe_app/controllers/repo_controller.dart';
import 'package:recipe_app/models/myuser.dart';
import 'package:recipe_app/states/user_state.dart';


class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;
  UserCubit({required this.userRepository}) : super(UserInitialState());

  Future<bool> loginUser(String email, String pass) async {
    try {
     return false;
    } catch (e) {
     
      return false;
    }
  }

  Future<bool> signInUser({required MyUser user}) async {
    try {
     return false;
    } catch (e) {
     
      return false;
    }
  }

  Future<void> getUser() async {
  try {
   
    } catch (e) {
     
     return;
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