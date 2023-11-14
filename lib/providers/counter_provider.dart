import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int counter = 0;
  Color color = Colors.red;
  double height = 300.0;

  void incrementCounter() {
    counter++;
    color = Colors.amber;
    height = 300;
    notifyListeners();
  }

  void decrementCounter() {
    counter--;
    color = Colors.orange;
    height = 600;
    notifyListeners();
  }
}
