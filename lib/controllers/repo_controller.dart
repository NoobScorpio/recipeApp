import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/models/myuser.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bloc/bloc.dart';

abstract class UserRepository {
  Future<MyUser> logIn({required String email, required String password});
  Future<MyUser> getUser();
  Future<MyUser> signUp(
      {required String email,
      required String password,
      required String userName});
  Future<bool> updateUser(MyUser user);
  Future<bool> logoutUser(MyUser user);
  Future<List<Recipe>> getRecipes();
}

class UserRepositoryImpl implements UserRepository {
  static final fb = FirebaseAuth.instance;
  final userRef = FirebaseFirestore.instance.collection("user");
  final recipeRef = FirebaseFirestore.instance.collection("recipe");
  UserRepositoryImpl();
  @override
  Future<MyUser> logIn(
      {required String email, required String password}) async {
    try {
      debugPrint("LOGIN CALLED $email , $password");
      UserCredential userCreds =
          await fb.signInWithEmailAndPassword(email: email, password: password);
      debugPrint("LOGIN USER ${userCreds.user.toString()}");
      var user = await userRef.doc(userCreds.user!.uid).get();

      MyUser myUser = MyUser.fromJson(user.data()!);

      return myUser;
    } catch (e) {
      debugPrint("LOGIN FAILED");
      debugPrint(e.toString());
      return MyUser(id: "");
    }
  }

  @override
  Future<MyUser> signUp(
      {required String email,
      required String password,
      required String userName}) async {
    try {
      debugPrint("SIGNUP CALLED $email , $password");
      UserCredential userCreds = await fb.createUserWithEmailAndPassword(
          email: email, password: password);
      MyUser user = MyUser(
          email: email,
          id: userCreds.user!.uid,
          name: userName,
          image: "",
          meals: [],
          ingredients: []);
      await userRef.doc(user.id).set(user.toJson());

      return user;
    } catch (e) {
      debugPrint("SIGNUP FAILED");
      debugPrint(e.toString());
      return MyUser(id: "");
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

  @override
  Future<List<Recipe>> getRecipes() {
    throw UnimplementedError();
  }

  @override
  Future<MyUser> getUser() async {
    var uid = fb.currentUser!.uid;
    debugPrint("GETUSER USER $uid");
    var u = await userRef.doc(uid).get();
    MyUser user = MyUser.fromJson(u.data()!);
    debugPrint("GETUSER USER ${user.toJson()}");
    return user;
  }
}
