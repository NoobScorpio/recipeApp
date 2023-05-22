import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/models/myuser.dart';

abstract class UserRepository {
  Future<bool> logIn({required String email, required String password});
  Future<bool> signUp(
      {required String email,
      required String password,
      required String userName});
  Future<bool> updateUser(MyUser user);
  Future<bool> logoutUser(MyUser user);
}

class UserRepositoryImpl implements UserRepository {
  static final fb = FirebaseAuth.instance;
  UserRepositoryImpl();
  @override
  Future<bool> logIn({required String email, required String password}) async {
    try {
      debugPrint("LOGIN CALLED $email , $password");
      UserCredential user =
          await fb.signInWithEmailAndPassword(email: email, password: password);
      debugPrint("LOGIN USER ${user.user.toString()}");
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<bool> signUp(
      {required String email,
      required String password,
      required String userName}) async {
    try {
      debugPrint("SIGNUP CALLED $email , $password");
      UserCredential user = await fb.createUserWithEmailAndPassword(
          email: email, password: password);
      debugPrint("SIGNUP USER ${user.user.toString()}");
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
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
