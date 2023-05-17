import 'package:recipe_app/models/recipe.dart';

class MyUser {
  String? name;
  String? email;
  String? dob;
  List<Recipe>? meals;
  List<String>? ingredients;
  MyUser(
      { 
        this.name,
        this.email,
        this.dob,
        this.meals,
        this.ingredients,});

  MyUser.fromJson(Map<String, dynamic> json) {

    name = json['name'];
    email = json['email'];
    dob = json['dob'];
    ingredients = json['ingredients'].cast<String>();
    if (json['meals'] != null) {
      meals = <Recipe>[];
      json['meals'].forEach((v) {
        meals?.add( Recipe.fromJson(v));
      });
    }
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
   data['email'] = email;
    data['dob'] = dob;
    data['ingredients'] = ingredients;
     if (meals != null) {
      data['meals'] = meals?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

