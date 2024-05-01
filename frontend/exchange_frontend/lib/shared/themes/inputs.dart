import 'package:flutter/material.dart';
import 'colors.dart';
import 'texts.dart';

class InputStyles {
  static InputDecoration defaultInputDecoration({
    required String hintText,
    required EdgeInsetsGeometry contentPadding,
    required BorderRadius borderRadius,
    required double borderWidth,
    required Color borderColor,
    required Color fillColor,
    required TextStyle hintStyle,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: hintStyle,
      contentPadding: contentPadding,
      filled: true,
      fillColor: fillColor,
      border: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(
          color: borderColor.withOpacity(0.7),
          width: borderWidth,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(
          color: borderColor,
          width: borderWidth,
        ),
      ),
    );
  }
}

class DefaultTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final void Function(String)? onSubmitted;

  const DefaultTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onSubmitted: onSubmitted,
      style: TextStyle(
            color: AppColors.primary,
            fontSize: 18, 
            fontWeight: FontWeight.bold,
          ),
      decoration: InputStyles.defaultInputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        borderRadius: BorderRadius.circular(8),
        borderWidth: 2,
        borderColor: AppColors.primary,
        
        fillColor: AppColors.background,
        hintStyle: TextStyles.mainText,
      ),
    );
  }
}

/*

USAGE EXAMPLE:

 child: DefaultTextField(
        hintText: 'Text inside',
        controller: _controller,
        onSubmitted: (value) {
          print('Input submitted: $value');
        },
      ),

*/