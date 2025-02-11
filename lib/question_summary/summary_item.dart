import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:poc_flutter/question_summary/question_identifier.dart";

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});
  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: QuestionIdentifier(
                    isCorrectAnswer: isCorrectAnswer,
                    questionIndex: itemData['question_index'] as int),
              )
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(itemData['question'] as String,
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 16,
                    )),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Your Answer: ${itemData['user_answer']}',
                  style: TextStyle(
                      color: isCorrectAnswer ? Colors.green : Colors.red),
                ),
                Text(
                  'Correct Answer: ${itemData['correct_answer']}',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
