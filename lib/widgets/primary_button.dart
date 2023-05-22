import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  const PrimaryButton({Key? key, required this.title, required this.onPressed, this.height, this.width,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height??45,
      width: width??150,
      child: ElevatedButton(
        style: Constants.style,
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:  Text(title),
        ),
      ),
    );
  }
}
