import "package:flutter/material.dart";
import "package:poc_flutter/expense_tracker/widgets/expenses.dart";

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Expenses(),
    ),
  );
}
