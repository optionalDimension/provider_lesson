import 'package:flutter/material.dart';
import 'package:provider_lesson/models/activity.dart';
import 'package:provider_lesson/models/meal.dart';
import 'package:provider_lesson/services/api.dart';

class CounterProvider extends ChangeNotifier {
  int counter = 0;
  Color color = Colors.red;
  double height = 300.0;
  ActivityModel? activityModel;
  List<MealModel>? meals;
  bool isLoading = false;

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

  void getActivity() async {
    setStatus(true);
    // ActivityModel data = await Api().getActivity();
    // setActivity(data);
  }

  setActivity(data) {
    activityModel = data;
    setStatus(false);
    notifyListeners();
  }

  setStatus(value) {
    isLoading = value;
  }

  void listMeal() async {
    setStatus(true);
    List<MealModel> data = await Api().listMeals();
    setMeal(data);
  }

  setMeal(data) {
    meals = data;
    setStatus(false);
    notifyListeners();
  }
}
