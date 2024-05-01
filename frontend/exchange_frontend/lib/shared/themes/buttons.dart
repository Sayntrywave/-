import 'package:flutter/material.dart';
import 'colors.dart';

class ButtonStyles {
  static final ButtonStyle defaultStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );
}

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const DefaultButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0), 
      child: ElevatedButton(
        style: ButtonStyles.defaultStyle,
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.background,
            fontSize: 18, 
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

/* 

USAGE EXAMPLE:

child: DefaultButton(
        text: 'Do action',
        onPressed: myAction,
      ),

*/
