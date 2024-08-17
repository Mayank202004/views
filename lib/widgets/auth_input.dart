import 'package:flutter/material.dart';
import 'package:views/utils/type_def.dart';

class authInput extends StatelessWidget {
  final TextEditingController controller;
  final String label,hinttext;
  final bool isPassword;
  final ValidatorCallback validatorCallback;

  const authInput({super.key, required this.label, required this.hinttext, this.isPassword=false, required this.controller, required this.validatorCallback});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator:validatorCallback,
      obscureText: isPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
        ),
        label: Text(label),
        hintText: hinttext,
      ),
    );
  }
}
