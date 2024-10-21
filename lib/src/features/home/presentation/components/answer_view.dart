import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class AnswerView extends StatelessWidget {
  final String text;
  const AnswerView({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Markdown(
      data: text,
      styleSheet: MarkdownStyleSheet(
        p: const TextStyle(color: Colors.white),
        h1: const TextStyle(color: Colors.white),
        h2: const TextStyle(color: Colors.white),
        h3: const TextStyle(color: Colors.white),
        h4: const TextStyle(color: Colors.white),
        h5: const TextStyle(color: Colors.white),
        h6: const TextStyle(color: Colors.white),
        code: const TextStyle(
          color: Colors.white,
          backgroundColor: Colors.black,
        ),
        codeblockDecoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: Colors.white10),
        ),
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
