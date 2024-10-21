import 'package:flutter/material.dart';
import 'package:gemini_ai/src/core/constant/app_colors.dart';

class QuestionView extends StatelessWidget {
  final String text;
  const QuestionView({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 10),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: AppColors.textfieldFillColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}