import 'package:recipe_app/models/recipe.dart';

class MyUser {
  String? name;
  String? id;
  String? email;

  String? image;
  List<Recipe>? meals;
  List<String>? ingredients;
  MyUser({
    this.image,
    this.id,
    this.name,
    this.email,
    this.meals,
    this.ingredients,
  });

  MyUser.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    id = json['id'];
    name = json['name'];
    email = json['email'];

    ingredients = (json['ingredients'] ?? []).cast<String>();
    if (json['meals'] != null) {
      meals = <Recipe>[];
      json['meals'].forEach((v) {
        meals?.add(Recipe.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['email'] = email;
    data['id'] = id;
    data['ingredients'] = ingredients;
    if (meals != null) {
      data['meals'] = meals?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
