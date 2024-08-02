import 'package:flutter/material.dart';
import 'package:flutter_app_todo_fri_c11/app_colors.dart';

// typedef MyValidator = String? Function(String?);

class CustomTextFormField extends StatelessWidget {
  String label;

  TextEditingController controller;

  String? Function(String?) validator;

  TextInputType keyboardType;

  bool obscureText;

  CustomTextFormField(
      {required this.label,
      required this.controller,
      required this.validator,
      this.keyboardType = TextInputType.text,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:
                    BorderSide(color: AppColors.primaryColor, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:
                    BorderSide(color: AppColors.primaryColor, width: 2)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColors.redColor, width: 2)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColors.redColor, width: 2)),
            labelText: label,
            errorMaxLines: 2),
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText,
      ),
    );
  }
}
