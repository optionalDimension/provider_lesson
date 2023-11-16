import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:provider_lesson/models/activity.dart';
import 'package:provider_lesson/models/meal.dart';

class Api {
  // final baseURL = 'https://www.boredapi.com/api/activity';
  final mealURL = 'https://www.themealdb.com/api/json/v1/1/random.php';

  final dio = Dio();

  // Future<ActivityModel> getActivity() async {
  //   Response response;
  //   response = await dio.get(baseURL, queryParameters: {'participants': 1});
  //   log(response.data.toString());

  //   return ActivityModel.fromJson(response.data);
  // }

  Future<List<MealModel>> listMeals() async {
    Response response;
    response = await dio.get(mealURL);
    log(response.data.toString());
    return parseMealModels(response.data);
  }

  List<MealModel> parseMealModels(Map<String, dynamic> json) {
    List<dynamic> mealsJson = json['meals'];
    return mealsJson.map((mealJson) => MealModel.fromJson(mealJson)).toList();
  }
}
