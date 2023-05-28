import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/controllers/repo_controller.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/screens/search_screen.dart';
import 'package:recipe_app/states/user_cubit.dart';
import 'package:recipe_app/widgets/primary_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.PRIMARY_COLOR,
      appBar: AppBar(
        title: const Text(
          "Recipes Home",
          style: TextStyle(color: Constants.PRIMARY_COLOR),
        ),
        backgroundColor: Constants.SECONDARY_COLOR,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            PrimaryTextField(
              prefix: false,
              suffix: true,
              title: "Search",
              iconData: Icons.search,
              controller: _searchController,
              suffixOnTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return BlocProvider(
                      create: (context) =>
                          UserCubit(userRepository: UserRepositoryImpl()),
                      child: SearchScreen(
                        search: _searchController.text ?? "",
                      ),
                    );
                  },
                ));
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: Examples.categories.length,
              itemBuilder: (BuildContext context, int index) {
                String category = Examples.categories[index];
                List<Recipe> recipes = Examples.recipes
                    .where((recipe) => recipe.category == category)
                    .toList();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        category,
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Constants.SECONDARY_COLOR),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: recipes.length,
                        itemBuilder: (BuildContext context, int index) {
                          Recipe recipe = recipes[index];
                          return Container(
                            width: 160,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 120,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          NetworkImage(recipe.imageURL ?? ''),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  recipe.name ?? '',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Constants.SECONDARY_COLOR),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
