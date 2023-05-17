class Recipe {
  String? name;
  String? instructions;
  String? imageURL;
   String? category;
  List<String>? ingredients;
  Recipe(
      { 
        this.name,
        this.instructions,
        this.imageURL,
        this.category,
        this.ingredients,});

  Recipe.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    instructions = json['instructions'];
    imageURL = json['imageURL'];
    category = json['category'];
    ingredients = json['ingredients'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

  data['name'] = name;
  data['instructions'] = instructions;
  data['imageURL'] = imageURL;
  data['category'] = category;
  data['ingredients'] = ingredients;
  return data;
  }
}
