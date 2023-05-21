import 'dart:async';
import 'package:recipe_app/models/myuser.dart';

abstract class UserRepository {
  Future<bool> logIn({required String email, required String password});
  Future<bool> signUp({required String email, required String password});
  Future<bool> updateUser(MyUser user);
  Future<bool> logoutUser(MyUser user);
}

class UserRepositoryImpl implements UserRepository {

  UserRepositoryImpl();
  @override
  
  Future<bool> logIn({required String email, required String password}) async {
   throw UnimplementedError();
  }
  @override
  Future<bool> signUp({required String email, required String password}) async {
   
     throw UnimplementedError();
    
  }
 
  @override
  Future<bool> updateUser(MyUser user) async {
   throw UnimplementedError();
  }
  
  @override
  Future<bool> logoutUser(MyUser user) {
  
    throw UnimplementedError();
  }
}