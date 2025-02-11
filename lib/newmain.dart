import 'package:flutter/material.dart';
import 'package:poc_flutter/gradient_container.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
          body: GradientContainer(colors: [Colors.red, Colors.yellow])),
    ),
  );
}
