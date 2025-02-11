import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc_flutter/data/question.dart';
import "package:poc_flutter/question_summary/questions_summary.dart";

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chooseAnswers, required this.onRedirectToHome});

  final List<String> chooseAnswers;
  final void Function() onRedirectToHome;
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summaryData = [];
    for (int i = 0; i < chooseAnswers.length; i++) {
      summaryData.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chooseAnswers[i]
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestion = questions.length;
    final numCorrectQuestion = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 200,
              ),
              child: Text(
                'You answer $numCorrectQuestion out of $numTotalQuestion  question correctly',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRedirectToHome,
              icon: const Icon(Icons.refresh, color: Colors.white),
              label: const Text("Restart Quiz!"),
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.purple),
            )
          ],
        ),
      ),
    );
  }
}
