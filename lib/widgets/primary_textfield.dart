import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField(
      {Key? key,
      this.title,
      this.iconData,
      this.validator,
      this.onSaved,
      this.obscure,
      this.controller})
      : super(key: key);
  final String? title;
  final IconData? iconData;
  final String? Function(String?)? validator;
  final bool? obscure;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller ?? TextEditingController(),
      obscureText: obscure ?? false,
      validator: validator ?? (input) {},
      onSaved: onSaved,
      style: const TextStyle(color: Constants.SECONDARY_COLOR, fontSize: 18),
      cursorColor: Constants.SECONDARY_COLOR,
      decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Constants.SECONDARY_COLOR),
          ),
          focusColor: Constants.SECONDARY_COLOR,
          prefixIcon: Icon(
            iconData ?? Icons.text_fields,
            color: Constants.SECONDARY_COLOR,
          ),
          labelText: title ?? "",
          labelStyle: const TextStyle(color: Constants.SECONDARY_COLOR)),
    );
  }
}
