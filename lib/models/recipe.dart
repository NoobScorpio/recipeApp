class Recipe {
  String? name;
  String? instructions;
  String? imageURL;
  String? category;
  List<String>? ingredients;
  Recipe({
    this.name,
    this.instructions,
    this.imageURL,
    this.category,
    this.ingredients,
  });

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

class Examples {
  static List<String> categories = ["Italian", "Asian", "Dessert", "Mexican"];
  static List<Recipe> recipes = [
    Recipe(
        name: 'Spaghetti Bolognese',
        instructions:
            '1. Cook spaghetti according to package instructions. ...',
        imageURL:
            'https://www.recipetineats.com/wp-content/uploads/2018/07/Spaghetti-Bolognese.jpg?resize=650,910',
        category: 'Italian',
        ingredients: [
          'spaghetti',
          'ground beef',
          'tomato sauce',
          'onion',
          'garlic'
        ]),
    Recipe(
        name: 'Chicken Stir Fry',
        instructions: '1. Heat oil in a wok or skillet over high heat. ...',
        imageURL:
            'https://www.momontimeout.com/wp-content/uploads/2018/11/chicken-stir-fry-733x1103.jpg',
        category: 'Asian',
        ingredients: [
          'chicken breast',
          'bell peppers',
          'broccoli',
          'soy sauce',
          'garlic'
        ]),
    Recipe(
        name: 'Caesar Salad',
        instructions: '1. In a large bowl, whisk together lemon juice, ...',
        imageURL:
            'https://natashaskitchen.com/wp-content/uploads/2019/01/Caesar-Salad-Recipe-3.jpg',
        category: 'Italian',
        ingredients: [
          'romaine lettuce',
          'croutons',
          'Parmesan cheese',
          'Caesar dressing'
        ]),
    Recipe(
        name: 'Chocolate Chip Cookies',
        instructions: '1. Preheat oven to 350°F (175°C). ...',
        imageURL:
            'https://joyfoodsunshine.com/wp-content/uploads/2018/02/best-chocolate-chip-cookies-recipe-1.jpg',
        category: 'Dessert',
        ingredients: [
          'flour',
          'butter',
          'sugar',
          'chocolate chips',
          'vanilla extract'
        ]),
    Recipe(
        name: 'Tomato Soup',
        instructions: '1. Heat olive oil in a large pot over medium heat. ...',
        imageURL:
            'https://natashaskitchen.com/wp-content/uploads/2021/08/Tomato-Soup-Recipe-4-728x1092.jpg',
        category: 'Asian',
        ingredients: [
          'tomatoes',
          'onion',
          'garlic',
          'vegetable broth',
          'cream'
        ]),
    Recipe(
        name: 'Tacos',
        instructions: '1. Heat oil in a skillet over medium heat. ...',
        imageURL:
            'https://houseofyumm.com/wp-content/uploads/2021/06/Taco-Meat-9-1024x1536.webp',
        category: 'Mexican',
        ingredients: [
          'ground beef',
          'taco shells',
          'lettuce',
          'tomato',
          'cheese'
        ]),
    Recipe(
        name: 'Mushroom Risotto',
        instructions: '1. In a saucepan, warm the broth over low heat. ...',
        imageURL:
            'https://www.allrecipes.com/thmb/resvgswnsI0RQEyDYQ9Z0hiB3kM=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/85389-gourmet-mushroom-risotto-DDMFS-4x3-a8a80a8deb064c6a8f15452b808a0258.jpg',
        category: 'Italian',
        ingredients: [
          'arborio rice',
          'mushrooms',
          'onion',
          'vegetable broth',
          'Parmesan cheese'
        ]),
    Recipe(
        name: 'Greek Salad',
        instructions: '1. In a large bowl, combine tomatoes, cucumbers, ...',
        imageURL:
            'https://cdn.loveandlemons.com/wp-content/uploads/2019/07/greek-salad-2-580x756.jpg',
        category: 'Italian',
        ingredients: [
          'tomatoes',
          'cucumbers',
          'red onion',
          'feta cheese',
          'olives'
        ]),
    Recipe(
        name: 'Pancakes',
        instructions: '1. In a large bowl, whisk together flour, sugar, ...',
        imageURL:
            'https://www.allrecipes.com/thmb/kvvETNZfOtAptH69gUsK6FaKRKA=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/21014-Good-old-Fashioned-Pancakes-mfs_001-1fa26bcdedc345f182537d95b6cf92d8.jpg',
        category: 'Dessert',
        ingredients: ['flour', 'sugar', 'milk', 'eggs', 'baking powder']),
    Recipe(
        name: 'Beef Stew',
        instructions: '1. In a large pot, heat oil over medium heat. ...',
        imageURL:
            'https://static01.nyt.com/images/2022/01/02/dining/15COOKING-OLD-BEEF-STEW2/15COOKING-OLD-BEEF-STEW2-master768-v2.jpg?w=1280&q=75',
        category: 'Mexican',
        ingredients: ['beef', 'carrots', 'potatoes', 'onion', 'beef broth']),
    Recipe(
        name: 'Chicken Noodle Soup',
        instructions: '1. In a large pot, melt butter over medium heat. ...',
        imageURL:
            'https://tastesbetterfromscratch.com/wp-content/uploads/2017/10/Chicken-Noodle-Soup-2.jpg',
        category: 'Asian',
        ingredients: [
          'chicken broth',
          'chicken breast',
          'carrots',
          'celery',
          'egg noodles'
        ]),
    Recipe(
        name: 'Guacamole',
        instructions: '1. In a bowl, mash together avocados, lime juice, ...',
        imageURL:
            'https://www.simplyrecipes.com/thmb/gQrUfEn77ShJ1bitzFR5HrtA93k=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/__opt__aboutcom__coeus__resources__content_migration__simply_recipes__uploads__2018__07__Guacamole-LEAD-4-1175d935cccd4c90829b5c1628994e58.jpg',
        category: 'Mexican',
        ingredients: ['avocados', 'lime juice', 'onion', 'tomato', 'cilantro']),
    Recipe(
        name: 'Cheesecake',
        instructions: '1. Preheat oven to 325°F (165°C). ...',
        imageURL:
            'https://sugarspunrun.com/wp-content/uploads/2019/01/Best-Cheesecake-Recipe-2-1-of-1-7.jpg',
        category: 'Dessert',
        ingredients: [
          'cream cheese',
          'sugar',
          'eggs',
          'vanilla extract',
          'graham cracker crust'
        ])
  ];
}
