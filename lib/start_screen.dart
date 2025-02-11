import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.redirect, {super.key});

  final void Function() redirect;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(200, 255, 255, 255),
          ),
          SizedBox(height: 40),
          const Text(
            "Learn Flutter the fun way!",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 40),
          OutlinedButton.icon(
            onPressed: redirect,
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white, side: BorderSide.none),
            icon: const Icon(Icons.arrow_right_alt, color: Colors.white),
            label: Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
