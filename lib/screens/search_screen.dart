import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:recipe_app/constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.search});
  final String search;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search Result ${widget.search == "" ? "" : "for ${widget.search}"}",
          style: const TextStyle(color: Constants.PRIMARY_COLOR),
        ),
        backgroundColor: Constants.SECONDARY_COLOR,
      ),
    );
  }
}
