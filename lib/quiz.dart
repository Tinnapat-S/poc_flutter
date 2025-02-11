import 'package:flutter/material.dart';
import 'package:poc_flutter/quiz_screen.dart';
import 'package:poc_flutter/start_screen.dart';
import 'package:poc_flutter/data/question.dart';
import "package:poc_flutter/results_screen.dart";

enum ActiveScreen { start, question, results }

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  ActiveScreen activeScreen = ActiveScreen.start;

  @override
  void initState() {
    activeScreen = ActiveScreen.start;
    super.initState();
  }

  void chooseAnswer(String answer) {
    setState(() {
      selectedAnswer.add(answer);
      if (selectedAnswer.length == questions.length) {
        activeScreen = ActiveScreen.results;
      }
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = ActiveScreen.question;
    });
  }

  void startScreen() {
    setState(() {
      activeScreen = ActiveScreen.start;
      selectedAnswer = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == ActiveScreen.question) {
      screenWidget = QuizScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == ActiveScreen.results) {
      screenWidget = ResultsScreen(
          onRedirectToHome: startScreen, chooseAnswers: selectedAnswer);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
